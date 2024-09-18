// valid line: r"^(?:wire|reg) +(\[.*\])?\s*((?:(?:IF|ID|EX|MEM|WB)+_\w+_w(?:,|;)\s*)+)"
// signal: r"(IF|ID|EX|MEM|WB)_(\w+)_w"
wire [31:0] IF_IR_w,    ID_IR_w,        EX_IR_w,        MEM_IR_w,       WB_IR_w;
wire [31:0] IF_PC_w,    ID_PC_w,        EX_PC_w,        MEM_PC_w,       WB_PC_w;

wire                    ID_JALR_w,      EX_JALR_w,      MEM_JALR_w,     WB_JALR_w;
wire                    ID_JAL_w,       EX_JAL_w,       MEM_JAL_w,      WB_JAL_w;
wire                    ID_ECALL_w,     EX_ECALL_w,     MEM_ECALL_w,    WB_ECALL_w;
wire                    ID_RegWrite_w,  EX_RegWrite_w,  MEM_RegWrite_w, WB_RegWrite_w;
wire                    ID_MemtoReg_w,  EX_MemtoReg_w,  MEM_MemtoReg_w, WB_MemtoReg_w;
wire [31:0]             ID_R1_w,        EX_R1_w,        MEM_R1_w,       WB_R1_w;
wire [31:0]             ID_R2_w,        EX_R2_w,        MEM_R2_w,       WB_R2_w;
wire [4:0]              ID_WrtNo_w,     EX_WrtNo_w,     MEM_WrtNo_w,    WB_WrtNo_w;
wire                    ID_MemWrite_w,  EX_MemWrite_w,  MEM_MemWrite_w;
wire                    ID_AluRst2_w,   EX_AluRst2_w;
wire                    ID_Branch_w,    EX_Branch_w;
wire [3:0]              ID_AluOp_w,     EX_AluOp_w;
wire                    ID_Alu1U_w,     EX_Alu1U_w;
wire                    ID_Alu2U_w,     EX_Alu2U_w;
wire                    ID_AluSrcB_w,   EX_AluSrcB_w;
wire                    ID_SType_w,     EX_SType_w;
wire                    ID_URET_w,      EX_URET_w;
wire                    ID_rs1Fwd_w,    EX_rs1Fwd_w;
wire                    ID_rs2Fwd_w,    EX_rs2Fwd_w;

wire [31:0]             ID_I_Imm12_w,   EX_I_Imm12_w;
wire [31:0]             ID_S_Imm12_w,   EX_S_Imm12_w;
wire [31:0]             ID_B_Imm12_w,   EX_B_Imm12_w;
wire [31:0]             ID_U_Imm20_w,   EX_U_Imm20_w;
wire [31:0]             ID_UJ_Imm20_w,  EX_UJ_Imm20_w;

wire [31:0]                             EX_AluOut_w,    MEM_AluOut_w,   WB_AluOut_w;
wire [31:0]                             EX_CSRData_w,   MEM_CSRData_w,  WB_CSRData_w;
wire [31:0]                                             MEM_MDout_w,    WB_MDout_w; 

// will not be parsered
wire        IF_ID_en,   ID_EX_en,       EX_MEM_en,      MEM_WB_en;
wire        IF_ID_sync_rst,    ID_EX_sync_rst,        EX_MEM_sync_rst,        MEM_WB_sync_rst;