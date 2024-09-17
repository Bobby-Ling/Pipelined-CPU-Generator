`timescale 1ns / 1ps

// Brief: CPU Top Module, synchronized
// Main-Author: EAirPeter
// co-Author: Fluorine Dog, cuishaobo, AzureCrab, ghy
// Modified-By: Bobby Ling
module RiscV32CoreDemo(
    input clk, 
    input rst_n, 
    input en
);

    `include "include/PipelineStageWireDefs.vh"

    // YOUR CODE FOR STAGE IF HERE

    ////////////////////////////
    ///////   ps1 IF/ID  ////////
    assign en_vps1 = 1;
    assign clear_vps1 = 1; 
    `include "include/PipelineInterface_IF_ID_Inst.vh"
    ////////////////////////////
    
    // YOUR CODE FOR STAGE ID HERE

    /////////////////////////////
    ///////   ps2 ID/EX  ////////
    assign en_vps2 = 1;
    assign clear_vps2 = 1;
    `include "include/PipelineInterface_ID_EX_Inst.vh"
    /////////////////////////////

    // YOUR CODE FOR STAGE EX HERE

    /////////////////////////////
    ///////   ps3 EX/MEM  ////////
    assign en_vps3 = 1;
    assign clear_vps3 = 1;
    `include "include/PipelineInterface_EX_MEM_Inst.vh"
    ////////////////////////////

    // YOUR CODE FOR STAGE MEM HERE   

    //////////////////////////////
    //////   ps4 MEM/WB  /////////
    assign en_vps4 = 1;
    assign clear_vps4 = 1;
    `include "include/PipelineInterface_MEM_WB_Inst.vh"
    //////////////////////////////

    // YOUR CODE FOR STAGE WB HERE

endmodule

