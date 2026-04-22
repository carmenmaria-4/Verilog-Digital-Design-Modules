`timescale 1ns / 1ps
module tb();

logic [7:0] sel;
logic [1:0] in0;
logic [1:0] in1;
logic out_ok;
logic out_of;
logic [1:0] out0, out1, out2, out3;
logic [7:0] out_sel;

top top_0(.*);

initial begin
    sel=0; 
    in0=0;
    in1=0;
    #10
    sel=8'h02;
    in0=2'b01;
    in1=2'b01;
    #5
    in0=2'b10;
    #5
    sel=8'hf0;
    in0=2'b11;
    #5
    in1=2'b00;
    #5 
    sel=0;
    #5
    in0=0;
    in1=0;
    #15 $stop();
    
end

endmodule
