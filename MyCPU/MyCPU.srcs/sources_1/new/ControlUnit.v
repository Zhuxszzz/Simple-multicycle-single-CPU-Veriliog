`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 19:30:13
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
input sign,zero,[5:0] Opcode,
output reg RegWre,ALUSrcA,ALUSrcB,
output reg [1:0] PCSrc,reg [2:0] ALUop,
output reg RegDst,InsMemRW,PCWre,ExtSrc,mRD,mWR,DBDataSrc
    );
    	always @(Opcode or zero or sign) begin
        case (Opcode)
            6'b000000: begin //add
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 1;
                ExtSrc = 1;
                RegDst = 1;
                mRD    = 1;
                mWR = 1;
                PCSrc[1:0] = 2'b00;
                ALUop[2:0] = 3'b000;
  
            end

            6'b000001: begin //sub
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 1;
                ExtSrc = 1;
                RegDst = 1;
                mRD    = 1;
                mWR = 1;
                PCSrc[1:0] = 2'b00;
                ALUop[2:0] = 3'b001;
            end
            6'b000010: begin //addiu
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 0;
                RegWre = 1;
                ExtSrc = 1;
                RegDst = 0;
                mRD    = 1;
                mWR = 1;
                PCSrc[1:0] = 2'b00;
                ALUop[2:0] = 3'b000;
            end
            6'b010000: begin // andi
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 0;
                RegWre = 1;
                ExtSrc = 0;
                RegDst = 0;
                mRD    = 1;
                mWR = 1;
                PCSrc[1:0] = 2'b00;
                ALUop[2:0] = 3'b100;
            end
            6'b010001: begin // and rd, rs, rt
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 1;
                ExtSrc = 1;
                RegDst = 1;
                mRD    = 1;
                mWR = 1;
                PCSrc[1:0] = 2'b00;
                ALUop[2:0] = 3'b100;
            end
            6'b010010: begin //ori
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 0;
                RegWre = 1;
                ExtSrc = 0;
                RegDst = 0;
                mRD    = 1;
                mWR = 1;
                PCSrc[1:0] = 2'b00;
                ALUop[2:0] = 3'b011;
            end
            6'b010011: begin // or
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 1;
                ExtSrc = 1;
                RegDst = 1;
                mRD    = 1;
                mWR = 1;
                PCSrc[1:0] = 2'b00;
                ALUop[2:0] = 3'b011;
            end
            6'b011000: begin // sll
                PCWre = 1;
                ALUSrcA = 1;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 1;
                ExtSrc = 1;
                RegDst = 1;
                mRD    = 1;
                mWR = 1;
                PCSrc[1:0] = 2'b00;
                ALUop[2:0] = 3'b010;
            end
            6'b011100: begin // slti
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 0;
                RegWre = 1;
                ExtSrc = 1;
                RegDst = 0;
                mRD    = 1;
                mWR = 1;
                PCSrc[1:0] = 2'b00;
                ALUop[2:0] = 3'b110;
            end
            6'b100110: begin // sw
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 0;
                RegWre = 0;
                ExtSrc = 1;
                RegDst = 1;
                mRD    = 1;
                mWR = 0;
                PCSrc[1:0] = 2'b00;
                ALUop[2:0] = 3'b000;
            end
            6'b100111: begin // lw
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 1;
                RegWre = 1;
                ExtSrc = 1;
                RegDst = 0;
                mRD    = 0;
                mWR = 1;
                PCSrc[1:0] = 2'b00;
                ALUop[2:0] = 3'b000;
            end
            6'b110000: begin //beq
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 0;
                ExtSrc = 1;
                RegDst = 1;
                mRD    = 1;
                mWR = 1;
                if (zero == 0) PCSrc[1:0] = 2'b00;
                    else PCSrc[1:0] = 2'b01;
                ALUop[2:0] = 3'b001;
            end
            6'b110001: begin // bne
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0    ;
                DBDataSrc = 0;
                RegWre = 0;
                ExtSrc = 1;
                RegDst = 1;
                mRD    = 1;
                mWR = 1;
                if (zero == 1) PCSrc[1:0] = 2'b00;
                    else PCSrc[1:0] = 2'b01;
                ALUop[2:0] = 3'b001;
            end
            6'b110010: begin // bltz
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 0;
                ExtSrc = 1;
                RegDst = 1;
                mRD    = 1;
                mWR = 1;
                if (zero == 1 || sign == 0) PCSrc[1:0] = 2'b00;
                    else PCSrc[1:0] = 2'b01;
                ALUop[2:0] = 3'b001;
            end
            6'b111000: begin // j
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 0;
                RegWre = 0;
                ExtSrc = 1;
                RegDst = 1;
                mRD    = 1;
                mWR = 1;
                PCSrc[1:0] = 2'b10;
                ALUop[2:0] = 3'b000;
            end
            6'b111111: begin // halt
                PCWre = 0;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 1;
                ExtSrc = 1;
                RegDst = 1;
                mRD    = 1;
                mWR = 1;
                PCSrc[1:0] = 2'b11;
                ALUop[2:0] = 3'b000;
            end
            default : begin
                $display("no instrc");
            end
        endcase
           InsMemRW=1;
    end
endmodule
