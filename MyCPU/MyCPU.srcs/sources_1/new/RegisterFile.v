`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/21 21:45:08
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
 CLK,RegWre,ReadReg1,ReadReg2, WriteReg,WriteData,ReadData1,ReadData2
    );
    input CLK;
    input RegWre;
    input [4:0] ReadReg1,ReadReg2,WriteReg;
    input [31:0] WriteData;
    output [31:0] ReadData1,ReadData2;
    reg [31:0] regFile[0:31]; // �Ĵ������������reg���� 
    integer i;
    initial begin
        for(i=0;i<32;i=i+1)
               regFile[i] = 0;
    end
    assign ReadData1 = (ReadReg1 == 0) ? 0 : regFile[ReadReg1];  // ���Ĵ�������
    assign ReadData2 = (ReadReg2 == 0) ? 0 : regFile[ReadReg2];
    always @ (negedge CLK) begin // ������ʱ�ӱ��ش��� 
        if(RegWre == 1 && WriteReg != 0)
            regFile[WriteReg] <= WriteData;
    // WriteReg != 0�� // д�Ĵ���
    end
endmodule
