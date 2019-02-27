`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 19:34:29
// Design Name: 
// Module Name: DBDR
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


module DBDR(CLK,ReadData2, ReadData2_out);
    input CLK;
    input [31:0] ReadData2;
    output reg [31:0] ReadData2_out;
    always @(posedge CLK) begin
        ReadData2_out<= ReadData2;
    end
endmodule
