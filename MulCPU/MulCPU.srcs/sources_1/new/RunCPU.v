`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 19:42:31
// Design Name: 
// Module Name: RunCPU
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


module RunCPU(
    input CLK, RST,  
output wire [5:0]  opcode,  
output wire [31:0] ReadData1, ReadData2, curPC, nextPC, result, ReadData1_out,ReadData2_out,result_out,DataOut,
output wire [2:0]  ALUOp,
output wire [31:0] ExtOut,DM,DMOut,DB, A, B, Wdata, sa,
output wire [15:0] immediate,
output wire [4:0]  rs, rt, rd, Wreg,
output wire [2:0]  state, 
output wire zero,sign,PCWre,ALUSrcA, ALUSrcB, DBSrc, RegWre,WrRegDSrc, InsMemRW,RD,WR,IRWre, ExtSel,
output wire [1:0]  PCSrc,RegDst,
output wire [25:0] add
    );   
    InstrutionMemory InstrutionMemory(CLK,curPC, InsMemRW,DataOut);
    ControlUnit Control(CLK,RST,zero,sign,opcode,PCWre,ALUSrcA,ALUSrcB,DBSrc,RegWre,WrRegDSrc,InsMemRW,RD,WR,IRWre,ExtSel,PCSrc,RegDst,ALUOp,state);  
   ALU ALU(CLK,ALUOp, A, B, zero, sign,result);  
     PC PC(CLK,RST,PCWre,nextPC,curPC);
     NextPC NextPC(CLK,PCSrc, ExtOut, curPC, ReadData1, add, nextPC);
     DataMemory DataMemory(CLK,result_out,ReadData2_out,RD,WR,DMOut);  
     IR IR(CLK,DataOut,IRWre,opcode,rs,rt,rd,immediate,sa,add);  
     RegisterFile RegisterFile(CLK,RegWre,rs, rt, Wreg, Wdata ,ReadData1, ReadData2);  
     Sign_Zero_Extend Sign_Zero_Extend(CLK,immediate, ExtSel, ExtOut);
      Mux_Three_To_OneReg  Mux_Three_To_OneReg(CLK,RegDst,rt,rd,Wreg);
     ADR ADR(CLK,ReadData1,ReadData1_out);
     BDR BDR(CLK,ReadData2,ReadData2_out);
     ALUoutDR ALUoutDR(CLK,result,result_out);
     DBDR DBDR(CLK,DM,DB);
     Mux_Two_To_One_A Mux_Two_To_One_A(CLK,ALUSrcA,ReadData1, sa, A);
     Mux_Two_To_One_B Mux_Two_To_One_B(CLK,ALUSrcB,ReadData2, ExtOut, B);
     WriteSelect WriteSelect(CLK,DBSrc,result,DMOut,DM);
     WriteSelect1 WriteSelect1(CLK,WrRegDSrc,curPC, DB, Wdata);
endmodule
