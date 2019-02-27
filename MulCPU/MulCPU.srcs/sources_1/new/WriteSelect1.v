`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 18:46:19
// Design Name: 
// Module Name: WriteSelect1
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


module WriteSelect1(
input CLK,
    input WrRegDsrc,
   // input  [31:0] Result,   
    input [31:0] curPC,
    input  [31:0] DataOut,
    output reg [31:0] WriteData
    );
    always@* begin
     WriteData=WrRegDsrc?DataOut:(curPC+4);
     end
endmodule
