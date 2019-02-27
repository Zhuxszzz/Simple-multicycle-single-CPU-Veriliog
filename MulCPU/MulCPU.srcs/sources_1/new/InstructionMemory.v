`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 18:51:30
// Design Name: 
// Module Name: InstructionMemory
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


module InstrutionMemory(
inout CLK,
input [31:0] curPC,
input InsMemRW,
output  [31:0] DataOut
    );
   reg [7:0] mem[0:255];
        integer i;
        initial begin
            $readmemb("D:/Study/CODE/Mywork/2.txt", mem);
        end
       // always @(negedge CLK) begin
         //   if(InsMemRW) begin
           assign     DataOut[31:24] = mem[curPC[7:0]];
            assign    DataOut[23:16] = mem[curPC[7:0]+1];
            assign    DataOut[15:8]  = mem[curPC[7:0]+2];
            assign    DataOut[7:0]   = mem[curPC[7:0]+3];
     //      end
      //  end
    endmodule