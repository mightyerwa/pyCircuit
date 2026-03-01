// FE (Forwarding Engine) 模块
// 用于 FastFWD V2/V3 的报文转发处理
//
// 功能:
// - 接收报文数据和延迟信息
// - 根据延迟在指定 cycle 后输出
// - 支持依赖数据处理 (dp_vld/dp_data)
//
// 时序:
// - lat=0: 1 cycle 后输出
// - lat=1: 2 cycles 后输出
// - lat=2: 3 cycles 后输出
// - lat=3: 4 cycles 后输出
//
// 作者: Kimi Claw
// 日期: 2026-03-01

module FE (
    input         clk,
    input         rst_n,
    
    // 输入
    input         fwd_pkt_data_vld,      // 输入数据有效
    input [127:0] fwd_pkt_data,          // 输入数据
    input  [1:0]  fwd_pkt_lat,           // 延迟 (0~3)
    input         fwd_pkt_dp_vld,        // 依赖数据有效
    input [127:0] fwd_pkt_dp_data,       // 依赖数据
    
    // 输出
    output        fwded_pkt_data_vld,    // 输出数据有效
    output [127:0] fwded_pkt_data        // 输出数据
);

    // 内部信号
    wire [127:0] dp_data;
    wire [127:0] mix_data;
    
    // 5 级流水线 (stage0 是当前输出)
    reg        v0, v1, v2, v3, v4;
    reg [127:0] d0, d1, d2, d3, d4;
    
    // 依赖数据处理
    assign dp_data = fwd_pkt_dp_vld ? fwd_pkt_dp_data : 128'd0;
    assign mix_data = fwd_pkt_data + dp_data;
    
    // 输出
    assign fwded_pkt_data_vld = v0;
    assign fwded_pkt_data = d0;
    
    // 时序逻辑
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            v0 <= 1'b0;
            v1 <= 1'b0;
            v2 <= 1'b0;
            v3 <= 1'b0;
            v4 <= 1'b0;
            d0 <= 128'd0;
            d1 <= 128'd0;
            d2 <= 128'd0;
            d3 <= 128'd0;
            d4 <= 128'd0;
        end else begin
            // 流水线移位
            v0 <= v1;
            d0 <= d1;
            v1 <= v2;
            d1 <= d2;
            v2 <= v3;
            d2 <= d3;
            v3 <= v4;
            d3 <= d4;
            v4 <= 1'b0;
            d4 <= 128'd0;
            
            // 根据延迟插入到对应 stage
            if (fwd_pkt_data_vld) begin
                case (fwd_pkt_lat)
                    2'd0: begin
                        v1 <= 1'b1;
                        d1 <= mix_data;  // 1 cycle 后输出
                    end
                    2'd1: begin
                        v2 <= 1'b1;
                        d2 <= mix_data;  // 2 cycles 后输出
                    end
                    2'd2: begin
                        v3 <= 1'b1;
                        d3 <= mix_data;  // 3 cycles 后输出
                    end
                    2'd3: begin
                        v4 <= 1'b1;
                        d4 <= mix_data;  // 4 cycles 后输出
                    end
                endcase
            end
        end
    end

endmodule
