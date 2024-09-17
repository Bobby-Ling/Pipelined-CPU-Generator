`timescale 1ns / 1ps

// used for generating pipeline interface modules
// generated file, do not edit
module PipelineInterface_ID_EX
#(
    parameter DEBUG=0
)
(
    input  clk;
    input  async_rst;
    input  sync_rst;
    input  en;
    // input      [31:0] signal_i;
    // output reg [31:0] signal_o;
    input      [31:0] IR_i;
    output reg [31:0] IR_i;
    input      [31:0] PC_i;
    output reg [31:0] PC_i;
    input       JALR_i;
    output reg  JALR_i;
    input       JAL_i;
    output reg  JAL_i;
    input       ECALL_i;
    output reg  ECALL_i;
    input       RegWrite_i;
    output reg  RegWrite_i;
    input       MemtoReg_i;
    output reg  MemtoReg_i;
    input      [31:0] R1_i;
    output reg [31:0] R1_i;
    input      [31:0] R2_i;
    output reg [31:0] R2_i;
    input      [4:0] WrtNo_i;
    output reg [4:0] WrtNo_i;
    input       MemWrite_i;
    output reg  MemWrite_i;
    input       AluRst2_i;
    output reg  AluRst2_i;
    input       Branch_i;
    output reg  Branch_i;
    input      [3:0] AluOp_i;
    output reg [3:0] AluOp_i;
    input       Alu1U_i;
    output reg  Alu1U_i;
    input       Alu2U_i;
    output reg  Alu2U_i;
    input       AluSrcB_i;
    output reg  AluSrcB_i;
    input       SType_i;
    output reg  SType_i;
    input       URET_i;
    output reg  URET_i;
    input       rs1Fwd_i;
    output reg  rs1Fwd_i;
    input       rs2Fwd_i;
    output reg  rs2Fwd_i;
    input      [31:0] I_Imm12_i;
    output reg [31:0] I_Imm12_i;
    input      [31:0] S_Imm12_i;
    output reg [31:0] S_Imm12_i;
    input      [31:0] B_Imm12_i;
    output reg [31:0] B_Imm12_i;
    input      [31:0] U_Imm20_i;
    output reg [31:0] U_Imm20_i;
    input      [31:0] UJ_Imm20_i;
    output reg [31:0] UJ_Imm20_i;
);
    always @(posedge clk or negedge async_rst) begin;
        if (!async_rst) begin
            // do async reset
            // signal_o <= 0;
            IR_o <= 0;
            PC_o <= 0;
            JALR_o <= 0;
            JAL_o <= 0;
            ECALL_o <= 0;
            RegWrite_o <= 0;
            MemtoReg_o <= 0;
            R1_o <= 0;
            R2_o <= 0;
            WrtNo_o <= 0;
            MemWrite_o <= 0;
            AluRst2_o <= 0;
            Branch_o <= 0;
            AluOp_o <= 0;
            Alu1U_o <= 0;
            Alu2U_o <= 0;
            AluSrcB_o <= 0;
            SType_o <= 0;
            URET_o <= 0;
            rs1Fwd_o <= 0;
            rs2Fwd_o <= 0;
            I_Imm12_o <= 0;
            S_Imm12_o <= 0;
            B_Imm12_o <= 0;
            U_Imm20_o <= 0;
            UJ_Imm20_o <= 0;
        end else if (sync_rst) begin
            // do sync reset 
            // signal_o <= 0;
            IR_o <= 0;
            PC_o <= 0;
            JALR_o <= 0;
            JAL_o <= 0;
            ECALL_o <= 0;
            RegWrite_o <= 0;
            MemtoReg_o <= 0;
            R1_o <= 0;
            R2_o <= 0;
            WrtNo_o <= 0;
            MemWrite_o <= 0;
            AluRst2_o <= 0;
            Branch_o <= 0;
            AluOp_o <= 0;
            Alu1U_o <= 0;
            Alu2U_o <= 0;
            AluSrcB_o <= 0;
            SType_o <= 0;
            URET_o <= 0;
            rs1Fwd_o <= 0;
            rs2Fwd_o <= 0;
            I_Imm12_o <= 0;
            S_Imm12_o <= 0;
            B_Imm12_o <= 0;
            U_Imm20_o <= 0;
            UJ_Imm20_o <= 0;
        end else if(en) begin
            // propagate to next pipeline stage
            // signal_o <= signal_i;
            IR_o <= IR_i;
            PC_o <= PC_i;
            JALR_o <= JALR_i;
            JAL_o <= JAL_i;
            ECALL_o <= ECALL_i;
            RegWrite_o <= RegWrite_i;
            MemtoReg_o <= MemtoReg_i;
            R1_o <= R1_i;
            R2_o <= R2_i;
            WrtNo_o <= WrtNo_i;
            MemWrite_o <= MemWrite_i;
            AluRst2_o <= AluRst2_i;
            Branch_o <= Branch_i;
            AluOp_o <= AluOp_i;
            Alu1U_o <= Alu1U_i;
            Alu2U_o <= Alu2U_i;
            AluSrcB_o <= AluSrcB_i;
            SType_o <= SType_i;
            URET_o <= URET_i;
            rs1Fwd_o <= rs1Fwd_i;
            rs2Fwd_o <= rs2Fwd_i;
            I_Imm12_o <= I_Imm12_i;
            S_Imm12_o <= S_Imm12_i;
            B_Imm12_o <= B_Imm12_i;
            U_Imm20_o <= U_Imm20_i;
            UJ_Imm20_o <= UJ_Imm20_i;
        end
    end
endmodule