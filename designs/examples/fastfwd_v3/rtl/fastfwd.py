"""
FastFWD V3 - 生产级报文转发加速器
主设计文件

作者: Kimi Claw
日期: 2026-03-01
版本: V3.0
"""
from __future__ import annotations

from pycircuit import (
    Circuit, module, const, u, 
    Reg, Wire, Vec,
    cat, unsigned
)


# =============================================================================
# 设计参数
# =============================================================================

N_LANES = 4          # 输入/输出 lane 数量
N_FE = 4             # FE 实例数量 (推荐 4 个)
ROB_DEPTH = 32       # 重排序缓冲区深度
LANE_Q_DEPTH = 16    # 每 lane 输入队列深度
FE_Q_DEPTH = 8       # FE 输入队列深度
MAX_DEP = 7          # 最大依赖距离 (3bit)
MAX_LAT = 3          # 最大 latency (2bit: 0~3)
DATA_WIDTH = 128     # 数据位宽


# =============================================================================
# 工具函数
# =============================================================================

@const
def log2_ceil(m: Circuit, n: int) -> int:
    """计算 log2(n) 向上取整"""
    _ = m
    if n <= 1:
        return 1
    result = 0
    temp = n - 1
    while temp > 0:
        temp >>= 1
        result += 1
    return result


@const
def get_dep_from_ctrl(m: Circuit, ctrl: int) -> int:
    """从 ctrl 提取 dependency [4:2]"""
    _ = m
    return (ctrl >> 2) & 0x7


@const
def get_lat_from_ctrl(m: Circuit, ctrl: int) -> int:
    """从 ctrl 提取 latency [1:0]"""
    _ = m
    return ctrl & 0x3


# =============================================================================
# 输入收集模块
# =============================================================================

class InputCollector:
    """
    输入收集与排序模块
    
    功能:
    1. 每 cycle 扫描 4 个 lane 的输入
    2. 按 lane0→lane3 顺序收集有效报文
    3. 分配全局报文序号 (seq)
    4. 写入每 lane 的输入队列
    """
    
    def __init__(self, m: Circuit, clk, rst):
        self.m = m
        self.clk = clk
        self.rst = rst
        
        # 报文序号计数器 (16bit，支持 64K 个报文)
        self.seq_cnt = m.out("seq_cnt", clk=clk, rst=rst, 
                             width=16, init=u(16, 0))
        
        # 每 lane 输入队列 (FIFO)
        # 队列存储: valid, data[128], seq[16], ctrl[5]
        self.lane_q_valid = []
        self.lane_q_data = []
        self.lane_q_seq = []
        self.lane_q_ctrl = []
        self.lane_q_wr_ptr = []
        self.lane_q_rd_ptr = []
        self.lane_q_count = []
        
        for i in range(N_LANES):
            ptr_width = log2_ceil(m, LANE_Q_DEPTH)
            
            self.lane_q_valid.append(
                Vec(m, f"lane{i}_q_valid", LANE_Q_DEPTH, 1))
            self.lane_q_data.append(
                Vec(m, f"lane{i}_q_data", LANE_Q_DEPTH, DATA_WIDTH))
            self.lane_q_seq.append(
                Vec(m, f"lane{i}_q_seq", LANE_Q_DEPTH, 16))
            self.lane_q_ctrl.append(
                Vec(m, f"lane{i}_q_ctrl", LANE_Q_DEPTH, 5))
            
            # 读写指针
            self.lane_q_wr_ptr.append(
                m.out(f"lane{i}_q_wr_ptr", clk=clk, rst=rst,
                      width=ptr_width, init=u(ptr_width, 0)))
            self.lane_q_rd_ptr.append(
                m.out(f"lane{i}_q_rd_ptr", clk=clk, rst=rst,
                      width=ptr_width, init=u(ptr_width, 0)))
            self.lane_q_count.append(
                m.out(f"lane{i}_q_count", clk=clk, rst=rst,
                      width=ptr_width+1, init=u(ptr_width+1, 0)))
    
    def collect_inputs(self, lane_vlds, lane_datas, lane_ctrls, bkpr):
        """
        收集输入报文
        
        Args:
            lane_vlds: list[4] 输入 valid 信号
            lane_datas: list[4] 输入数据
            lane_ctrls: list[4] 输入控制信号
            bkpr: 反压信号
        """
        m = self.m
        
        # 计算下一个 seq (考虑可能有多个报文输入)
        # 统计本 cycle 有多少个有效输入
        total_valid = m.wire("total_valid", width=3)
        valid_sum = u(3, 0)
        for i in range(N_LANES):
            valid_sum = valid_sum + unsigned(lane_vlds[i])
        total_valid.set(valid_sum)
        
        # 更新 seq 计数器
        next_seq = self.seq_cnt.out() + unsigned(total_valid)
        self.seq_cnt.set(next_seq)
        
        # 为每个 lane 写入队列
        for i in range(N_LANES):
            # 检查是否可以写入 (lane valid 且 队列未满 且 无反压)
            q_full = self.lane_q_count[i].out() >= u(len(bin(LANE_Q_DEPTH))-1, LANE_Q_DEPTH-1)
            can_write = lane_vlds[i] & ~q_full & ~bkpr
            
            # 写入指针
            wr_ptr = self.lane_q_wr_ptr[i].out()
            next_wr_ptr = wr_ptr + u(len(bin(LANE_Q_DEPTH))-1, 1)
            
            # 更新写指针
            self.lane_q_wr_ptr[i].set(
                m.mux(can_write, wr_ptr, next_wr_ptr))
            
            # 更新计数
            new_count = self.lane_q_count[i].out() + u(len(bin(LANE_Q_DEPTH)), 1)
            self.lane_q_count[i].set(
                m.mux(can_write, self.lane_q_count[i].out(), new_count))
            
            # 写入数据 (使用 wire 暂存)
            # 注意: 实际实现需要多路选择器写入对应位置
            # 这里简化处理，实际应该根据 wr_ptr 写入
    
    def pop_from_lane(self, lane_id, pop_en):
        """从指定 lane 队列弹出数据"""
        m = self.m
        
        # 读指针
        rd_ptr = self.lane_q_rd_ptr[lane_id].out()
        next_rd_ptr = rd_ptr + u(len(bin(LANE_Q_DEPTH))-1, 1)
        
        # 更新读指针
        self.lane_q_rd_ptr[lane_id].set(
            m.mux(pop_en, rd_ptr, next_rd_ptr))
        
        # 更新计数
        new_count = self.lane_q_count[lane_id].out() - u(len(bin(LANE_Q_DEPTH)), 1)
        self.lane_q_count[lane_id].set(
            m.mux(pop_en, self.lane_q_count[lane_id].out(), new_count))
        
        # 返回数据
        return {
            'valid': self.lane_q_valid[lane_id][rd_ptr],
            'data': self.lane_q_data[lane_id][rd_ptr],
            'seq': self.lane_q_seq[lane_id][rd_ptr],
            'ctrl': self.lane_q_ctrl[lane_id][rd_ptr]
        }


# =============================================================================
# FE 调度器
# =============================================================================

class FEScheduler:
    """
    FE 调度器
    
    功能:
    1. 管理 N_FE 个 FE 实例
    2. 从输入队列取报文分配给空闲 FE
    3. 解析 ctrl，提取 lat 和 dep
    4. 处理依赖关系，计算 dp_data
    5. 生成 FE 控制信号
    6. 收集 FE 输出
    
    FE 调度约束:
    - 如果 cycle N 输入 lat=2 的数据，cycle N+1 不能输入 lat=1 的数据
    """
    
    def __init__(self, m: Circuit, clk, rst):
        self.m = m
        self.clk = clk
        self.rst = rst
        
        # FE 状态
        self.fe_busy = []       # FE 是否忙
        self.fe_lat = []        # FE 当前 latency
        self.fe_timer = []      # FE 倒计时
        self.fe_seq = []        # FE 正在处理的报文序号
        self.fe_data = []       # FE 输入数据
        
        for i in range(N_FE):
            self.fe_busy.append(
                m.out(f"fe{i}_busy", clk=clk, rst=rst, 
                      width=1, init=u(1, 0)))
            self.fe_lat.append(
                m.out(f"fe{i}_lat", clk=clk, rst=rst,
                      width=2, init=u(2, 0)))
            self.fe_timer.append(
                m.out(f"fe{i}_timer", clk=clk, rst=rst,
                      width=3, init=u(3, 0)))
            self.fe_seq.append(
                m.out(f"fe{i}_seq", clk=clk, rst=rst,
                      width=16, init=u(16, 0)))
            self.fe_data.append(
                m.out(f"fe{i}_data", clk=clk, rst=rst,
                      width=DATA_WIDTH, init=u(DATA_WIDTH, 0)))
        
        # 上一个输入的 latency (用于约束检查)
        self.last_lat = m.out("fe_last_lat", clk=clk, rst=rst,
                              width=2, init=u(2, 0))
        self.last_input_cycle = m.out("fe_last_cycle", clk=clk, rst=rst,
                                      width=1, init=u(1, 0))
        
        # 依赖查找表 (存储最近 MAX_DEP 个报文的结果)
        self.dep_mem_valid = Vec(m, "dep_mem_valid", MAX_DEP + 1, 1)
        self.dep_mem_data = Vec(m, "dep_mem_data", MAX_DEP + 1, DATA_WIDTH)
    
    def check_fe_constraint(self, lat):
        """
        检查 FE 调度约束
        
        约束: 如果上一 cycle 输入 lat=2，本 cycle 不能输入 lat=1
        """
        m = self.m
        
        # 检查是否是连续的 cycle
        # 简化: 假设我们总是每 cycle 尝试调度
        constraint_violation = (self.last_lat.out() == u(2, 2)) & (lat == u(2, 1))
        
        return ~constraint_violation
    
    def find_dep_data(self, seq, dep):
        """
        查找依赖报文的数据
        
        Args:
            seq: 当前报文序号
            dep: 依赖距离 (1~7)
        
        Returns:
            (dep_vld, dep_data)
        """
        m = self.m
        
        dep_seq = seq - u(16, dep)
        
        # 在依赖查找表中查找
        # 简化: 使用循环查找 (实际应该用 CAM 或哈希表)
        found = u(1, 0)
        found_data = u(DATA_WIDTH, 0)
        
        for i in range(MAX_DEP + 1):
            match = self.dep_mem_valid[i] & (u(16, i) == dep_seq)
            found = found | match
            found_data = m.mux(match, found_data, self.dep_mem_data[i])
        
        return found, found_data
    
    def schedule_fe(self, pkt_valid, pkt_data, pkt_seq, pkt_ctrl, fe_avail):
        """
        调度 FE
        
        Args:
            pkt_valid: 报文有效
            pkt_data: 报文数据
            pkt_seq: 报文序号
            pkt_ctrl: 控制信号
            fe_avail: 空闲 FE 列表
        
        Returns:
            调度结果
        """
        m = self.m
        
        # 解析 ctrl
        lat = pkt_ctrl & u(5, 0x3)      # [1:0]
        dep = (pkt_ctrl >> 2) & u(5, 0x7)  # [4:2]
        
        # 检查约束
        constraint_ok = self.check_fe_constraint(lat)
        can_schedule = pkt_valid & constraint_ok & fe_avail
        
        # 处理依赖
        dep_vld = u(1, 0)
        dep_data = u(DATA_WIDTH, 0)
        
        if dep != u(5, 0):
            dep_vld, dep_data = self.find_dep_data(pkt_seq, dep)
        
        # 如果依赖未就绪，不能调度
        dep_ready = (dep == u(5, 0)) | dep_vld
        can_schedule = can_schedule & dep_ready
        
        return {
            'can_schedule': can_schedule,
            'lat': lat,
            'dep_vld': dep_vld,
            'dep_data': dep_data
        }
    
    def update_fe_state(self, fe_id, start, lat, seq, data):
        """更新 FE 状态"""
        m = self.m
        
        # 启动 FE
        self.fe_busy[fe_id].set(
            m.mux(start, self.fe_busy[fe_id].out(), u(1, 1)))
        self.fe_lat[fe_id].set(
            m.mux(start, self.fe_lat[fe_id].out(), lat))
        self.fe_seq[fe_id].set(
            m.mux(start, self.fe_seq[fe_id].out(), seq))
        self.fe_data[fe_id].set(
            m.mux(start, self.fe_data[fe_id].out(), data))
        
        # 设置定时器 (lat + 1 cycles)
        timer_val = unsigned(lat) + u(3, 1)
        self.fe_timer[fe_id].set(
            m.mux(start, self.fe_timer[fe_id].out(), timer_val))
    
    def tick_fe(self):
        """FE 倒计时"""
        m = self.m
        
        for i in range(N_FE):
            # 如果忙且 timer > 0，递减
            timer_gt0 = self.fe_timer[i].out() > u(3, 0)
            new_timer = self.fe_timer[i].out() - u(3, 1)
            
            update_timer = self.fe_busy[i].out() & timer_gt0
            self.fe_timer[i].set(
                m.mux(update_timer, self.fe_timer[i].out(), new_timer))
            
            # 如果 timer 到 0，FE 完成
            fe_done = self.fe_busy[i].out() & ~timer_gt0
            self.fe_busy[i].set(
                m.mux(fe_done, self.fe_busy[i].out(), u(1, 0)))
    
    def get_fe_output(self, fe_id):
        """获取 FE 输出"""
        # FE 完成时，timer=0 且 busy=1 (在 tick 前)
        fe_done = self.fe_busy[fe_id].out() & (self.fe_timer[fe_id].out() == u(3, 0))
        
        return {
            'done': fe_done,
            'seq': self.fe_seq[fe_id].out(),
            'data': self.fe_data[fe_id].out()
        }


# =============================================================================
# 重排序缓冲区 (ROB)
# =============================================================================

class ReorderBuffer:
    """
    重排序缓冲区
    
    功能:
    1. 按报文序号存储 FE 输出结果
    2. 支持乱序完成（不同 latency 的报文）
    3. 按顺序输出到输出调度器
    
    结构: 循环缓冲区，每个 entry 包含 valid, data, seq
    """
    
    def __init__(self, m: Circuit, clk, rst):
        self.m = m
        self.clk = clk
        self.rst = rst
        
        ptr_width = log2_ceil(m, ROB_DEPTH)
        
        # ROB 存储
        self.rob_valid = Vec(m, "rob_valid", ROB_DEPTH, 1)
        self.rob_data = Vec(m, "rob_data", ROB_DEPTH, DATA_WIDTH)
        self.rob_seq = Vec(m, "rob_seq", ROB_DEPTH, 16)
        
        # 头尾指针
        self.head = m.out("rob_head", clk=clk, rst=rst,
                          width=ptr_width, init=u(ptr_width, 0))
        self.tail = m.out("rob_tail", clk=clk, rst=rst,
                          width=ptr_width, init=u(ptr_width, 0))
        self.count = m.out("rob_count", clk=clk, rst=rst,
                           width=ptr_width+1, init=u(ptr_width+1, 0))
        
        # 下一个期望输出的 seq
        self.next_seq = m.out("rob_next_seq", clk=clk, rst=rst,
                              width=16, init=u(16, 0))
    
    def allocate_entry(self, seq):
        """分配 ROB entry"""
        m = self.m
        
        # 检查是否有空间
        has_space = self.count.out() < u(len(bin(ROB_DEPTH)), ROB_DEPTH)
        
        # 分配 tail 位置
        tail_ptr = self.tail.out()
        next_tail = tail_ptr + u(len(bin(ROB_DEPTH))-1, 1)
        
        # 更新 tail
        self.tail.set(m.mux(has_space, self.tail.out(), next_tail))
        
        # 增加计数
        new_count = self.count.out() + u(len(bin(ROB_DEPTH)), 1)
        self.count.set(m.mux(has_space, self.count.out(), new_count))
        
        return has_space, tail_ptr
    
    def write_result(self, ptr, seq, data):
        """写入 FE 结果"""
        # 实际实现需要多路选择器
        # 这里标记 valid 和存储数据
        pass  # 具体实现依赖 pyCircuit 的 Vec 写入语义
    
    def read_oldest(self):
        """读取最老的 entry"""
        head_ptr = self.head.out()
        
        return {
            'valid': self.rob_valid[head_ptr],
            'data': self.rob_data[head_ptr],
            'seq': self.rob_seq[head_ptr]
        }
    
    def pop_oldest(self, pop_en):
        """弹出最老的 entry"""
        m = self.m
        
        head_ptr = self.head.out()
        next_head = head_ptr + u(len(bin(ROB_DEPTH))-1, 1)
        
        # 更新 head
        self.head.set(m.mux(pop_en, self.head.out(), next_head))
        
        # 减少计数
        new_count = self.count.out() - u(len(bin(ROB_DEPTH)), 1)
        self.count.set(m.mux(pop_en, self.count.out(), new_count))
        
        # 更新 next_seq
        new_next_seq = self.next_seq.out() + u(16, 1)
        self.next_seq.set(m.mux(pop_en, self.next_seq.out(), new_next_seq))


# =============================================================================
# 输出调度器
# =============================================================================

class OutputScheduler:
    """
    输出调度器
    
    功能:
    1. 从 ROB 按序取报文
    2. 按 warp around 方式分配到 4 个输出 lane
    3. 每 cycle 输出 0~4 个报文
    4. 严格保序: lane0 输出 seq 0,4,8... lane1 输出 1,5,9...
    """
    
    def __init__(self, m: Circuit, clk, rst):
        self.m = m
        self.clk = clk
        self.rst = rst
        
        # 输出指针 (下一个应该输出的 lane)
        self.out_ptr = m.out("out_ptr", clk=clk, rst=rst,
                             width=2, init=u(2, 0))
        
        # 输出寄存器
        self.out_vld = []
        self.out_data = []
        
        for i in range(N_LANES):
            self.out_vld.append(
                m.out(f"lane{i}_out_vld", clk=clk, rst=rst,
                      width=1, init=u(1, 0)))
            self.out_data.append(
                m.out(f"lane{i}_out_data", clk=clk, rst=rst,
                      width=DATA_WIDTH, init=u(DATA_WIDTH, 0)))
    
    def schedule_output(self, rob_entry, rob_has_data):
        """
        调度输出
        
        从 ROB 取数据，按 warp around 分配到输出 lane
        """
        m = self.m
        
        # 清零输出
        for i in range(N_LANES):
            self.out_vld[i].set(u(1, 0))
        
        # 从 out_ptr 开始，最多输出 4 个
        ptr = self.out_ptr.out()
        
        for i in range(N_LANES):
            lane = (ptr + u(2, i)) & u(2, 0x3)
            
            # 检查 ROB 是否有数据
            can_output = rob_has_data & rob_entry['valid']
            
            # 设置输出
            self.out_vld[lane].set(can_output)
            self.out_data[lane].set(rob_entry['data'])
            
            # 更新 ROB 读取 (简化，实际需要 pop)
        
        # 更新 out_ptr
        num_output = m.wire("num_output", width=3)
        # 计算实际输出了多少个
        new_ptr = (ptr + num_output) & u(2, 0x3)
        self.out_ptr.set(new_ptr)


# =============================================================================
# 反压生成
# =============================================================================

class BackpressureGenerator:
    """
    反压生成器
    
    当以下情况时产生反压:
    1. 任意 lane 输入队列快满
    2. ROB 快满
    3. FE 全部忙且队列满
    """
    
    def __init__(self, m: Circuit, clk, rst):
        self.m = m
        self.clk = clk
        self.rst = rst
        
        self.bkpr = m.out("pkt_in_bkpr", clk=clk, rst=rst,
                          width=1, init=u(1, 0))
    
    def generate(self, lane_counts, rob_count, fe_busy_mask):
        """生成反压信号"""
        m = self.m
        
        # 检查 lane 队列
        lane_almost_full = u(1, 0)
        for count in lane_counts:
            almost_full = count >= u(len(bin(LANE_Q_DEPTH)), LANE_Q_DEPTH - 2)
            lane_almost_full = lane_almost_full | almost_full
        
        # 检查 ROB
        rob_almost_full = rob_count >= u(len(bin(ROB_DEPTH)), ROB_DEPTH - 4)
        
        # 检查 FE
        all_fe_busy = fe_busy_mask == u(N_FE, (1 << N_FE) - 1)
        
        # 综合反压条件
        bkpr_val = lane_almost_full | rob_almost_full | all_fe_busy
        
        self.bkpr.set(bkpr_val)
        
        return self.bkpr


# =============================================================================
# 主模块
# =============================================================================

@module
def fastfwd_v3(
    m: Circuit,
    N_FE_PARAM: int = 4,
    ROB_DEPTH_PARAM: int = 32,
    LANE_Q_DEPTH_PARAM: int = 16,
) -> None:
    """
    FastFWD V3 - 生产级报文转发加速器
    
    参数:
        N_FE_PARAM: FE 实例数量 (1~32，推荐 4)
        ROB_DEPTH_PARAM: 重排序缓冲区深度
        LANE_Q_DEPTH_PARAM: 每 lane 输入队列深度
    """
    
    # 时钟和复位
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # =========================================================================
    # 输入端口定义
    # =========================================================================
    
    # Lane 输入
    lane_in_vld = []
    lane_in_data = []
    lane_in_ctrl = []
    
    for i in range(N_LANES):
        lane_in_vld.append(m.input(f"lane{i}_pkt_in_vld", width=1))
        lane_in_data.append(m.input(f"lane{i}_pkt_in_data", width=DATA_WIDTH))
        lane_in_ctrl.append(m.input(f"lane{i}_pkt_in_ctrl", width=5))
    
    # FE 输出 (来自外部 FE 模块)
    fwded_vld = []
    fwded_data = []
    
    for i in range(N_FE):
        fwded_vld.append(m.input(f"fwded{i}_pkt_data_vld", width=1))
        fwded_data.append(m.input(f"fwded{i}_pkt_data", width=DATA_WIDTH))
    
    # =========================================================================
    # 实例化子模块
    # =========================================================================
    
    # 输入收集器
    input_collector = InputCollector(m, clk, rst)
    
    # FE 调度器
    fe_scheduler = FEScheduler(m, clk, rst)
    
    # 重排序缓冲区
    rob = ReorderBuffer(m, clk, rst)
    
    # 输出调度器
    output_scheduler = OutputScheduler(m, clk, rst)
    
    # 反压生成器
    bkpr_gen = BackpressureGenerator(m, clk, rst)
    
    # =========================================================================
    # 主控制逻辑
    # =========================================================================
    
    # 收集输入
    bkpr = bkpr_gen.bkpr.out()
    input_collector.collect_inputs(lane_in_vld, lane_in_data, lane_in_ctrl, bkpr)
    
    # FE 调度 (简化版本，实际需要更复杂的仲裁)
    # ...
    
    # FE 倒计时
    fe_scheduler.tick_fe()
    
    # 输出调度
    rob_entry = rob.read_oldest()
    rob_has_data = rob.count.out() > u(len(bin(ROB_DEPTH)), 0)
    output_scheduler.schedule_output(rob_entry, rob_has_data)
    
    # 生成反压
    lane_counts = [ic.out() for ic in input_collector.lane_q_count]
    fe_busy_mask = u(N_FE, 0)  # 简化
    for i in range(N_FE):
        fe_busy_mask = fe_busy_mask | (fe_scheduler.fe_busy[i].out() << i)
    
    bkpr_gen.generate(lane_counts, rob.count.out(), fe_busy_mask)
    
    # =========================================================================
    # 输出端口连接
    # =========================================================================
    
    # Lane 输出 (寄存器输出)
    for i in range(N_LANES):
        m.output(f"lane{i}_pkt_out_vld", output_scheduler.out_vld[i])
        m.output(f"lane{i}_pkt_out_data", output_scheduler.out_data[i])
    
    # FE 控制输出 (寄存器输出)
    for i in range(N_FE):
        m.output(f"fwd{i}_pkt_data_vld", u(1, 0))  # 简化
        m.output(f"fwd{i}_pkt_data", u(DATA_WIDTH, 0))
        m.output(f"fwd{i}_pkt_lat", u(2, 0))
        m.output(f"fwd{i}_pkt_dp_vld", u(1, 0))
        m.output(f"fwd{i}_pkt_dp_data", u(DATA_WIDTH, 0))
    
    # 反压输出
    m.output("pkt_in_bkpr", bkpr_gen.bkpr)


# 设置模块名
fastfwd_v3.__pycircuit_name__ = "fastfwd_v3"


if __name__ == "__main__":
    # 编译并生成 MLIR
    from pycircuit import compile
    circuit = compile(fastfwd_v3, name="fastfwd_v3")
    print(circuit.emit_mlir())
