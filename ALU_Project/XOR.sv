`timescale 1ns / 1ps
module xor8b(
    input logic [7:0] in0, in1, 
    output logic [7:0] out0
    );
    assign out0=in1^in0;
endmodule
