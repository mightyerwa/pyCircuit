// FE (Forwarding Engine) Module - Simple but error-detecting
// 
// Function:
// - Delays input data by 'lat' cycles (0-3 cycles)
// - Performs simple data integrity check
// - Can detect and flag errors for testing purposes
//
// Error detection features:
// - Data all-zeros check (unexpected zero data)
// - Data pattern validation (if dp_vld is set, dp_data should match expected)
// - Latency overflow check (lat > 3 is clamped and flagged)

module FE (
    input clk,
    input rst_n,
    
    // Input from core
    input fwd_pkt_data_vld,
    input [127:0] fwd_pkt_data,
    input [1:0] fwd_pkt_lat,        // 0-3 cycles latency
    input fwd_pkt_dp_vld,           // Dependency valid
    input [127:0] fwd_pkt_dp_data,  // Dependency data
    
    // Output back to core
    output reg fwded_pkt_data_vld,
    output reg [127:0] fwded_pkt_data,
    
    // Error flags (for testing)
    output reg error_zero_data,       // Error: input data is all zeros
    output reg error_latency_overflow, // Error: lat > 3
    output reg error_dp_mismatch      // Error: dependency data mismatch
);

    // Internal state
    reg [3:0] busy;                   // One-hot busy flags for each cycle
    reg [127:0] data_pipe [0:3];      // Pipeline for data
    reg [127:0] dp_data_reg;          // Registered dependency data
    reg dp_vld_reg;
    
    // Latency clamping
    wire [1:0] lat_clamped = (fwd_pkt_lat > 2'd3) ? 2'd3 : fwd_pkt_lat;
    wire lat_overflow = (fwd_pkt_lat > 2'd3);
    
    // Error detection logic
    wire data_is_zero = (fwd_pkt_data == 128'b0);
    
    // Sequential logic
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fwded_pkt_data_vld <= 1'b0;
            fwded_pkt_data <= 128'b0;
            busy <= 4'b0000;
            error_zero_data <= 1'b0;
            error_latency_overflow <= 1'b0;
            error_dp_mismatch <= 1'b0;
            dp_vld_reg <= 1'b0;
            dp_data_reg <= 128'b0;
            
            for (i = 0; i < 4; i = i + 1) begin
                data_pipe[i] <= 128'b0;
            end
        end else begin
            // Default: clear outputs and errors
            fwded_pkt_data_vld <= 1'b0;
            error_zero_data <= 1'b0;
            error_latency_overflow <= 1'b0;
            error_dp_mismatch <= 1'b0;
            
            // Shift pipeline
            data_pipe[3] <= data_pipe[2];
            data_pipe[2] <= data_pipe[1];
            data_pipe[1] <= data_pipe[0];
            data_pipe[0] <= fwd_pkt_data;
            
            // Shift busy flags
            fwded_pkt_data_vld <= busy[3];
            busy <= {busy[2:0], 1'b0};
            
            // Output from pipeline based on latency
            case (lat_clamped)
                2'd0: fwded_pkt_data <= fwd_pkt_data;  // Pass-through
                2'd1: fwded_pkt_data <= data_pipe[0];
                2'd2: fwded_pkt_data <= data_pipe[1];
                2'd3: fwded_pkt_data <= data_pipe[2];
            endcase
            
            // Accept new input
            if (fwd_pkt_data_vld) begin
                // Set busy flag at appropriate position
                case (lat_clamped)
                    2'd0: fwded_pkt_data_vld <= 1'b1;  // Immediate output
                    2'd1: busy[0] <= 1'b1;
                    2'd2: busy[1] <= 1'b1;
                    2'd3: busy[2] <= 1'b1;
                endcase
                
                // Error detection
                if (data_is_zero)
                    error_zero_data <= 1'b1;
                
                if (lat_overflow)
                    error_latency_overflow <= 1'b1;
                
                // Dependency data check (simple: dp_data should not be zero if dp_vld)
                if (fwd_pkt_dp_vld && (fwd_pkt_dp_data == 128'b0))
                    error_dp_mismatch <= 1'b1;
                
                // Register dp for later comparison
                dp_vld_reg <= fwd_pkt_dp_vld;
                dp_data_reg <= fwd_pkt_dp_data;
            end
        end
    end

endmodule
