`timescale 1ns / 1ps
module tb();
    logic [15:0] instruction;
    logic [7:0] data0, data1;
    logic [7:0] out0, out1, out2, out3;
    logic overflow_flag, zero_flag;
    top top_0(.*);

    initial begin
        instruction = 16'hffff; data0 = 8'd0; data1 = 8'd0; 
        #5 instruction = 16'h0800; data0 = 8'd255; data1 = 8'd255; 
        #5 data0 = 8'd1; data1 = 8'd1;
        #5 data0 = 8'd2; data1 = 8'd3;

        #10 instruction = 16'b00_00_10_0000000000; 
        data0 = 8'd255; data1 = 8'd1; 
        
        #10 instruction = 16'b00_01_00_0000000000; 
        data0 = 8'b10101010; data1 = 8'b01010101;

        #160 $stop;
    end
endmodule