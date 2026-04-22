`timescale 1ns / 1ps
module preprocesare(
    input logic [7:0] in0,
    output logic [7:0] out0
    );
    
    logic w_out_comp;
    logic [7:0] w_out0_demux, w_out1_demux;
    logic [7:0] w_sub0, w_sub1;
    
    comp_greater comp_greater_0(
    .in0(in0),
    .in1(8'd90),
    .out0(w_out_comp)
    );
    demux demux_0(
    .in0(in0),
    .sel(w_out_comp),
    .out0(w_out0_demux),
    .out1(w_out1_demux)
    );
    sub sub_0(
    .in0(w_out0_demux),
    .in1(8'd65),
    .out0(w_sub0)
    );
    sub sub_1(
    .in0(w_out1_demux),
    .in1(8'd97),
    .out0(w_sub1)
    );
    mux mux_0(
    .in0(w_sub0),
    .in1(w_sub1),
    .sel(w_out_comp),
    .out0(out0)
    );
endmodule
