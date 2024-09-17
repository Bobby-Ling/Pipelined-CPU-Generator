`timescale 1ns / 1ps

// used for generating pipeline interface modules
// generated file, do not edit
module PipelineInterface_MEM_WB
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
    input      [31:0] AluOut_i;
    output reg [31:0] AluOut_i;
    input      [31:0] CSRData_i;
    output reg [31:0] CSRData_i;
    input      [31:0] MDout_i;
    output reg [31:0] MDout_i;
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
            AluOut_o <= 0;
            CSRData_o <= 0;
            MDout_o <= 0;
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
            AluOut_o <= 0;
            CSRData_o <= 0;
            MDout_o <= 0;
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
            AluOut_o <= AluOut_i;
            CSRData_o <= CSRData_i;
            MDout_o <= MDout_i;
        end
    end
endmodule