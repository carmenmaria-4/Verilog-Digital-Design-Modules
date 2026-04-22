`timescale 1ns / 1ps
module tb();
logic [7:0] in0;
logic [3:0] offset;
logic [7:0] out0;

top top_0(.*); 

initial begin
    offset=4'd0;
    in0="a";
    #5
    in0="b";
    #5
    in0="c";
    #10
    in0="a";
    offset=4'd4;
    #5
    in0="b";
    #5
    in0="x";
    #5
    in0="y";
    #5
    in0="z";
    #10
    in0="a";
    offset=4'd10;
    #5
    in0="b";
    #10 $stop();
end
endmodule
