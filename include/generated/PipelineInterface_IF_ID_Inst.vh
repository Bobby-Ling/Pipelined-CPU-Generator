    `include "../../generated/PipelineInterface_IF_ID.v"
    // used for generating pipeline interface modules
    // generated file, do not edit
    PipelineInterface_IF_ID PipelineInterface_IF_ID_U(
        .clk(clk),
        .async_rst(async_rst),
        .sync_rst(IF_ID_sync_rst),
        .en(IF_ID_en),
        .IR_i(IF_IR_w),
        .IR_o(ID_IR_w),
        .PC_i(IF_PC_w),
        .PC_o(ID_PC_w)
    );
