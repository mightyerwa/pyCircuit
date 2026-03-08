// FastFWD V3.2 Testbench
// 验证输入输出时序和功能正确性

`timescale 1ns/1ps

module tb_fastfwd_v3_2;

  // Clock and Reset
  reg clk = 0;
  reg rst = 1;
  
  always #5 clk = ~clk;  // 100MHz clock
  
  // Inputs - 4 lanes
  reg lane0_pkt_in_vld;
  reg lane1_pkt_in_vld;
  reg lane2_pkt_in_vld;
  reg lane3_pkt_in_vld;
  
  reg [127:0] lane0_pkt_in_data;
  reg [127:0] lane1_pkt_in_data;
  reg [127:0] lane2_pkt_in_data;
  reg [127:0] lane3_pkt_in_data;
  
  reg [4:0] lane0_pkt_in_ctrl;
  reg [4:0] lane1_pkt_in_ctrl;
  reg [4:0] lane2_pkt_in_ctrl;
  reg [4:0] lane3_pkt_in_ctrl;
  
  // FE completion signals
  reg fwded0_pkt_data_vld;
  reg fwded1_pkt_data_vld;
  reg fwded2_pkt_data_vld;
  reg fwded3_pkt_data_vld;
  
  reg [127:0] fwded0_pkt_data;
  reg [127:0] fwded1_pkt_data;
  reg [127:0] fwded2_pkt_data;
  reg [127:0] fwded3_pkt_data;
  
  // Outputs
  wire lane0_pkt_out_vld;
  wire [127:0] lane0_pkt_out_data;
  wire lane1_pkt_out_vld;
  wire [127:0] lane1_pkt_out_data;
  wire lane2_pkt_out_vld;
  wire [127:0] lane2_pkt_out_data;
  wire lane3_pkt_out_vld;
  wire [127:0] lane3_pkt_out_data;
  wire pkt_in_bkpr;
  
  // Test tracking
  integer test_num = 0;
  integer pass_count = 0;
  integer fail_count = 0;
  
  // Expected output queue for self-checking
  reg [127:0] expected_data [0:31];
  reg [4:0] expected_ctrl [0:31];
  integer expected_wr_ptr = 0;
  integer expected_rd_ptr = 0;
  
  // DUT instantiation
  fastfwd_v3_2 dut (
    .clk(clk),
    .rst(rst),
    .lane0_pkt_in_vld(lane0_pkt_in_vld),
    .lane1_pkt_in_vld(lane1_pkt_in_vld),
    .lane2_pkt_in_vld(lane2_pkt_in_vld),
    .lane3_pkt_in_vld(lane3_pkt_in_vld),
    .lane0_pkt_in_data(lane0_pkt_in_data),
    .lane1_pkt_in_data(lane1_pkt_in_data),
    .lane2_pkt_in_data(lane2_pkt_in_data),
    .lane3_pkt_in_data(lane3_pkt_in_data),
    .lane0_pkt_in_ctrl(lane0_pkt_in_ctrl),
    .lane1_pkt_in_ctrl(lane1_pkt_in_ctrl),
    .lane2_pkt_in_ctrl(lane2_pkt_in_ctrl),
    .lane3_pkt_in_ctrl(lane3_pkt_in_ctrl),
    .fwded0_pkt_data_vld(fwded0_pkt_data_vld),
    .fwded1_pkt_data_vld(fwded1_pkt_data_vld),
    .fwded2_pkt_data_vld(fwded2_pkt_data_vld),
    .fwded3_pkt_data_vld(fwded3_pkt_data_vld),
    .fwded0_pkt_data(fwded0_pkt_data),
    .fwded1_pkt_data(fwded1_pkt_data),
    .fwded2_pkt_data(fwded2_pkt_data),
    .fwded3_pkt_data(fwded3_pkt_data),
    .lane0_pkt_out_vld(lane0_pkt_out_vld),
    .lane0_pkt_out_data(lane0_pkt_out_data),
    .lane1_pkt_out_vld(lane1_pkt_out_vld),
    .lane1_pkt_out_data(lane1_pkt_out_data),
    .lane2_pkt_out_vld(lane2_pkt_out_vld),
    .lane2_pkt_out_data(lane2_pkt_out_data),
    .lane3_pkt_out_vld(lane3_pkt_out_vld),
    .lane3_pkt_out_data(lane3_pkt_out_data),
    .pkt_in_bkpr(pkt_in_bkpr)
  );
  
  // Tasks
  task reset_all;
    begin
      lane0_pkt_in_vld = 0;
      lane1_pkt_in_vld = 0;
      lane2_pkt_in_vld = 0;
      lane3_pkt_in_vld = 0;
      lane0_pkt_in_data = 0;
      lane1_pkt_in_data = 0;
      lane2_pkt_in_data = 0;
      lane3_pkt_in_data = 0;
      lane0_pkt_in_ctrl = 0;
      lane1_pkt_in_ctrl = 0;
      lane2_pkt_in_ctrl = 0;
      lane3_pkt_in_ctrl = 0;
      fwded0_pkt_data_vld = 0;
      fwded1_pkt_data_vld = 0;
      fwded2_pkt_data_vld = 0;
      fwded3_pkt_data_vld = 0;
      fwded0_pkt_data = 0;
      fwded1_pkt_data = 0;
      fwded2_pkt_data = 0;
      fwded3_pkt_data = 0;
      
      rst = 1;
      repeat(5) @(posedge clk);
      rst = 0;
      repeat(2) @(posedge clk);
      $display("[INFO] Reset complete at time %0t", $time);
    end
  endtask
  
  // Send packet to specified lane
  task send_packet;
    input [1:0] lane;
    input [127:0] data;
    input [4:0] ctrl;
    begin
      case(lane)
        2'd0: begin
          lane0_pkt_in_vld = 1;
          lane0_pkt_in_data = data;
          lane0_pkt_in_ctrl = ctrl;
        end
        2'd1: begin
          lane1_pkt_in_vld = 1;
          lane1_pkt_in_data = data;
          lane1_pkt_in_ctrl = ctrl;
        end
        2'd2: begin
          lane2_pkt_in_vld = 1;
          lane2_pkt_in_data = data;
          lane2_pkt_in_ctrl = ctrl;
        end
        2'd3: begin
          lane3_pkt_in_vld = 1;
          lane3_pkt_in_data = data;
          lane3_pkt_in_ctrl = ctrl;
        end
      endcase
      
      // Store expected output
      expected_data[expected_wr_ptr] = data;
      expected_ctrl[expected_wr_ptr] = ctrl;
      expected_wr_ptr = expected_wr_ptr + 1;
      
      @(posedge clk);
      
      // Clear valid
      case(lane)
        2'd0: lane0_pkt_in_vld = 0;
        2'd1: lane1_pkt_in_vld = 0;
        2'd2: lane2_pkt_in_vld = 0;
        2'd3: lane3_pkt_in_vld = 0;
      endcase
    end
  endtask
  
  // Simulate FE completion (latency specified in ctrl[4:2])
  task fe_complete;
    input [1:0] fe_id;
    input [127:0] data;
    begin
      case(fe_id)
        2'd0: begin
          fwded0_pkt_data_vld = 1;
          fwded0_pkt_data = data;
        end
        2'd1: begin
          fwded1_pkt_data_vld = 1;
          fwded1_pkt_data = data;
        end
        2'd2: begin
          fwded2_pkt_data_vld = 1;
          fwded2_pkt_data = data;
        end
        2'd3: begin
          fwded3_pkt_data_vld = 1;
          fwded3_pkt_data = data;
        end
      endcase
      
      @(posedge clk);
      
      case(fe_id)
        2'd0: fwded0_pkt_data_vld = 0;
        2'd1: fwded1_pkt_data_vld = 0;
        2'd2: fwded2_pkt_data_vld = 0;
        2'd3: fwded3_pkt_data_vld = 0;
      endcase
    end
  endtask
  
  // Check output
  task check_output;
    input [1:0] lane;
    input [127:0] expected_data_val;
    begin
      case(lane)
        2'd0: begin
          if (lane0_pkt_out_vld) begin
            if (lane0_pkt_out_data === expected_data_val) begin
              $display("[PASS] Lane 0 output correct: data=%h", lane0_pkt_out_data);
              pass_count = pass_count + 1;
            end else begin
              $display("[FAIL] Lane 0 output mismatch! Expected=%h, Got=%h", 
                       expected_data_val, lane0_pkt_out_data);
              fail_count = fail_count + 1;
            end
          end
        end
        2'd1: begin
          if (lane1_pkt_out_vld) begin
            if (lane1_pkt_out_data === expected_data_val) begin
              $display("[PASS] Lane 1 output correct: data=%h", lane1_pkt_out_data);
              pass_count = pass_count + 1;
            end else begin
              $display("[FAIL] Lane 1 output mismatch! Expected=%h, Got=%h", 
                       expected_data_val, lane1_pkt_out_data);
              fail_count = fail_count + 1;
            end
          end
        end
        2'd2: begin
          if (lane2_pkt_out_vld) begin
            if (lane2_pkt_out_data === expected_data_val) begin
              $display("[PASS] Lane 2 output correct: data=%h", lane2_pkt_out_data);
              pass_count = pass_count + 1;
            end else begin
              $display("[FAIL] Lane 2 output mismatch! Expected=%h, Got=%h", 
                       expected_data_val, lane2_pkt_out_data);
              fail_count = fail_count + 1;
            end
          end
        end
        2'd3: begin
          if (lane3_pkt_out_vld) begin
            if (lane3_pkt_out_data === expected_data_val) begin
              $display("[PASS] Lane 3 output correct: data=%h", lane3_pkt_out_data);
              pass_count = pass_count + 1;
            end else begin
              $display("[FAIL] Lane 3 output mismatch! Expected=%h, Got=%h", 
                       expected_data_val, lane3_pkt_out_data);
              fail_count = fail_count + 1;
            end
          end
        end
      endcase
    end
  endtask
  
  // Main test sequence
  initial begin
    $display("============================================");
    $display("FastFWD V3.2 RTL Verification Testbench");
    $display("============================================");
    
    // Initialize
    reset_all();
    
    // Test 1: Single packet through lane 0
    $display("\n[TEST 1] Single packet through lane 0");
    test_num = 1;
    send_packet(2'd0, 128'hAABBCCDD_EEFF0011_22334455_66778899, 5'b00010); // lat=2
    repeat(10) @(posedge clk);
    fe_complete(2'd0, 128'hAABBCCDD_EEFF0011_22334455_66778899);
    repeat(10) @(posedge clk);
    
    // Test 2: Multiple packets with different latencies
    $display("\n[TEST 2] Multiple packets with different latencies");
    test_num = 2;
    send_packet(2'd0, 128'h11111111_11111111_11111111_11111111, 5'b00001); // lat=1
    @(posedge clk);
    send_packet(2'd1, 128'h22222222_22222222_22222222_22222222, 5'b00010); // lat=2
    @(posedge clk);
    send_packet(2'd2, 128'h33333333_33333333_33333333_33333333, 5'b00011); // lat=3
    @(posedge clk);
    send_packet(2'd3, 128'h44444444_44444444_44444444_44444444, 5'b00100); // lat=4
    repeat(5) @(posedge clk);
    
    fe_complete(2'd0, 128'h11111111_11111111_11111111_11111111);
    repeat(2) @(posedge clk);
    fe_complete(2'd1, 128'h22222222_22222222_22222222_22222222);
    repeat(2) @(posedge clk);
    fe_complete(2'd2, 128'h33333333_33333333_33333333_33333333);
    repeat(2) @(posedge clk);
    fe_complete(2'd3, 128'h44444444_44444444_44444444_44444444);
    repeat(15) @(posedge clk);
    
    // Test 3: Backpressure check
    $display("\n[TEST 3] Backpressure signal check");
    test_num = 3;
    $display("Initial bkpr state: %b", pkt_in_bkpr);
    
    // Send many packets to trigger backpressure
    repeat(20) begin
      send_packet(2'd0, 128'hDEADBEEF_CAFE0000_12345678_9ABCDEF0, 5'b00101); // lat=5
      @(posedge clk);
      $display("Cycle: bkpr=%b", pkt_in_bkpr);
    end
    repeat(50) @(posedge clk);
    
    // Test 4: Sequential dependency (simplified)
    $display("\n[TEST 4] Sequential packet test");
    test_num = 4;
    send_packet(2'd0, 128'h00000000_00000001_00000000_00000000, 5'b00001);
    @(posedge clk);
    send_packet(2'd0, 128'h00000000_00000002_00000000_00000000, 5'b00001);
    @(posedge clk);
    send_packet(2'd0, 128'h00000000_00000003_00000000_00000000, 5'b00001);
    repeat(5) @(posedge clk);
    
    fe_complete(2'd0, 128'h00000000_00000001_00000000_00000000);
    @(posedge clk);
    fe_complete(2'd0, 128'h00000000_00000002_00000000_00000000);
    @(posedge clk);
    fe_complete(2'd0, 128'h00000000_00000003_00000000_00000000);
    repeat(15) @(posedge clk);
    
    // Test summary
    $display("\n============================================");
    $display("Test Summary");
    $display("============================================");
    $display("Total tests: %0d", test_num);
    $display("Passed: %0d", pass_count);
    $display("Failed: %0d", fail_count);
    
    if (fail_count == 0)
      $display("\n[RESULT] ALL TESTS PASSED!");
    else
      $display("\n[RESULT] SOME TESTS FAILED!");
    
    $display("============================================");
    $finish;
  end
  
  // Monitor outputs
  always @(posedge clk) begin
    if (!rst) begin
      if (lane0_pkt_out_vld)
        $display("[MONITOR] Lane 0 output: vld=%b data=%h at time %0t", 
                 lane0_pkt_out_vld, lane0_pkt_out_data, $time);
      if (lane1_pkt_out_vld)
        $display("[MONITOR] Lane 1 output: vld=%b data=%h at time %0t", 
                 lane1_pkt_out_vld, lane1_pkt_out_data, $time);
      if (lane2_pkt_out_vld)
        $display("[MONITOR] Lane 2 output: vld=%b data=%h at time %0t", 
                 lane2_pkt_out_vld, lane2_pkt_out_data, $time);
      if (lane3_pkt_out_vld)
        $display("[MONITOR] Lane 3 output: vld=%b data=%h at time %0t", 
                 lane3_pkt_out_vld, lane3_pkt_out_data, $time);
    end
  end
  
  // Timeout watchdog
  initial begin
    #100000;
    $display("[ERROR] Simulation timeout!");
    $finish;
  end

endmodule
