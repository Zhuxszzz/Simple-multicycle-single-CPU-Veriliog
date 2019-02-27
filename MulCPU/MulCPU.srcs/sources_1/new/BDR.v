`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 19:27:07
// Design Name: 
// Module Name: BDR
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


module BDR(CLK,ReadData2, ReadData2_out);
    input CLK;
    input [31:0] ReadData2;
    output reg [31:0] ReadData2_out;
    always @(posedge CLK) begin
        ReadData2_out<= ReadData2;
    end
endmodule
