`timescale 1ns / 1ps
module mux(
    input logic [7:0] in0, in1,
    input logic sel,
    output logic [7:0] out0
    );
    assign out0 = sel ? in1 : in0;
endmodule
