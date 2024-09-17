`timescale 1ns / 1ps

// used for generating pipeline interface modules
// generated file, do not edit
module PipelineInterface_IF_ID
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
);
    always @(posedge clk or negedge async_rst) begin;
        if (!async_rst) begin
            // do async reset
            // signal_o <= 0;
            IR_o <= 0;
            PC_o <= 0;
        end else if (sync_rst) begin
            // do sync reset 
            // signal_o <= 0;
            IR_o <= 0;
            PC_o <= 0;
        end else if(en) begin
            // propagate to next pipeline stage
            // signal_o <= signal_i;
            IR_o <= IR_i;
            PC_o <= PC_i;
        end
    end
endmodule