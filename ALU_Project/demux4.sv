module demux4(
    input  logic [7:0] in0,
    input  logic [1:0] sel,
    output logic [7:0] out0, out1, out2, out3
);
    always_comb begin
        out0 = 8'd0; out1 = 8'd0; out2 = 8'd0; out3 = 8'd0;
        case(sel)
            2'b00: out0 = in0;
            2'b01: out1 = in0;
            2'b10: out2 = in0;
            2'b11: out3 = in0;
        endcase
    end
endmodule