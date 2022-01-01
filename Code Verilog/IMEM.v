/*
 ***@Author: NGUYEN TRUNG HIEU
 ***@Date:   Sep 12rd, 2020
*/

/******** Instruction Memmory Block ********/
module IMEM(addr, data);

parameter	INST_WIDTH_LENGTH = 32;
parameter	PC_WIDTH_LENGTH = 32;

parameter	ADDR_MEM_WIDTH_LENGTH = 32;
parameter	DATA_MEM_WIDTH_LENGTH = 32;

parameter       MAX_MEM_DEPTH_BIT = 18;
parameter	MEM_DEPTH = 1<<MAX_MEM_DEPTH_BIT;
input		[PC_WIDTH_LENGTH-1:0]addr;
output	wire	[INST_WIDTH_LENGTH-1:0]data;

/********* Instruction Memmory *************/
reg		[DATA_MEM_WIDTH_LENGTH-1:0]IMEM[0:MEM_DEPTH-1];

initial begin
$readmemh("F:\\text.txt",IMEM);
end

assign	data = IMEM[addr];

endmodule
