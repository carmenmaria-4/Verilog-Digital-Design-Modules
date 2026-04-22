`timescale 1ns / 1ps
module MUX4(
    input logic [1:0] in0,
    input logic [1:0] in1,
    input logic [1:0] in2,
    input logic [1:0] in3,
    input logic [1:0] sel,
    output logic [1:0] out0
    );
    //MUX CU 4 INTRARI O IESIRE
    always_comb begin
        case(sel)
        2'b00: out0=in0;
        2'b01: out0=in1;
        2'b10: out0=in2;
        2'b11: out0=2'b00; //pt ca in3 e 0
        default: out0=2'b00;
        endcase
    end 
endmodule
