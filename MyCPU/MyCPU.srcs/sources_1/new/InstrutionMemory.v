`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/21 21:29:24
// Design Name: 
// Module Name: InstrutionMemory
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
input [31:0] curPC,
input InsMemRW,
output  [5:0] Opcode,
output  [4:0] rs, rt, rd,
output  [31:0] sa,  
output  [15:0] immediate,
output  [27:0] jumpaddress
    );
    reg [7:0] mem [99:0]; // 存储器定义必须用reg类型，存储器存储单元8位长度，共100个存储单元
   // reg [31:0] dataOut;
    initial begin    // 加载数据到存储器rom。注意：必须使用绝对路径，如：E:/Xlinx/VivadoProject/ROM/（自己定）
    
    $readmemb ("D:/Study/CODE/Mywork/1.txt", mem); // 数据文件rom_data（.coe或.txt）。未指定，就从0地址开始存放。
    
    end
    
        assign Opcode = mem[curPC[7:0]][7:2];  
        assign rs = {mem[curPC[7:0]][1:0],mem[curPC+1][7:5]};  
        assign rt = mem[curPC[7:0]+1][4:0];  
        assign rd = mem[curPC[7:0]+2][7:3];
        assign sa[5:0] = {mem[curPC[7:0]+2][2:0],mem[curPC+3][7:6]};
        assign sa[31:6] = 26'h0000;                         //扩展sa为32位
        assign immediate = {mem[curPC[7:0]+2][7:0],mem[curPC+3][7:0]};
        assign jumpaddress[27:2]={rs[4:0],rt[4:0],immediate[15:0]};
        assign jumpaddress[1:0]=2'b00;
       endmodule
