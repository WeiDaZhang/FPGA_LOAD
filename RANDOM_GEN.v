`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2018 17:52:31
// Design Name: 
// Module Name: RANDOM_GEN
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RANDOM_GEN #
(
    parameter INIT_VALUE = 49'h1_55AA_AA55_55AA
)
(
    input CLK,
    input RESET,
    output DATA_OUT
);
wire    [48:0]  LFSR_OUT;
wire    [47:0]  MULT_OUT;
LFSR_49Bit #
(
    .INIT_VALUE(INIT_VALUE)
)
LFSR_49Bit_Inst
(
    .CLK(CLK),       //input         CLK,
    .RESET(RESET),     //input         RESET,
    .DATA_OUT(LFSR_OUT)   //output [48:0] DATA_OUT
);

DSP_WRAP DSP_WRAP_Inst
(
    .CLK(CLK),         //input CLK,
    .USE_MULT(LFSR_OUT[48]),    //input USE_MULT,
    .DATA_IN(LFSR_OUT[47:0]),     //input [47:0] DATA_IN,
    .DATA_OUT(MULT_OUT)     //output [47:0] DATA_OUT
);

assign DATA_OUT = ^MULT_OUT;
endmodule
