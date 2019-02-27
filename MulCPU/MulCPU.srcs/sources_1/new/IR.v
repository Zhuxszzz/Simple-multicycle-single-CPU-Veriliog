`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 19:11:16
// Design Name: 
// Module Name: IR
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


module IR(
    input CLK,
    input  [31:0] DataOut,
    input IRWre,
    output reg [5:0] opcode,
    output  reg [4:0] rs, rt, rd,
    output  reg [15:0] immediate,
    output  reg [31:0] sa,
    output  reg [25:0] add
    );
    always@( posedge CLK) begin
    if(IRWre==1)begin
              opcode <= DataOut[31:26];  
               rs = DataOut[25:21];  
              rt = DataOut[20:16];  
              rd = DataOut[15:11];
               sa[5:0] = DataOut[10:6];
              sa[31:6] = 26'h0000;
               immediate = DataOut[15:0];
             add = DataOut[25:0];
           end
        end
    endmodule
