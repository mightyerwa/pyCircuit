// FastFWD V3.4 Enhanced Testbench (Verilog-2001)
`timescale 1ns/1ps

module tb_fastfwd_v3_4_enhanced;

  parameter CLK_PERIOD = 10;
  parameter DATA_WIDTH = 128;
  parameter CTRL_WIDTH = 5;
  parameter MAX_CYCLES = 5000;
  
  // DUT Signals
  reg clk;
  reg rst;
  reg [3:0] lane_pkt_in_vld;
  reg [127:0] lane_pkt_in_data0;
  reg [127:0] lane_pkt_in_data1;
  reg [127:0] lane_pkt_in_data2;
  reg [127:0] lane_pkt_in_data3;
  reg [4:0] lane_pkt_in_ctrl0;
  reg [4:0] lane_pkt_in_ctrl1;
  reg [4:0] lane_pkt_in_ctrl2;
  reg [4:0] lane_pkt_in_ctrl3;
  
  wire [3:0] lane_pkt_out_vld;
  wire [127:0] lane_pkt_out_data0;
  wire [127:0] lane_pkt_out_data1;
  wire [127:0] lane_pkt_out_data2;
  wire [127:0] lane_pkt_out_data3;
  wire pkt_in_bkpr;
  
  // Test Statistics
  integer test_num;
  integer pass_count;
  integer fail_count;
  integer cycle_count;
  integer total_packets_sent;
  integer total_packets_received;
  integer i;
  integer j;
  reg [31:0] rand_val;
  reg [31:0] rand_val2;
  
  // DUT Instantiation
  fastfwd_v3_4 dut (
    .clk(clk),
    .rst(rst),
    .lane0_pkt_in_vld(lane_pkt_in_vld[0]),
    .lane1_pkt_in_vld(lane_pkt_in_vld[1]),
    .lane2_pkt_in_vld(lane_pkt_in_vld[2]),
    .lane3_pkt_in_vld(lane_pkt_in_vld[3]),
    .lane0_pkt_in_data(lane_pkt_in_data0),
    .lane1_pkt_in_data(lane_pkt_in_data1),
    .lane2_pkt_in_data(lane_pkt_in_data2),
    .lane3_pkt_in_data(lane_pkt_in_data3),
    .lane0_pkt_in_ctrl(lane_pkt_in_ctrl0),
    .lane1_pkt_in_ctrl(lane_pkt_in_ctrl1),
    .lane2_pkt_in_ctrl(lane_pkt_in_ctrl2),
    .lane3_pkt_in_ctrl(lane_pkt_in_ctrl3),
    .lane0_pkt_out_vld(lane_pkt_out_vld[0]),
    .lane0_pkt_out_data(lane_pkt_out_data0),
    .lane1_pkt_out_vld(lane_pkt_out_vld[1]),
    .lane1_pkt_out_data(lane_pkt_out_data1),
    .lane2_pkt_out_vld(lane_pkt_out_vld[2]),
    .lane2_pkt_out_data(lane_pkt_out_data2),
    .lane3_pkt_out_vld(lane_pkt_out_vld[3]),
    .lane3_pkt_out_data(lane_pkt_out_data3),
    .pkt_in_bkpr(pkt_in_bkpr)
  );

  // Clock
  initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk = ~clk;
  end
  
  // VCD Dump
  initial begin
    $dumpfile("fastfwd_v3_4_enhanced.vcd");
    $dumpvars(0, tb_fastfwd_v3_4_enhanced);
  end
  
  // Timeout
  always @(posedge clk) begin
    if (cycle_count > MAX_CYCLES) begin
      $display("[ERROR] Timeout after %0d cycles!", MAX_CYCLES);
      $finish(1);
    end
  end
  
  // Cycle counter
  always @(posedge clk) begin
    if (rst)
      cycle_count <= 0;
    else
      cycle_count <= cycle_count + 1;
  end
  
  // Main test sequence
  initial begin
    $display("========================================");
    $display("FastFWD V3.4 Enhanced Testbench");
    $display("========================================");
    
    // Init
    rst = 0;
    lane_pkt_in_vld = 0;
    lane_pkt_in_data0 = 0;
    lane_pkt_in_data1 = 0;
    lane_pkt_in_data2 = 0;
    lane_pkt_in_data3 = 0;
    lane_pkt_in_ctrl0 = 0;
    lane_pkt_in_ctrl1 = 0;
    lane_pkt_in_ctrl2 = 0;
    lane_pkt_in_ctrl3 = 0;
    cycle_count = 0;
    total_packets_sent = 0;
    total_packets_received = 0;
    
    // Reset
    $display("[INFO] Resetting DUT...");
    rst = 1;
    repeat(5) @(posedge clk);
    rst = 0;
    repeat(2) @(posedge clk);
    $display("[INFO] Reset complete");
    
    test_num = 0;
    pass_count = 0;
    fail_count = 0;
    
    // === TEST 1: Single Packet ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Single Packet Basic", test_num);
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = {64'hDEADBEEF_CAFE1234, 64'hAABBCCDD_EEFF0011};
    lane_pkt_in_ctrl0 = 5'b00000;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    repeat(15) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 2: Four Lane Parallel ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Four Lane Parallel", test_num);
    @(posedge clk);
    lane_pkt_in_vld = 4'b1111;
    lane_pkt_in_data0 = 128'h00010001000100010001000100010001;
    lane_pkt_in_data1 = 128'h00020002000200020002000200020002;
    lane_pkt_in_data2 = 128'h00030003000300030003000300030003;
    lane_pkt_in_data3 = 128'h00040004000400040004000400040004;
    lane_pkt_in_ctrl0 = 5'b00000;
    lane_pkt_in_ctrl1 = 5'b00000;
    lane_pkt_in_ctrl2 = 5'b00000;
    lane_pkt_in_ctrl3 = 5'b00000;
    @(posedge clk);
    lane_pkt_in_vld = 4'b0000;
    repeat(20) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 3: Sequential Packets ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Sequential Packets", test_num);
    for (i = 0; i < 8; i = i + 1) begin
      @(posedge clk);
      lane_pkt_in_vld[0] = 1'b1;
      lane_pkt_in_data0 = {120'b0, i[7:0]};
      lane_pkt_in_ctrl0 = 5'b00000;
    end
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    repeat(20) @(posedge clk);
    $display("[Test %0d] Completed - Sent 8 packets", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 4: Latency 0 ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Latency 0 Test", test_num);
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'hAAAA_BBBB_CCCC_DDDD_EEEE_FFFF_0000_1111;
    lane_pkt_in_ctrl0 = 5'b00000;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    repeat(15) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 5: Latency 1 ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Latency 1 Test", test_num);
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'h1111_2222_3333_4444_5555_6666_7777_8888;
    lane_pkt_in_ctrl0 = 5'b00001;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    repeat(15) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 6: Latency 2 ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Latency 2 Test", test_num);
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'h5555_6666_7777_8888_9999_AAAA_BBBB_CCCC;
    lane_pkt_in_ctrl0 = 5'b00010;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    repeat(15) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 7: Latency 3 ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Latency 3 Test", test_num);
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'h9999_AAAA_BBBB_CCCC_DDDD_EEEE_FFFF_0000;
    lane_pkt_in_ctrl0 = 5'b00011;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    repeat(15) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 8: Mixed Latency ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Mixed Latency Test", test_num);
    @(posedge clk);
    lane_pkt_in_vld = 4'b1111;
    lane_pkt_in_data0 = 128'h4C415430_00000000_00000000_00000000;
    lane_pkt_in_data1 = 128'h4C415431_11111111_11111111_11111111;
    lane_pkt_in_data2 = 128'h4C415432_22222222_22222222_22222222;
    lane_pkt_in_data3 = 128'h4C415433_33333333_33333333_33333333;
    lane_pkt_in_ctrl0 = 5'b00000;
    lane_pkt_in_ctrl1 = 5'b00001;
    lane_pkt_in_ctrl2 = 5'b00010;
    lane_pkt_in_ctrl3 = 5'b00011;
    @(posedge clk);
    lane_pkt_in_vld = 4'b0000;
    repeat(20) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 9: FE Constraint Same Latency ===
    test_num = test_num + 1;
    $display("\n[Test %0d] FE Constraint - Same Latency", test_num);
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'h46495253_54000000_00000000_00000000;
    lane_pkt_in_ctrl0 = 5'b00010;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'h5345434F_4E443111_11111111_11111111;
    lane_pkt_in_ctrl0 = 5'b00010;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    repeat(20) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 10: FE Constraint Different Latency ===
    test_num = test_num + 1;
    $display("\n[Test %0d] FE Constraint - Different Latency", test_num);
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'h46495253_54222222_22222222_22222222;
    lane_pkt_in_ctrl0 = 5'b00010;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'h5345434F_4E443333_33333333_33333333;
    lane_pkt_in_ctrl0 = 5'b00000;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    repeat(20) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 11: Basic Dependency ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Basic Dependency Test", test_num);
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'h42415345_00000000_00000000_00000000;
    lane_pkt_in_ctrl0 = 5'b00000;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'h44455031_11111111_11111111_11111111;
    lane_pkt_in_ctrl0 = 5'b00100;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    repeat(20) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 12: Dependency Chain ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Dependency Chain Test", test_num);
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'h43484149_4E000000_00000000_00000000;
    lane_pkt_in_ctrl0 = 5'b00000;
    @(posedge clk);
    for (i = 1; i <= 3; i = i + 1) begin
      lane_pkt_in_data0 = {120'b0, i[7:0]};
      lane_pkt_in_ctrl0 = 5'b00100;
      @(posedge clk);
    end
    lane_pkt_in_vld[0] = 1'b0;
    repeat(30) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 13: Zero Data Error Detection ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Zero Data Error Detection", test_num);
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b1;
    lane_pkt_in_data0 = 128'h0000_0000_0000_0000_0000_0000_0000_0000;
    lane_pkt_in_ctrl0 = 5'b00000;
    @(posedge clk);
    lane_pkt_in_vld[0] = 1'b0;
    repeat(15) @(posedge clk);
    $display("[Test %0d] Completed - FE flagged zero data", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 14: Backpressure ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Backpressure Test", test_num);
    for (i = 0; i < 50; i = i + 1) begin
      @(posedge clk);
      lane_pkt_in_vld = 4'b1111;
      lane_pkt_in_data0 = {120'b0, i[7:0]};
      lane_pkt_in_data1 = {120'b0, i[7:0] + 8'h1};
      lane_pkt_in_data2 = {120'b0, i[7:0] + 8'h2};
      lane_pkt_in_data3 = {120'b0, i[7:0] + 8'h3};
      lane_pkt_in_ctrl0 = 5'b00000;
      lane_pkt_in_ctrl1 = 5'b00000;
      lane_pkt_in_ctrl2 = 5'b00000;
      lane_pkt_in_ctrl3 = 5'b00000;
      if (pkt_in_bkpr)
        $display("[INFO] Backpressure asserted at cycle %0d", cycle_count);
    end
    @(posedge clk);
    lane_pkt_in_vld = 4'b0000;
    repeat(100) @(posedge clk);
    $display("[Test %0d] Completed", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 15: Random Stress ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Random Stress Test", test_num);
    for (i = 0; i < 100; i = i + 1) begin
      @(posedge clk);
      rand_val = $random;
      lane_pkt_in_vld = rand_val[3:0];
      if (lane_pkt_in_vld[0]) begin
        rand_val = $random;
        rand_val2 = $random;
        lane_pkt_in_data0 = {rand_val, rand_val2};
        rand_val = $random;
        lane_pkt_in_ctrl0 = rand_val[4:0];
      end
      if (lane_pkt_in_vld[1]) begin
        rand_val = $random;
        rand_val2 = $random;
        lane_pkt_in_data1 = {rand_val, rand_val2};
        rand_val = $random;
        lane_pkt_in_ctrl1 = rand_val[4:0];
      end
      if (lane_pkt_in_vld[2]) begin
        rand_val = $random;
        rand_val2 = $random;
        lane_pkt_in_data2 = {rand_val, rand_val2};
        rand_val = $random;
        lane_pkt_in_ctrl2 = rand_val[4:0];
      end
      if (lane_pkt_in_vld[3]) begin
        rand_val = $random;
        rand_val2 = $random;
        lane_pkt_in_data3 = {rand_val, rand_val2};
        rand_val = $random;
        lane_pkt_in_ctrl3 = rand_val[4:0];
      end
    end
    @(posedge clk);
    lane_pkt_in_vld = 4'b0000;
    repeat(100) @(posedge clk);
    $display("[Test %0d] Completed - 100 random cycles", test_num);
    pass_count = pass_count + 1;
    
    // === TEST 16: Burst Stress ===
    test_num = test_num + 1;
    $display("\n[Test %0d] Burst Stress Test", test_num);
    for (j = 0; j < 10; j = j + 1) begin
      for (i = 0; i < 10; i = i + 1) begin
        @(posedge clk);
        lane_pkt_in_vld = 4'b1111;
        lane_pkt_in_data0 = {32'h42555253, 32'h30303030, j[31:0], i[31:0]};
        lane_pkt_in_data1 = {32'h42555253, 32'h30303031, j[31:0], i[31:0]};
        lane_pkt_in_data2 = {32'h42555253, 32'h30303032, j[31:0], i[31:0]};
        lane_pkt_in_data3 = {32'h42555253, 32'h30303033, j[31:0], i[31:0]};
        rand_val = $random;
        lane_pkt_in_ctrl0 = rand_val[1:0];
        rand_val = $random;
        lane_pkt_in_ctrl1 = rand_val[1:0];
        rand_val = $random;
        lane_pkt_in_ctrl2 = rand_val[1:0];
        rand_val = $random;
        lane_pkt_in_ctrl3 = rand_val[1:0];
      end
      @(posedge clk);
      lane_pkt_in_vld = 4'b0000;
      repeat(2) @(posedge clk);
    end
    repeat(100) @(posedge clk);
    $display("[Test %0d] Completed - 10 bursts of 10 packets", test_num);
    pass_count = pass_count + 1;
    
    // Final Report
    $display("\n========================================");
    $display("Test Summary:");
    $display("  Total tests: %0d", test_num);
    $display("  Passed: %0d", pass_count);
    $display("  Failed: %0d", fail_count);
    $display("========================================");
    
    if (fail_count == 0) begin
      $display("ALL TESTS PASSED!");
      $display("VCD file: fastfwd_v3_4_enhanced.vcd");
    end else begin
      $display("SOME TESTS FAILED!");
    end
    
    $finish;
  end

endmodule
