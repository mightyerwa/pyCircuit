// Forwarding Engine (FE) stub model for FastFwd V2.
//
// Behavior:
// - Accepts one packet per cycle (no backpressure).
// - Output appears after `latency = fwd_pkt_lat + 1` cycles.
// - Forwarded data is `fwd_pkt_data + (fwd_pkt_dp_vld ? fwd_pkt_dp_data : 0)`.
// - Constraint: caller must not schedule two inputs that produce output
//   on the same cycle (collision avoidance is the dispatcher's job).
//
// Pipeline: 5 stages (v4 → v3 → v2 → v1 → v0=output).
// New input inserts at stage (1 + lat).
module FE (
  input         clk,
  input         rst_n,
  input         fwd_pkt_data_vld,
  input [127:0] fwd_pkt_data,
  input  [1:0]  fwd_pkt_lat,
  input         fwd_pkt_dp_vld,
  input [127:0] fwd_pkt_dp_data,
  output        fwded_pkt_data_vld,
  output [127:0] fwded_pkt_data
);
  reg        v0, v1, v2, v3, v4;
  reg [127:0] d0, d1, d2, d3, d4;

  wire [127:0] dp_data = fwd_pkt_dp_vld ? fwd_pkt_dp_data : 128'd0;
  wire [127:0] mix = fwd_pkt_data + dp_data;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      v0 <= 1'b0; v1 <= 1'b0; v2 <= 1'b0; v3 <= 1'b0; v4 <= 1'b0;
      d0 <= 128'd0; d1 <= 128'd0; d2 <= 128'd0; d3 <= 128'd0; d4 <= 128'd0;
    end else begin
      v0 <= v1; d0 <= d1;
      v1 <= v2; d1 <= d2;
      v2 <= v3; d2 <= d3;
      v3 <= v4; d3 <= d4;
      v4 <= 1'b0; d4 <= 128'd0;

      if (fwd_pkt_data_vld) begin
        case (fwd_pkt_lat)
          2'd0: begin v1 <= 1'b1; d1 <= mix; end
          2'd1: begin v2 <= 1'b1; d2 <= mix; end
          2'd2: begin v3 <= 1'b1; d3 <= mix; end
          2'd3: begin v4 <= 1'b1; d4 <= mix; end
        endcase
      end
    end
  end

  assign fwded_pkt_data_vld = v0;
  assign fwded_pkt_data = d0;
endmodule
