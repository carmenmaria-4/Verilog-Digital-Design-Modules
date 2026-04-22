`timescale 1ns / 1ps

module overflow_compute(
    input logic [1:0] in0,
    input logic [1:0] in1,
    output logic out0 //overflow -1 daca rezultatul >3, 0 rest
    );
    logic [2:0] full_sum;
    assign full_sum = in0 + in1;
    
    // Dacă bitul de index 2 (al treilea) este 1, avem overflow
    assign out0 = full_sum[2];
    
endmodule
