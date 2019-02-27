`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 20:59:01
// Design Name: 
// Module Name: GO
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


module GO(
    );
    reg CLK, RST;
    wire [5:0]  opcode;  
    wire [31:0] ReadData1, ReadData2, curPC, nextPC, result, ReadData1_out,ReadData2_out,result_out,DataOut;
    wire [2:0]  ALUOp;
    wire [31:0] ExtOut,DM,DMOut,DB, A, B, Wdata, sa;
    wire [15:0] immediate;
    wire [4:0]  rs, rt, rd, Wreg;
    wire [2:0]  state, next_state;
    wire zero,sign,PCWre,ALUSrcA, ALUSrcB, DBSrc, RegWre,WrRegDSrc, InsMemRW,RD,WR,IRWre, ExtSel;
    wire [1:0]  PCSrc,RegDst;
    wire [25:0] add;
    RunCPU test( .CLK(CLK), .RST(RST), .opcode(opcode), .ReadData1(ReadData1), .ReadData2(ReadData2),  .curPC(curPC), .nextPC(nextPC), .result(result), .ReadData1_out(ReadData1_out), .ReadData2_out(ReadData2_out),.result_out(result_out),
               .DataOut(DataOut), .ALUOp(ALUOp),.ExtOut(ExtOut),.DM(DM),.DMOut(DMOut),.DB(DB),.A(A),.B(B),.Wdata(Wdata),.sa(sa), .immediate(immediate), .rs(rs), .rt(rt), .rd(rd),.Wreg(Wreg),.state(state),
               .zero(zero), .sign(sign),.PCWre(PCWre), .PCSrc(PCSrc),.ALUSrcA(ALUSrcA), .ALUSrcB(ALUSrcB), .DBSrc(DBSrc), .RegWre(RegWre),.WrRegDSrc(WrRegDSrc), .InsMemRW(InsMemRW), .RD(RD),.WR(WR),.IRWre(IRWre), .ExtSel(ExtSel), .RegDst(RegDst),.add(add));
    initial begin
        CLK = 0;
        RST = 0;
    end
    always #100 CLK = ~CLK;
    always #150 RST = 1;
endmodule
