`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 20:43:18
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
 CLK,RegWre,rs,rt, Wreg,Wdata,ReadData1,ReadData2
    );
    input CLK;
    input RegWre;
    input [4:0] rs,rt,Wreg;
    input [31:0] Wdata;
    output [31:0] ReadData1,ReadData2;
     reg [31:0] register[0:31];
        integer i;   
        initial begin 
            for (i = 0; i < 32; i = i+1) register[i]= 0;  
        end  
     assign    ReadData1 = (rs== 0)? 0 : register[rs];
     assign    ReadData2 = (rt== 0)? 0 : register[rt];
        always @(negedge CLK) begin    
            if ((Wreg != 0) && (RegWre == 1)) register[Wreg] <= Wdata;
        end
   endmodule