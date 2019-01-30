`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2018 18:08:21
// Design Name: 
// Module Name: Block_Gen
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


module Block_Gen #
(
    parameter BLOCK_SIZE = 32,
    parameter BLOCK_WIDTH = 32
)
(
    input CLK,
    input RESET,
    output DATA_OUT
);

wire    [BLOCK_SIZE*BLOCK_WIDTH - 1:0] RANDOM_GEN_DATA_OUT;
genvar i;
generate
    for (i = 0; i < BLOCK_SIZE*BLOCK_WIDTH; i = i + 1)
    begin: RANDGEN
        RANDOM_GEN #
        (
            .INIT_VALUE(49'h1_55AA_AA55_55AA + i*7)
        )
        RANDOM_GEN_Inst
        (
            .CLK(CLK),//input CLK,
            .RESET(RESET),//input RESET,
            .DATA_OUT(RANDOM_GEN_DATA_OUT[i])//output DATA_OUT
        );
    end
endgenerate

reg [BLOCK_SIZE - 1:0]  RGDOUT;
genvar j;
generate
    for (j = 0; j < BLOCK_SIZE; j = j + 1)
    begin: XNOR_RGDOUT
        always@(posedge CLK)
        begin
            if(RESET)
            begin
                RGDOUT[j] = 0;
            end
            else
            begin
                RGDOUT[j] = ~^RANDOM_GEN_DATA_OUT[( (j + 1) * BLOCK_WIDTH - 1 ) : ( j * BLOCK_WIDTH )];
            end
        end
    end
endgenerate

assign DATA_OUT = ^RGDOUT;
endmodule
