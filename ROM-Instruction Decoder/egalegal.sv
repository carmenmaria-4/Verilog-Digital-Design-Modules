`timescale 1ns / 1ps

module egalegal(
    input logic [1:0] in0,
    input logic [1:0] in1, 
    output logic out0
    );
    assign out0=(in0==in1); //verifica daca intrarile sunt egale
endmodule
