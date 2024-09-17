`timescale 1ns / 1ps

// Brief: CPU Top Module, synchronized
// Main-Author: EAirPeter
// co-Author: Fluorine Dog, cuishaobo, AzureCrab, ghy
// Modified-By: Bobby Ling
module RiscV32CoreDemo(
    input clk, 
    input async_rst
);

    `include "include/PipelineStageWireDefs.vh"

    // YOUR CODE FOR STAGE IF HERE

    ////////////////////////////
    ///////   ps1 IF/ID  ////////
    assign IF_ID_en = 1;
    assign IF_ID_sync_rst = 0; 
    `include "include/PipelineInterface_IF_ID_Inst.vh"
    ////////////////////////////
    
    // YOUR CODE FOR STAGE ID HERE

    /////////////////////////////
    ///////   ps2 ID/EX  ////////
    assign ID_EX_en = 1;
    assign ID_EX_sync_rst = 0; 
    `include "include/PipelineInterface_ID_EX_Inst.vh"
    /////////////////////////////

    // YOUR CODE FOR STAGE EX HERE

    /////////////////////////////
    ///////   ps3 EX/MEM  ////////
    assign EX_MEM_en = 1;
    assign EX_MEM_sync_rst = 0; 
    `include "include/PipelineInterface_EX_MEM_Inst.vh"
    ////////////////////////////

    // YOUR CODE FOR STAGE MEM HERE   

    //////////////////////////////
    //////   ps4 MEM/WB  /////////
    assign MEM_WB_en = 1;
    assign MEM_WB_sync_rst = 0; 
    `include "include/PipelineInterface_MEM_WB_Inst.vh"
    //////////////////////////////

    // YOUR CODE FOR STAGE WB HERE

endmodule

