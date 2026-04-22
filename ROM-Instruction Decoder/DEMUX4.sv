`timescale 1ns / 1ps
module DEMUX4(
    input logic [1:0] in0,
    input logic [1:0] sel,
    output logic [1:0] out0,
    output logic [1:0] out1, 
    output logic [1:0] out2, 
    output logic [1:0] out3
    );
    
    always_comb begin
    // Initializam toate iesirile cu 0 (foarte important!)
        out0 = 2'b00;
        out1 = 2'b00;
        out2 = 2'b00;
        out3 = 2'b00;
        case(sel)
            2'b00: out0=in0;
            2'b01: out1=in0;
            2'b10:out2=in0;
            2'b11:out3=in0;
        endcase
    end
endmodule
