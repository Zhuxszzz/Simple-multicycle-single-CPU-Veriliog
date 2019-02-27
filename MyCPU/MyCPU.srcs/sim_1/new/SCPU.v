`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/25 00:17:44
// Design Name: 
// Module Name: SCPU
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


module SCPU( );
        reg CLK,Reset;
     wire [5:0] Opcode;
     wire [31:0] ReadData1,ReadData2,CurPC,NextPC,Result;
     wire [2:0] ALUop;
     wire [31:0] ExtOut ,DataOut,RegA,RegB,WriteData,sa;
     wire [15:0] Immediate;
     wire [4:0] ReadReg1,ReadReg2,Rd,WriteReg;
     wire Sign,Zero, PCWre;
     wire [1:0] PCSrc;
     wire ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, ExtSel, RegDst,mWR,mRD;
     wire [27:0]  jumpaddress;
    CPUgo test(.CLK(CLK),.Reset(Reset),.Opcode(Opcode),.ReadData1(ReadData1),.ReadData2(ReadData2),.CurPC(CurPC),.NextPC(NextPC),.Result(Result),
    .ALUop(ALUop),.ExtOut(ExtOut),.DataOut(DataOut),.RegA(RegA),.RegB(RegB),.WriteData(WriteData),.sa(sa),.Immediate(Immediate),.ReadReg1(ReadReg1),
    .ReadReg2(ReadReg2),.Rd(Rd),.WriteReg(WriteReg),.Sign(Sign) ,.Zero(Zero),.PCWre(PCWre),.PCSrc(PCSrc),.ALUSrcA(ALUSrcA),.ALUSrcB(ALUSrcB),
    .DBDataSrc(DBDataSrc),.RegWre(RegWre),.InsMemRW(InsMemRW),.ExtSel(ExtSel),.RegDst(RegDst),.mWR(mWR),.mRD(mRD) ,. jumpaddress( jumpaddress) );
          initial 
           begin
               CLK = 1;
               Reset = 0;
           end
        always #100 CLK = ~CLK; // 周期为 100ns
        always #150 Reset = 1;  //运行时重置Reset
endmodule
