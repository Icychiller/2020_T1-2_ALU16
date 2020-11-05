/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module fsmcontrol_11 (
    input clk,
    input rst,
    input run,
    output reg [5:0] alufn,
    output reg [15:0] fsma,
    output reg [15:0] fsmb
  );
  
  
  
  wire [1-1:0] M_slowclk_value;
  counter_14 slowclk (
    .clk(clk),
    .rst(rst),
    .value(M_slowclk_value)
  );
  
  wire [1-1:0] M_clkrise_out;
  reg [1-1:0] M_clkrise_in;
  edge_detector_10 clkrise (
    .clk(clk),
    .in(M_clkrise_in),
    .out(M_clkrise_out)
  );
  
  
  localparam SRESET_testerstate = 5'd0;
  localparam SADD_testerstate = 5'd1;
  localparam SSUB_testerstate = 5'd2;
  localparam SOR_testerstate = 5'd3;
  localparam SAND_testerstate = 5'd4;
  localparam SHL_testerstate = 5'd5;
  localparam SRA_testerstate = 5'd6;
  localparam SHR_testerstate = 5'd7;
  localparam SCLE_testerstate = 5'd8;
  localparam SEQ_testerstate = 5'd9;
  localparam SMUL_testerstate = 5'd10;
  localparam SMULN_testerstate = 5'd11;
  localparam SDIV_testerstate = 5'd12;
  localparam SMOD_testerstate = 5'd13;
  localparam SFN0_testerstate = 5'd14;
  localparam SFN1_testerstate = 5'd15;
  localparam SAOVER0_testerstate = 5'd16;
  localparam SAOVER1_testerstate = 5'd17;
  
  reg [4:0] M_testerstate_d, M_testerstate_q = SRESET_testerstate;
  
  always @* begin
    M_testerstate_d = M_testerstate_q;
    
    M_clkrise_in = M_slowclk_value;
    alufn = 1'h0;
    fsma = 1'h0;
    fsmb = 1'h0;
    
    case (M_testerstate_q)
      SRESET_testerstate: begin
        if (run == 1'h1 && M_clkrise_out == 1'h1) begin
          M_testerstate_d = SADD_testerstate;
        end
      end
      SADD_testerstate: begin
        fsma = 8'h55;
        fsmb = 8'haa;
        alufn = 8'h00;
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SSUB_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
      end
      SSUB_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SOR_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h01;
        fsma = 9'h100;
        fsmb = 8'h55;
      end
      SOR_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SAND_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h1e;
        fsma = 8'haa;
        fsmb = 8'h55;
      end
      SAND_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SHL_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h18;
        fsma = 8'hff;
        fsmb = 8'h55;
      end
      SHL_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SRA_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h20;
        fsma = 8'haa;
        fsmb = 4'h8;
      end
      SRA_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SHR_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h23;
        fsma = 16'haa00;
        fsmb = 4'h8;
      end
      SHR_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SCLE_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h21;
        fsma = 16'hffaa;
        fsmb = 4'h8;
      end
      SCLE_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SEQ_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h37;
        fsma = 8'hff;
        fsmb = 9'h100;
      end
      SEQ_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SMUL_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h33;
        fsma = 8'hff;
        fsmb = 9'h100;
      end
      SMUL_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SMULN_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h02;
        fsma = 8'hff;
        fsmb = 2'h3;
      end
      SMULN_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SDIV_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h02;
        fsma = 6'h33;
        fsmb = 16'hffff;
      end
      SDIV_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SMOD_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h04;
        fsma = 10'h2fd;
        fsmb = 4'hf;
      end
      SMOD_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SFN0_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h06;
        fsma = 6'h33;
        fsmb = 4'ha;
      end
      SFN0_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SFN1_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h00;
        fsma = 1'h1;
        fsmb = 1'h1;
      end
      SFN1_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SAOVER0_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h0f;
        fsma = 1'h1;
        fsmb = 1'h1;
      end
      SAOVER0_testerstate: begin
        if (M_clkrise_out == 1'h1 && run == 1'h1) begin
          M_testerstate_d = SAOVER1_testerstate;
        end else begin
          if (run == 1'h0) begin
            M_testerstate_d = SRESET_testerstate;
          end
        end
        alufn = 6'h00;
        fsma = 15'h7fff;
        fsmb = 1'h0;
      end
      SAOVER1_testerstate: begin
        if (M_clkrise_out == 1'h1) begin
          M_testerstate_d = SRESET_testerstate;
        end
        alufn = 6'h00;
        fsma = 15'h7fff;
        fsmb = 1'h1;
      end
      default: begin
        alufn = 1'h0;
        fsma = 1'h0;
        fsmb = 1'h0;
      end
    endcase
  end
  
  always @(posedge M_slowclk_value) begin
    if (rst == 1'b1) begin
      M_testerstate_q <= 1'h0;
    end else begin
      M_testerstate_q <= M_testerstate_d;
    end
  end
  
endmodule