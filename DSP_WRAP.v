`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2018 16:59:52
// Design Name: 
// Module Name: DSP_WRAP
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


module DSP_WRAP
(
    input CLK,
    input USE_MULT,
    input [47:0] DATA_IN,
    output [47:0] DATA_OUT
);

wire [47:0] P_LUT;
wire [47:0] P_MULT;
//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
mult_gen_LUT mult_gen_LUT_Inst
(
  .CLK(CLK),  // input wire CLK
  .A(DATA_IN[23:0]),      // input wire [47 : 0] A
  .B(DATA_IN[47:24]),      // input wire [47 : 0] B
  .P(P_LUT)      // output wire [47 : 0] P
);
// INST_TAG_END ------ End INSTANTIATION Template ---------


//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
mult_gen_DSP mult_gen_DSP_Inst
(
  .CLK(CLK),  // input wire CLK
  .A(DATA_IN[23:0]),      // input wire [47 : 0] A
  .B(DATA_IN[47:24]),      // input wire [47 : 0] B
  .P(P_MULT)      // output wire [47 : 0] P
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

assign DATA_OUT = USE_MULT?P_LUT:P_MULT;

endmodule
