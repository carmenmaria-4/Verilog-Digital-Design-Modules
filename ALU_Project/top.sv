module top(
    input  logic [15:0] instruction,
    input  logic [7:0] data0, data1,
    output logic [7:0] out0, out1, out2, out3,
    output logic overflow_flag, zero_flag
);

    logic [1:0] sel_op = instruction[11:10];
    logic [1:0] sel_type= instruction[13:12];
    logic [1:0] sel_loc = instruction[15:14];
    logic [7:0] w_sr, w_sl, w_add, w_sub;
    logic [7:0] w_and, w_or, w_xor, w_spec;
    logic [7:0] w_mux_0, w_mux_1, w_res_final;
    assign w_spec[7:1] = 7'b0;

    shift_right sr(
    .in0(data0), 
    .in1(data1), 
    .out0(w_sr)
    );
    shift_left sl(
    .in0(data0), 
    .in1(data1), 
    .out0(w_sl)
    );
    add add_0(
    .in0(data0), 
    .in1(data1), 
    .out0(w_add), 
    .overflow(overflow_flag)
    );
    sub sub_0(
    .in0(data0), 
    .in1(data1), 
    .out0(w_sub)
    ); 
    and8b and8b_0(
    .in0(data0), 
    .in1(data1), 
    .out0(w_and)
    );
    or8b or8b_0 (
    .in0(data0), 
    .in1(data1), 
    .out0(w_or)
    );
    xor8b xor8b_0(
    .in0(data0), 
    .in1(data1), 
    .out0(w_xor)
    );
    special8 special_0(
    .in0(data0), 
    .in1(data1), 
    .out0(w_spec[0])
    );
    mux mux_0(
    .in0(w_sr), 
    .in1(w_sl), 
    .in2(w_add), 
    .in3(w_sub), 
    .sel(sel_op),
    .out0(w_mux_0)
    );
    mux mux_1(
    .in0(w_and), 
    .in1(w_or), 
    .in2(w_xor), 
    .in3(w_spec), 
    .sel(sel_op), 
    .out0(w_mux_1)
    );
    mux mux_final(
    .in0(w_mux_0), 
    .in1(w_mux_1), 
    .in2(8'd0), 
    .in3(8'd0), 
    .sel(sel_type), 
    .out0(w_res_final)
    );
    comp_esq comp_esq_0(
    .in0(w_res_final), 
    .in1(8'd0), 
    .out0(zero_flag)
    );
    demux4 demux_0(
    .in0(w_res_final),
    .sel(sel_loc), 
    .out0(out0), 
    .out1(out1), 
    .out2(out2), 
    .out3(out3)
    );
endmodule