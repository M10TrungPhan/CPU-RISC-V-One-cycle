

module main(Clock);
input Clock;
wire PCSel;
wire [31:0] Plus4_Out;
wire [31:0] PC_In;
wire [31:0] PC_Out;
wire [31:0] Instruction;

wire [4:0] ReadRegister1,ReadRegister2,WriteRegAddress_WB;
wire [31:0] ReadData1,ReadData2;
wire BrEq, BrLT, BrUn;
wire BSel;
wire [24:0] ImmIn;
wire [2:0] ImmSel;

wire [31:0] ImmGen_Out;
wire [31:0] muxBranch_Out;
wire ASel;
wire [31:0] muxALU_Out;
wire [3:0] ALU_Sel;
wire [31:0] ALU_Out;
wire RegWEn;
wire MemRW;
wire [31:0] DMEM_Out;
wire [1:0] WBSel;
wire [31:0] muxDMEM_Out;


wire [31:0] WriteDataToReg;




PC PC(PC_In,Clock, PC_Out);
IMEM InstructionFetch(PC_Out, Instruction);
Plus1 Plus1(PC_Out, Plus4_Out);
mux2  muxPC(Plus4_Out,ALU_Out,PCSel,PC_In);
RegisterFile Reg (ReadRegister1, ReadRegister2, WriteRegAddress_WB, WriteDataToReg,Clock,RegWEn,ReadData1,ReadData2);
BranchComp BranchComp(ReadData1,ReadData2, BrUn ,BrEq,BrLT);
mux2 muxBranch(ReadData2, ImmGen_Out, BSel,muxBranch_Out);
mux2 muxALU (ReadData1,PC_Out, ASel,muxALU_Out);
ALU ALU( muxALU_Out, muxBranch_Out, ALU_Sel ,ALU_Out);
DMEM DMEM(ALU_Out, ReadData2, Clock, MemRW, DMEM_Out);
mux3 muxDMEM(DMEM_Out, ALU_Out, Plus4_Out, WBSel, muxDMEM_Out); 
ControlUnit ControlUnit( Instruction , BrEq, BrLT, Clock, PCSel, BSel, ASel, ALU_Sel, MemRW, WBSel, ImmSel, RegWEn, BrUn);

ImmGen ImmGen (ImmIn,ImmSel, ImmGen_Out);

//assign muxDMEM_Out = WriteDataToReg;
assign ReadRegister1 = Instruction[19:15];	// rs
assign ReadRegister2 = Instruction[24:20];	// rt
assign WriteRegAddress_WB = Instruction[11:7];
assign WriteDataToReg =muxDMEM_Out  ;
assign ImmIn= Instruction[31:7]; 
endmodule
