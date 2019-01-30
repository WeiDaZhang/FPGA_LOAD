`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2018 17:22:18
// Design Name: 
// Module Name: 49BitLFSR
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


module LFSR_49Bit #
(
    parameter INIT_VALUE = 49'h1_55AA_AA55_55AA
)
(
    input CLK,
    input RESET,
    output [48:0] DATA_OUT
);
reg [48:0] DATA_OUT;
always@(posedge CLK)
begin
    if(RESET)
    begin
        DATA_OUT = INIT_VALUE;
    end
    else
    begin
        DATA_OUT[48:1] = DATA_OUT[47:0];
        DATA_OUT[0] = DATA_OUT[48]^~DATA_OUT[39];
    end
end
endmodule
