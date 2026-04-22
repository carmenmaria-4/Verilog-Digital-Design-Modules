`timescale 1ns / 1ps
//
module rom_add(
    input logic [3:0] in,
    output logic [1:0] out
    );
//rom_add concateneaza data1 si data 2 si returneaza adunarea 
//dintre ele    
    always_comb begin
        case(in)
            4'b00_00: out = 2'd0; // 0+0 = 0
            4'b00_01: out = 2'd1; // 0+1 = 1
            4'b00_10: out = 2'd2; // 0+2 = 2
            4'b00_11: out = 2'd3; // 0+3 = 3
            
            4'b01_00: out = 2'd1; // 1+0 = 1
            4'b01_01: out = 2'd2; // 1+1 = 2
            4'b01_10: out = 2'd3; // 1+2 = 3
            4'b01_11: out = 2'd0; // 1+3 = 4 (Overflow -> devine 0 pe 2 biti)
            
            4'b10_00: out = 2'd2; // 2+0 = 2
            4'b10_01: out = 2'd3; // 2+1 = 3
            4'b10_10: out = 2'd0; // 2+2 = 4 (Overflow -> 0)
            4'b10_11: out = 2'd1; // 2+3 = 5 (Overflow -> 1)
            
            4'b11_00: out = 2'd3; // 3+0 = 3
            4'b11_01: out = 2'd0; // 3+1 = 4 (Overflow -> 0)
            4'b11_10: out = 2'd1; // 3+2 = 5 (Overflow -> 1)
            4'b11_11: out = 2'd2; // 3+3 = 6 (Overflow -> 2)
            
            default:  out = 2'd0;
        endcase
    end
endmodule
