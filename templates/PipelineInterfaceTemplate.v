`timescale 1ns / 1ps

// used for generating pipeline interface modules
// generated file, do not edit
module PipelineInterface_/*placeholder{0}*/
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
/*placeholder{1}*/
);
    always @(posedge clk or negedge async_rst) begin;
        if (!async_rst) begin
            // do async reset
            // signal_o <= 0;
/*placeholder{2}*/
        end else if (sync_rst) begin
            // do sync reset 
            // signal_o <= 0;
/*placeholder{2}*/
        end else if(en) begin
            // propagate to next pipeline stage
            // signal_o <= signal_i;
/*placeholder{3}*/
        end
    end
endmodule