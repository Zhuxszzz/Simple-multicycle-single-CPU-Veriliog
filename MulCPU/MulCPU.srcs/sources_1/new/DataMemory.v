`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 20:40:24
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
input CLK,
input [31:0] address,
input [31:0] writeData, // [31:24], [23:16], [15:8], [7:0]
input mRD,	// 为 0，正常读；为 1,输出高组态
input mWR,	// 为 0，写；为 1，无操作
output  [31:0] Dataout
);
    
reg [7:0] ram [1:61]; 

assign Dataout[7:0] = (mRD==1)?ram[address + 3]:8'bz; 
assign Dataout[15:8] = (mRD==1)?ram[address + 2]:8'bz;
assign Dataout[23:16] = (mRD==1)?ram[address + 1]:8'bz;
assign Dataout[31:24] = (mRD==1)?ram[address ]:8'bz;

always@( negedge CLK ) begin
      if( mWR==1 ) begin
         ram[address] <= writeData[31:24];
         ram[address+1] <= writeData[23:16];
         ram[address+2] <= writeData[15:8];
         ram[address+3] <= writeData[7:0];
      end
end
endmodule
