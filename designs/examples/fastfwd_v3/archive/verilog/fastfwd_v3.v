// FastFWD V3 - Verilog Top Level
// 基于 pyCircuit 生成的逻辑，手动优化为可综合Verilog

module fastfwd_v3 (
    input         clk,
    input         rst_n,
    
    // 输入端口
    input         lane0_pkt_in_vld,
    input         lane1_pkt_in_vld,
    input         lane2_pkt_in_vld,
    input         lane3_pkt_in_vld,
    input  [127:0] lane0_pkt_in_data,
    input  [127:0] lane1_pkt_in_data,
    input  [127:0] lane2_pkt_in_data,
    input  [127:0] lane3_pkt_in_data,
    input   [4:0] lane0_pkt_in_ctrl,
    input   [4:0] lane1_pkt_in_ctrl,
    input   [4:0] lane2_pkt_in_ctrl,
    input   [4:0] lane3_pkt_in_ctrl,
    
    // 输出端口
    output        lane0_pkt_out_vld,
    output        lane1_pkt_out_vld,
    output        lane2_pkt_out_vld,
    output        lane3_pkt_out_vld,
    output [127:0] lane0_pkt_out_data,
    output [127:0] lane1_pkt_out_data,
    output [127:0] lane2_pkt_out_data,
    output [127:0] lane3_pkt_out_data,
    
    // 反压
    output        pkt_in_bkpr
);

    // 全局状态
    reg [15:0] seq_cnt;
    reg [1:0]  out_ptr;
    
    // Input Collector
    reg [3:0]  ic_vld;
    reg [127:0] ic_data [0:3];
    reg [4:0]  ic_ctrl [0:3];
    reg [15:0] ic_seq [0:3];
    
    wire [3:0] total_input = lane0_pkt_in_vld + lane1_pkt_in_vld + 
                             lane2_pkt_in_vld + lane3_pkt_in_vld;
    
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            seq_cnt <= 16'd0;
            ic_vld <= 4'd0;
            for (i = 0; i < 4; i = i + 1) begin
                ic_data[i] <= 128'd0;
                ic_ctrl[i] <= 5'd0;
                ic_seq[i] <= 16'd0;
            end
        end else begin
            seq_cnt <= seq_cnt + total_input;
            
            ic_vld[0] <= lane0_pkt_in_vld;
            ic_data[0] <= lane0_pkt_in_data;
            ic_ctrl[0] <= lane0_pkt_in_ctrl;
            ic_seq[0] <= seq_cnt;
            
            ic_vld[1] <= lane1_pkt_in_vld;
            ic_data[1] <= lane1_pkt_in_data;
            ic_ctrl[1] <= lane1_pkt_in_ctrl;
            ic_seq[1] <= seq_cnt + lane0_pkt_in_vld;
            
            ic_vld[2] <= lane2_pkt_in_vld;
            ic_data[2] <= lane2_pkt_in_data;
            ic_ctrl[2] <= lane2_pkt_in_ctrl;
            ic_seq[2] <= seq_cnt + lane0_pkt_in_vld + lane1_pkt_in_vld;
            
            ic_vld[3] <= lane3_pkt_in_vld;
            ic_data[3] <= lane3_pkt_in_data;
            ic_ctrl[3] <= lane3_pkt_in_ctrl;
            ic_seq[3] <= seq_cnt + lane0_pkt_in_vld + lane1_pkt_in_vld + lane2_pkt_in_vld;
        end
    end
    
    // 简化输出
    assign lane0_pkt_out_vld = ic_vld[0];
    assign lane1_pkt_out_vld = ic_vld[1];
    assign lane2_pkt_out_vld = ic_vld[2];
    assign lane3_pkt_out_vld = ic_vld[3];
    assign lane0_pkt_out_data = ic_data[0];
    assign lane1_pkt_out_data = ic_data[1];
    assign lane2_pkt_out_data = ic_data[2];
    assign lane3_pkt_out_data = ic_data[3];
    assign pkt_in_bkpr = 1'b0;

endmodule
