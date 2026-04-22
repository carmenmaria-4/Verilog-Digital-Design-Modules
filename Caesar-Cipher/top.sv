module top(
    input logic [7:0] in0, 
    input logic [3:0] offset,
    output logic [7:0] out0
    );
    logic w_cg;
    logic [7:0] w_out_sum;
    logic [7:0] w_out_dif;
    logic [7:0] w_out_p;
    logic [7:0] w_out_mux;
    
    preprocesare preprocesare_0(
    .in0(in0),
    .out0(w_out_p)
    );
   sum sum_0(
   .in0(w_out_p),
   .in1({4'b0000, offset}),
   .out0(w_out_sum)
   );
   sub sub_2(
   .in0(w_out_sum),
   .in1(8'd26),
   .out0(w_out_dif)
   );
   comp_greater comp_greater_0(
   .in0(w_out_sum),
   .in1(8'd26),
   .out0(w_cg)
   );
   mux mux_0(
   .in0(w_out_sum),
   .in1(w_out_dif),
   .sel(w_cg),
   .out0(w_out_mux)
   );
   sum sum_1(
   .in0(w_out_mux),
   .in1(8'd97),
   .out0(out0)
   );
   endmodule 