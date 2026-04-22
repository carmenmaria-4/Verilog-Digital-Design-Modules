`timescale 1ns / 1ps
module add_block(
    input logic [1:0] in0,
    input logic [1:0] in1,
    input logic sel_mux,
    output logic [1:0] out_mux,
    output logic out0,
    output logic ok
    );
    logic [3:0] w_add;
    logic [1:0] w_romadd_out;
    logic [1:0] w_add_out; //iesire add
    logic [3:0] w_romadd;     // Adresa pentru ROM {data0, data1}
    assign w_romadd = {in0, in1}; //adresa pt rom prin concatenare
    add add_0(
    .in0(in0),
    .in1(in1),
    .out0(w_add_out)
    );
    rom_add rom_add_0(
    .in(w_romadd),
    .out(w_romadd_out)
    );
    overflow_compute overflow_compute_0(
    .in0(in0),
    .in1(in1),
    .out0(out0)
    );
    mux mux_0 (
    .in0(w_add_out),
    .in1(w_romadd_out),
    .sel(sel_mux),
    .out0(out_mux)
    );
    egalegal egalegal_0(
    .in0(w_add_out),
    .in1(w_romadd_out),
    .out0(ok)
    );
endmodule
