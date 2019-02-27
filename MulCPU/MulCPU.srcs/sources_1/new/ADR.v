`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 19:18:36
// Design Name: 
// Module Name: ADR
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


module ADR(CLK,ReadData1, ReadData1_out);
    input CLK;
    input [31:0] ReadData1;
    output reg [31:0] ReadData1_out;
    always @(posedge CLK) begin
        ReadData1_out<= ReadData1;
    end
endmodule