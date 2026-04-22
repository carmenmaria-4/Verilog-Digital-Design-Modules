`timescale 1ns / 1ps
module demux(
    input logic [7:0] in0,
    input logic sel,
    output logic [7:0] out0, out1
    );
    always_comb begin
        out0=8'b0;
        out1=8'b0;
        case(sel)
            1'b0: out0=in0;
            1'b1: out1=in0;
        endcase
    end
endmodule
