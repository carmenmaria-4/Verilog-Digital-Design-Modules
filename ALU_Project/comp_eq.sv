`timescale 1ns / 1ps
module comp_esq(
    input logic [7:0] in0, in1, 
    output logic out0
    );
    assign out0=(in1==in0);
endmodule
