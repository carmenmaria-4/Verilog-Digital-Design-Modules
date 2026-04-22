`timescale 1ns / 1ps
module top(
    input logic [1:0] in0,
    input logic [1:0] in1,
    input logic [7:0] sel,//instr pe 8b
    output logic out_ok, //ok_and || ok_out
    output logic out_of, //overflow de la add_block
    output logic [1:0] out0, out1, out2, out3,
    output logic [7:0] out_sel
    );
    logic [1:0] w_out_mux_and;
    logic [1:0] w_out_mux_add;
    logic [1:0] w_special_out;
    logic [1:0] w_out_mux4;
    
    logic ok_and;
    logic ok_add;
    assign out_ok=ok_and | ok_add;
    assign out_sel=sel;
    
    add_block add_block_0(
    .in0(in0),
    .in1(in1),
    .sel_mux(sel[0]), //fol doar 1b din cele 7
    .out0(out_of),
    .out_mux(w_out_mux_add),
    .ok(ok_add)    
    );
    and_block and_block_0(
    .in0(in0),
    .in1(in1),
    .sel_mux(sel[0]), 
    .out0(w_out_mux_and),
    .ok(ok_and)
    );
    special special_0(
    .in0(in0),
    .in1(in1),
    .out0(w_special_out)
    );
    MUX4 MUX4_0(
    .in0(w_out_mux_add),
    .in1(w_out_mux_and),
    .in2(w_special_out),
    .in3(2'b00),
    .sel(sel[2:1]), //bitul 1 si 2 pt selectie
    .out0(w_out_mux4)
    );
    DEMUX4 DEMUX4_0(
    .in0(w_out_mux4),
    .sel(sel[4:3]), //bitul 3 si 4 pt selectie
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3)
    );
endmodule
