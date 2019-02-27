`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 21:11:31
// Design Name: 
// Module Name: WriteSelect
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

module WriteSelect(
    input CLK,
    input DBDataSrc,
    input  [31:0] Result,
    input  [31:0] DataOut,
    output reg [31:0] WriteData
    );
    always@* begin
     if(DBDataSrc==0)
     WriteData=Result;
     else
     WriteData=DataOut;
     end
endmodule
