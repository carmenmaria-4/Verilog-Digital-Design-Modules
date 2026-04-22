`timescale 1ns / 1ps
module and_block(
    input logic [1:0] in0, 
    input logic [1:0] in1, 
    input logic sel_mux,
    output logic ok, 
    output logic [1:0] out0
    );
    logic [1:0] w_and_out;
    logic [1:0] w_rom_out;
    logic [3:0] w_rom_in;
    assign w_rom_in= {in0, in1}; //adresa prin concatenare
    and1 and1_0(
    .in0(in0),
    .in1(in1),
    .out0(w_and_out)
    );
    romand romand_0(
    .in(w_rom_in),
    .out(w_rom_out)
    );
    egalegal_AND egalegal_AND_0(
    .in0(w_and_out),
    .in1(w_rom_out),
    .out0(ok)
    );
    mux1 mux1_0(
    .in0(w_and_out),
    .in1(w_rom_out),
    .sel(sel_mux),
    .out0(out0)
    );
endmodule
