module special8(
    input  logic [7:0] in0, in1,
    output logic out0
);
    assign out0 = (in0[7] == in0[0]) && (in0[0] == in1[7]) && (in1[7] == in1[0]);
endmodule