`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/25 14:36:27
// Design Name: 
// Module Name: CPUgo
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



module CPUgo(
        input CLK,Reset,
        output wire [5:0] Opcode,
        output wire [31:0] ReadData1,ReadData2,CurPC,NextPC,Result,
        output wire [2:0] ALUop,
        output wire [31:0] ExtOut ,DataOut,RegA,RegB,WriteData,sa,
        output wire [15:0] Immediate,
        output wire [4:0] ReadReg1,ReadReg2,Rd,WriteReg,
        output wire Sign,Zero, PCWre, 
        output wire [1:0]PCSrc,
        output wire ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, ExtSel, RegDst,mWR,mRD,
        output wire [27:0] jumpaddress
    );
    ALU ALU(ALUop,RegA,RegB,Result,Zero,Sign);
    PC PC(CLK,Reset,PCWre,NextPC,CurPC);
    nextPC nextPC(PCSrc,CurPC,ExtOut, jumpaddress,NextPC);
    ControlUnit ControlUnit(Sign,Zero,Opcode,RegWre,ALUSrcA,ALUSrcB,PCSrc,ALUop,RegDst,InsMemRW,PCWre,ExtSel,mRD,mWR,DBDataSrc);
    RAM RAM(CLK,Result,ReadData2,mRD,mWR,DataOut);
    InstrutionMemory  InstructionMemory(CurPC,InsMemRW,Opcode,ReadReg1,ReadReg2,Rd,sa,Immediate, jumpaddress);
    RegisterFile RegisterFile(CLK,RegWre,ReadReg1,ReadReg2,WriteReg,WriteData,ReadData1,ReadData2);
    Sign_Zero_Extend  Sign_Zero_Extend(Immediate,ExtSel,ExtOut);
    Mux_TwoToOneReg Mux_TwoToOneReg(RegDst,ReadReg2,Rd,WriteReg);
    Mux_TwoToOne_ForInputA  Mux_TwoToOne_ForInputA(ALUSrcA,ReadData1,sa,RegA);
    Mux_TwoToOne  Mux_TwoToOne(ALUSrcB,ReadData2,ExtOut,RegB);
    WriteSelect  WriteSelect(DBDataSrc,Result,DataOut,WriteData);
endmodule
