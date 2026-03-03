"""
FastFWD V3.3 Verilog Generator
生成可综合的Verilog RTL
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent / "rtl"))

from fastfwd_v3_3 import fastfwd_v3_3, N_LANES, N_FE, DATA_WIDTH, CTRL_WIDTH, SEQ_WIDTH, MAX_DEP, ROB_DEPTH
from pycircuit import compile


def generate_verilog():
    """生成Verilog代码"""
    
    # 编译电路
    circuit = compile(fastfwd_v3_3, name="fastfwd_v3_3")
    
    # 获取MLIR
    mlir = circuit.emit_mlir()
    
    # 保存MLIR
    mlir_path = Path(__file__).parent.parent / "mlir" / "fastfwd_v3_3.mlir"
    mlir_path.parent.mkdir(exist_ok=True)
    mlir_path.write_text(mlir)
    print(f"MLIR saved to: {mlir_path}")
    
    # 手动生成Verilog (因为pycc不可用)
    verilog = emit_verilog_manual()
    
    verilog_path = Path(__file__).parent.parent / "verilog" / "fastfwd_v3_3.v"
    verilog_path.parent.mkdir(exist_ok=True)
    verilog_path.write_text(verilog)
    print(f"Verilog saved to: {verilog_path}")
    
    return mlir_path, verilog_path


def emit_verilog_manual():
    """手动生成Verilog - 基于V3.3设计"""
    
    verilog = f"""// FastFWD V3.3 Verilog RTL
// Auto-generated from pyCircuit
// Date: 2026-03-03

module fastfwd_v3_3 (
    input  wire clk,
    input  wire rst,
    
    // Input ports - 4 lanes
    input  wire [3:0] lane_pkt_in_vld,
    input  wire [{DATA_WIDTH}*4-1:0] lane_pkt_in_data,
    input  wire [{CTRL_WIDTH}*4-1:0] lane_pkt_in_ctrl,
    
    // FE feedback ports
    input  wire [3:0] fwded_pkt_data_vld,
    input  wire [{DATA_WIDTH}*4-1:0] fwded_pkt_data,
    
    // Output ports - 4 lanes
    output reg  [3:0] lane_pkt_out_vld,
    output reg  [{DATA_WIDTH}*4-1:0] lane_pkt_out_data,
    
    // FE control outputs
    output reg  [3:0] fwd_pkt_data_vld,
    output reg  [{DATA_WIDTH}*4-1:0] fwd_pkt_data,
    output reg  [2*4-1:0] fwd_pkt_lat,
    output reg  [3:0] fwd_pkt_dp_vld,
    output reg  [{DATA_WIDTH}*4-1:0] fwd_pkt_dp_data,
    
    // Backpressure
    output reg  pkt_in_bkpr
);

    // =========================================================================
    // Parameters
    // =========================================================================
    localparam DATA_W = {DATA_WIDTH};
    localparam CTRL_W = {CTRL_WIDTH};
    localparam SEQ_W = {SEQ_WIDTH};
    localparam N_LANE = {N_LANES};
    localparam N_FE = {N_FE};
    localparam DEP_DEPTH = {MAX_DEP + 1};
    localparam ROB_DEPTH = {ROB_DEPTH};

    // =========================================================================
    // Global State
    // =========================================================================
    reg [SEQ_W-1:0] seq_cnt;
    reg [15:0] cycle_cnt;
    
    // =========================================================================
    // Input Collector
    // =========================================================================
    reg [3:0] ic_vld;
    reg [DATA_W-1:0] ic_data[0:3];
    reg [CTRL_W-1:0] ic_ctrl[0:3];
    reg [SEQ_W-1:0] ic_seq[0:3];
    
    wire [SEQ_W-1:0] offset_0 = 0;
    wire [SEQ_W-1:0] offset_1 = lane_pkt_in_vld[0];
    wire [SEQ_W-1:0] offset_2 = offset_1 + lane_pkt_in_vld[1];
    wire [SEQ_W-1:0] offset_3 = offset_2 + lane_pkt_in_vld[2];
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            seq_cnt <= 0;
            ic_vld <= 0;
        end else begin
            // Capture inputs
            ic_vld[0] <= lane_pkt_in_vld[0];
            ic_vld[1] <= lane_pkt_in_vld[1];
            ic_vld[2] <= lane_pkt_in_vld[2];
            ic_vld[3] <= lane_pkt_in_vld[3];
            
            ic_data[0] <= lane_pkt_in_data[DATA_W-1:0];
            ic_data[1] <= lane_pkt_in_data[DATA_W*2-1:DATA_W];
            ic_data[2] <= lane_pkt_in_data[DATA_W*3-1:DATA_W*2];
            ic_data[3] <= lane_pkt_in_data[DATA_W*4-1:DATA_W*3];
            
            ic_ctrl[0] <= lane_pkt_in_ctrl[CTRL_W-1:0];
            ic_ctrl[1] <= lane_pkt_in_ctrl[CTRL_W*2-1:CTRL_W];
            ic_ctrl[2] <= lane_pkt_in_ctrl[CTRL_W*3-1:CTRL_W*2];
            ic_ctrl[3] <= lane_pkt_in_ctrl[CTRL_W*4-1:CTRL_W*3];
            
            ic_seq[0] <= seq_cnt + offset_0;
            ic_seq[1] <= seq_cnt + offset_1;
            ic_seq[2] <= seq_cnt + offset_2;
            ic_seq[3] <= seq_cnt + offset_3;
            
            seq_cnt <= seq_cnt + lane_pkt_in_vld[0] + lane_pkt_in_vld[1] + 
                       lane_pkt_in_vld[2] + lane_pkt_in_vld[3];
            cycle_cnt <= cycle_cnt + 1;
        end
    end

    // =========================================================================
    // Dependency Table (8-entry circular buffer)
    // =========================================================================
    reg dep_valid[0:7];
    reg [DATA_W-1:0] dep_data[0:7];
    reg [SEQ_W-1:0] dep_seq[0:7];
    reg [2:0] dep_write_ptr;
    
    // Multi-FE completion - priority encoder
    wire fe_done = |fwded_pkt_data_vld;
    reg [DATA_W-1:0] fe_done_data;
    reg [SEQ_W-1:0] fe_done_seq;
    
    // FE state
    reg [SEQ_W-1:0] fe_pkt_seq[0:3];
    
    integer i;
    always @(*) begin
        fe_done_data = 0;
        fe_done_seq = 0;
        for (i = 0; i < 4; i = i + 1) begin
            if (fwded_pkt_data_vld[i]) begin
                fe_done_data = fwded_pkt_data[i*DATA_W +: DATA_W];
                fe_done_seq = fe_pkt_seq[i];
            end
        end
    end
    
    integer j;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dep_write_ptr <= 0;
            for (j = 0; j < 8; j = j + 1) begin
                dep_valid[j] <= 0;
            end
        end else begin
            if (fe_done) begin
                dep_valid[dep_write_ptr] <= 1;
                dep_data[dep_write_ptr] <= fe_done_data;
                dep_seq[dep_write_ptr] <= fe_done_seq;
                dep_write_ptr <= dep_write_ptr + 1;
            end
        end
    end

    // =========================================================================
    // FE Scheduler
    // =========================================================================
    reg fe_busy[0:3];
    reg [2:0] fe_timer[0:3];
    reg [5:0] fe_last_finish[0:3];
    
    // FE outputs
    reg [3:0] fe_out_vld;
    reg [DATA_W-1:0] fe_out_data[0:3];
    reg [1:0] fe_out_lat[0:3];
    reg [3:0] fe_out_dp_vld;
    reg [DATA_W-1:0] fe_out_dp_data[0:3];
    
    // Current cycle
    wire [15:0] current_cycle = cycle_cnt;
    
    integer fe_idx;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (fe_idx = 0; fe_idx < 4; fe_idx = fe_idx + 1) begin
                fe_busy[fe_idx] <= 0;
                fe_timer[fe_idx] <= 0;
                fe_last_finish[fe_idx] <= 0;
                fe_pkt_seq[fe_idx] <= 0;
                fe_out_vld[fe_idx] <= 0;
            end
        end else begin
            for (fe_idx = 0; fe_idx < 4; fe_idx = fe_idx + 1) begin
                // Parse ctrl
                wire [1:0] lat = ic_ctrl[fe_idx][1:0];
                wire [2:0] dep = ic_ctrl[fe_idx][4:2];
                
                // Constraint check
                wire [5:0] finish_cycle = current_cycle[5:0] + 2 + lat;
                wire constraint_ok = finish_cycle > fe_last_finish[fe_idx];
                
                // Dependency lookup (CAM)
                wire [SEQ_W-1:0] target_seq = ic_seq[fe_idx] - dep;
                reg dep_found;
                reg [DATA_W-1:0] dep_value;
                integer dep_i;
                
                dep_found = 0;
                dep_value = 0;
                for (dep_i = 0; dep_i < 8; dep_i = dep_i + 1) begin
                    if (dep_valid[dep_i] && dep_seq[dep_i] == target_seq) begin
                        dep_found = 1;
                        dep_value = dep_data[dep_i];
                    end
                end
                
                wire has_dep = (dep != 0);
                wire dep_ready = has_dep && dep_found;
                wire can_schedule = !fe_busy[fe_idx] && ic_vld[fe_idx] && 
                                    constraint_ok && (!has_dep || dep_ready);
                
                // Update FE state
                fe_busy[fe_idx] <= can_schedule || (fe_busy[fe_idx] && (fe_timer[fe_idx] > 1));
                
                if (can_schedule)
                    fe_timer[fe_idx] <= lat + 1;
                else if (fe_busy[fe_idx])
                    fe_timer[fe_idx] <= fe_timer[fe_idx] - 1;
                    
                fe_last_finish[fe_idx] <= can_schedule ? finish_cycle : fe_last_finish[fe_idx];
                fe_pkt_seq[fe_idx] <= can_schedule ? ic_seq[fe_idx] : fe_pkt_seq[fe_idx];
                
                // FE outputs
                fe_out_vld[fe_idx] <= can_schedule;
                fe_out_data[fe_idx] <= can_schedule ? ic_data[fe_idx] : 0;
                fe_out_lat[fe_idx] <= can_schedule ? lat : 0;
                fe_out_dp_vld[fe_idx] <= can_schedule && has_dep;
                fe_out_dp_data[fe_idx] <= (can_schedule && has_dep) ? dep_value : 0;
            end
        end
    end

    // =========================================================================
    // ROB (Reorder Buffer)
    // =========================================================================
    reg rob_valid[0:7];
    reg [DATA_W-1:0] rob_data[0:7];
    reg [SEQ_W-1:0] rob_seq[0:7];
    reg [2:0] rob_tail;
    
    integer rob_i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rob_tail <= 0;
            for (rob_i = 0; rob_i < 8; rob_i = rob_i + 1) begin
                rob_valid[rob_i] <= 0;
            end
        end else begin
            if (fe_done) begin
                rob_valid[rob_tail] <= 1;
                rob_data[rob_tail] <= fe_done_data;
                rob_seq[rob_tail] <= fe_done_seq;
                rob_tail <= rob_tail + 1;
            end
        end
    end

    // =========================================================================
    // Output Scheduler
    // =========================================================================
    reg [SEQ_W-1:0] next_output_seq;
    reg [1:0] out_ptr;
    
    reg [3:0] lane_out_vld;
    reg [DATA_W-1:0] lane_out_data[0:3];
    
    // Find next seq in ROB
    reg has_next;
    reg [DATA_W-1:0] next_data;
    integer find_i;
    
    always @(*) begin
        has_next = 0;
        next_data = 0;
        for (find_i = 0; find_i < 8; find_i = find_i + 1) begin
            if (rob_valid[find_i] && rob_seq[find_i] == next_output_seq) begin
                has_next = 1;
                next_data = rob_data[find_i];
            end
        end
    end
    
    // Generate outputs
    wire any_out = |lane_out_vld;
    
    integer out_i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            next_output_seq <= 0;
            out_ptr <= 0;
            lane_out_vld <= 0;
        end else begin
            // Clear outputs
            lane_out_vld <= 0;
            
            // Try to output
            if (has_next) begin
                case (out_ptr)
                    0: begin lane_out_vld[0] <= 1; lane_out_data[0] <= next_data; end
                    1: begin lane_out_vld[1] <= 1; lane_out_data[1] <= next_data; end
                    2: begin lane_out_vld[2] <= 1; lane_out_data[2] <= next_data; end
                    3: begin lane_out_vld[3] <= 1; lane_out_data[3] <= next_data; end
                endcase
                
                next_output_seq <= next_output_seq + 1;
                out_ptr <= out_ptr + 1;
            end
            
            // Clear read ROB entries
            for (out_i = 0; out_i < 8; out_i = out_i + 1) begin
                if (rob_valid[out_i] && rob_seq[out_i] == next_output_seq && has_next)
                    rob_valid[out_i] <= 0;
            end
        end
    end

    // =========================================================================
    // Backpressure
    // =========================================================================
    wire [3:0] pending_cnt = ic_vld[0] + ic_vld[1] + ic_vld[2] + ic_vld[3];
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            pkt_in_bkpr <= 0;
        else
            pkt_in_bkpr <= (pending_cnt >= 10);
    end

    // =========================================================================
    // Output Assignments
    // =========================================================================
    integer assign_i;
    always @(*) begin
        // Lane outputs
        lane_pkt_out_vld = lane_out_vld;
        lane_pkt_out_data = {{lane_out_data[3], lane_out_data[2], 
                               lane_out_data[1], lane_out_data[0]}};
        
        // FE control outputs
        fwd_pkt_data_vld = fe_out_vld;
        for (assign_i = 0; assign_i < 4; assign_i = assign_i + 1) begin
            fwd_pkt_data[assign_i*DATA_W +: DATA_W] = fe_out_data[assign_i];
            fwd_pkt_lat[assign_i*2 +: 2] = fe_out_lat[assign_i];
            fwd_pkt_dp_vld[assign_i] = fe_out_dp_vld[assign_i];
            fwd_pkt_dp_data[assign_i*DATA_W +: DATA_W] = fe_out_dp_data[assign_i];
        end
    end

endmodule
"""
    return verilog


if __name__ == "__main__":
    mlir_path, verilog_path = generate_verilog()
    print(f"\nGeneration complete!")
    print(f"  MLIR: {mlir_path}")
    print(f"  Verilog: {verilog_path}")
