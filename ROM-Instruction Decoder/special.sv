`timescale 1ns / 1ps
module special(
    input logic [0:1] in0,
    input logic [0:1] in1,
    output logic [0:1] out0
    );
    logic [0:1] count0;
    logic [0:1] count1;
    //facem output 1 cand nr de biti din in0= nr biti din in0
    always_comb begin
    count0=in0[0]+in0[1];
    count1=in1[0]+in1[1];
    if(count0==count1)
        out0=2'b01;
    else out0=2'b00;
    end
endmodule
