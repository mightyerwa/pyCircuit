// FastFWD V3.2 Comprehensive Testbench
`timescale 1ns/1ps

module tb_fastfwd_v3_2_comprehensive;

  reg clk = 0;
  reg rst = 1;
  always #5 clk = ~clk;
  
  // Inputs
  reg lane0_pkt_in_vld, lane1_pkt_in_vld, lane2_pkt_in_vld, lane3_pkt_in_vld;
  reg [127:0] lane0_pkt_in_data, lane1_pkt_in_data, lane2_pkt_in_data, lane3_pkt_in_data;
  reg [4:0] lane0_pkt_in_ctrl, lane1_pkt_in_ctrl, lane2_pkt_in_ctrl, lane3_pkt_in_ctrl;
  
  // FE signals
  reg fwded0_pkt_data_vld, fwded1_pkt_data_vld, fwded2_pkt_data_vld, fwded3_pkt_data_vld;
  reg [127:0] fwded0_pkt_data, fwded1_pkt_data, fwded2_pkt_data, fwded3_pkt_data;
  
  // Outputs
  wire lane0_pkt_out_vld, lane1_pkt_out_vld, lane2_pkt_out_vld, lane3_pkt_out_vld;
  wire [127:0] lane0_pkt_out_data, lane1_pkt_out_data, lane2_pkt_out_data, lane3_pkt_out_data;
  wire pkt_in_bkpr;
  
  // Cycle counter
  integer cycle_count;
  initial cycle_count = 0;
  always @(posedge clk) if (!rst) cycle_count <= cycle_count + 1;
  
  integer tx_count;
  
  // DUT
  fastfwd_v3_2 dut (
    .clk(clk), .rst(rst),
    .lane0_pkt_in_vld(lane0_pkt_in_vld), .lane1_pkt_in_vld(lane1_pkt_in_vld),
    .lane2_pkt_in_vld(lane2_pkt_in_vld), .lane3_pkt_in_vld(lane3_pkt_in_vld),
    .lane0_pkt_in_data(lane0_pkt_in_data), .lane1_pkt_in_data(lane1_pkt_in_data),
    .lane2_pkt_in_data(lane2_pkt_in_data), .lane3_pkt_in_data(lane3_pkt_in_data),
    .lane0_pkt_in_ctrl(lane0_pkt_in_ctrl), .lane1_pkt_in_ctrl(lane1_pkt_in_ctrl),
    .lane2_pkt_in_ctrl(lane2_pkt_in_ctrl), .lane3_pkt_in_ctrl(lane3_pkt_in_ctrl),
    .fwded0_pkt_data_vld(fwded0_pkt_data_vld), .fwded1_pkt_data_vld(fwded1_pkt_data_vld),
    .fwded2_pkt_data_vld(fwded2_pkt_data_vld), .fwded3_pkt_data_vld(fwded3_pkt_data_vld),
    .fwded0_pkt_data(fwded0_pkt_data), .fwded1_pkt_data(fwded1_pkt_data),
    .fwded2_pkt_data(fwded2_pkt_data), .fwded3_pkt_data(fwded3_pkt_data),
    .lane0_pkt_out_vld(lane0_pkt_out_vld), .lane1_pkt_out_vld(lane1_pkt_out_vld),
    .lane2_pkt_out_vld(lane2_pkt_out_vld), .lane3_pkt_out_vld(lane3_pkt_out_vld),
    .lane0_pkt_out_data(lane0_pkt_out_data), .lane1_pkt_out_data(lane1_pkt_out_data),
    .lane2_pkt_out_data(lane2_pkt_out_data), .lane3_pkt_out_data(lane3_pkt_out_data),
    .pkt_in_bkpr(pkt_in_bkpr)
  );

  // Main test
  initial begin
    $display("============================================");
    $display("FastFWD V3.2 RTL Test");
    $display("============================================");
    
    // Reset
    rst = 1;
    lane0_pkt_in_vld = 0; lane1_pkt_in_vld = 0; lane2_pkt_in_vld = 0; lane3_pkt_in_vld = 0;
    fwded0_pkt_data_vld = 0; fwded1_pkt_data_vld = 0; fwded2_pkt_data_vld = 0; fwded3_pkt_data_vld = 0;
    tx_count = 0;
    repeat(5) @(posedge clk);
    rst = 0;
    @(posedge clk);
    $display("[INFO] Reset complete at cycle %0d", cycle_count);
    
    // Test 1: Single packet per lane
    $display("\n[TEST 1] Single packet per lane");
    @(posedge clk); lane0_pkt_in_vld = 1; lane0_pkt_in_data = 128'hAAAA0001; lane0_pkt_in_ctrl = 5'b00010; @(posedge clk); lane0_pkt_in_vld = 0;
    @(posedge clk); lane1_pkt_in_vld = 1; lane1_pkt_in_data = 128'hBBBB0002; lane1_pkt_in_ctrl = 5'b00010; @(posedge clk); lane1_pkt_in_vld = 0;
    @(posedge clk); lane2_pkt_in_vld = 1; lane2_pkt_in_data = 128'hCCCC0003; lane2_pkt_in_ctrl = 5'b00010; @(posedge clk); lane2_pkt_in_vld = 0;
    @(posedge clk); lane3_pkt_in_vld = 1; lane3_pkt_in_data = 128'hDDDD0004; lane3_pkt_in_ctrl = 5'b00010; @(posedge clk); lane3_pkt_in_vld = 0;
    tx_count = 4;
    
    repeat(6) @(posedge clk);
    fwded0_pkt_data_vld = 1; fwded0_pkt_data = 128'hAAAA0001; @(posedge clk); fwded0_pkt_data_vld = 0;
    fwded1_pkt_data_vld = 1; fwded1_pkt_data = 128'hBBBB0002; @(posedge clk); fwded1_pkt_data_vld = 0;
    fwded2_pkt_data_vld = 1; fwded2_pkt_data = 128'hCCCC0003; @(posedge clk); fwded2_pkt_data_vld = 0;
    fwded3_pkt_data_vld = 1; fwded3_pkt_data = 128'hDDDD0004; @(posedge clk); fwded3_pkt_data_vld = 0;
    repeat(20) @(posedge clk);
    
    // Test 2: Variable latency
    $display("\n[TEST 2] Variable latency");
    @(posedge clk); lane0_pkt_in_vld = 1; lane0_pkt_in_data = 128'h11111111; lane0_pkt_in_ctrl = 5'b00001; @(posedge clk); lane0_pkt_in_vld = 0;
    @(posedge clk); lane1_pkt_in_vld = 1; lane1_pkt_in_data = 128'h22222222; lane1_pkt_in_ctrl = 5'b00011; @(posedge clk); lane1_pkt_in_vld = 0;
    @(posedge clk); lane2_pkt_in_vld = 1; lane2_pkt_in_data = 128'h33333333; lane2_pkt_in_ctrl = 5'b00101; @(posedge clk); lane2_pkt_in_vld = 0;
    tx_count = tx_count + 3;
    
    repeat(6) @(posedge clk);
    fwded0_pkt_data_vld = 1; fwded0_pkt_data = 128'h11111111; @(posedge clk); fwded0_pkt_data_vld = 0;
    repeat(4) @(posedge clk);
    fwded1_pkt_data_vld = 1; fwded1_pkt_data = 128'h22222222; @(posedge clk); fwded1_pkt_data_vld = 0;
    repeat(4) @(posedge clk);
    fwded2_pkt_data_vld = 1; fwded2_pkt_data = 128'h33333333; @(posedge clk); fwded2_pkt_data_vld = 0;
    repeat(20) @(posedge clk);
    
    // Test 3: Sequential packets
    $display("\n[TEST 3] Sequential packets on lane 0");
    @(posedge clk); lane0_pkt_in_vld = 1; lane0_pkt_in_data = 128'hSEQ00001; lane0_pkt_in_ctrl = 5'b00010; @(posedge clk); lane0_pkt_in_vld = 0;
    @(posedge clk); lane0_pkt_in_vld = 1; lane0_pkt_in_data = 128'hSEQ00002; lane0_pkt_in_ctrl = 5'b00010; @(posedge clk); lane0_pkt_in_vld = 0;
    @(posedge clk); lane0_pkt_in_vld = 1; lane0_pkt_in_data = 128'hSEQ00003; lane0_pkt_in_ctrl = 5'b00010; @(posedge clk); lane0_pkt_in_vld = 0;
    tx_count = tx_count + 3;
    
    repeat(8) @(posedge clk);
    fwded0_pkt_data_vld = 1; fwded0_pkt_data = 128'hSEQ00001; @(posedge clk); fwded0_pkt_data_vld = 0;
    repeat(4) @(posedge clk);
    fwded0_pkt_data_vld = 1; fwded0_pkt_data = 128'hSEQ00002; @(posedge clk); fwded0_pkt_data_vld = 0;
    repeat(4) @(posedge clk);
    fwded0_pkt_data_vld = 1; fwded0_pkt_data = 128'hSEQ00003; @(posedge clk); fwded0_pkt_data_vld = 0;
    repeat(30) @(posedge clk);
    
    $display("\n============================================");
    $display("Test Complete");
    $display("Transactions: %0d, Cycles: %0d", tx_count, cycle_count);
    $display("============================================");
    $finish;
  end
  
  // Monitor outputs
  always @(posedge clk) begin
    if (!rst) begin
      if (lane0_pkt_out_vld | lane1_pkt_out_vld | lane2_pkt_out_vld | lane3_pkt_out_vld) begin
        $display("[OUTPUT] Cycle %0d: vld=%b%b%b%b", cycle_count, 
                 lane3_pkt_out_vld, lane2_pkt_out_vld, lane1_pkt_out_vld, lane0_pkt_out_vld);
        if (lane0_pkt_out_vld) $display("  L0: %h", lane0_pkt_out_data);
        if (lane1_pkt_out_vld) $display("  L1: %h", lane1_pkt_out_data);
        if (lane2_pkt_out_vld) $display("  L2: %h", lane2_pkt_out_data);
        if (lane3_pkt_out_vld) $display("  L3: %h", lane3_pkt_out_data);
      end
      if (pkt_in_bkpr) $display("[BKPR] Cycle %0d: Backpressure asserted", cycle_count);
    end
  end
  
  initial begin #100000; $display("[ERROR] Timeout!"); $finish; end

endmodule
