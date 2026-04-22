`timescale 1ns / 1ps

module romand(
    input logic [3:0] in,
    output logic [1:0] out
    );
    //romand e acelasi lucru ca romadd doar ca pt &
    always_comb begin 
        case(in)
        4'b00_00: out = 2'd0; // 0&0=1
        4'b00_01: out = 2'd0; // 0&1=0
        4'b00_10: out = 2'd0; // 0&2=0
        4'b00_11: out = 2'd0; // 0&3=0
            
        4'b01_00: out = 2'd0; // 1&0=0
        4'b01_01: out = 2'd1; // 1&1=1
        4'b01_10: out = 2'd0; // 1&2=0
        4'b01_11: out = 2'd1; // 1&3=1
            
        4'b10_00: out = 2'd0; // 2&0=0
        4'b10_01: out = 2'd0; // 2&1=0
        4'b10_10: out = 2'd2; // 2&2=1 - o data pot sa fac &
        4'b10_11: out = 2'd2; // 2&3=1 - de 2 ori pot sa fac &
        
        4'b11_00: out = 2'd0; // 3&0=0
        4'b11_01: out = 2'd1; // 3&1=1 - o data fac anc
        4'b11_10: out = 2'd2; // 3&2=2 - de 2 ori pot sa fac &
        4'b11_11: out = 2'd3; // 3&3=3 - de 3 ori pot sa fac &
        default : out =2'b00;
        endcase
    end
endmodule
