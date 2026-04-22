module mux(
    input  logic [7:0] in0, in1, in2, in3,
    input  logic [1:0] sel,
    output logic [7:0] out0
);
    always_comb begin
        case(sel)
            2'b00: out0 = in0;
            2'b01: out0 = in1;
            2'b10: out0 = in2;
            2'b11: out0 = in3;
        endcase
    end
endmodule