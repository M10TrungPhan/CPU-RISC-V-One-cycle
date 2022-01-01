`timescale 1ps/1ps
module DMEM(Addr, DataW, Clk, MemRW, DataR); 
	
	

parameter 	DATA_MEM_WIDTH_LENGTH = 8;
parameter	ADDR_MEM_WIDTH_LENGTH = 32;

parameter       MAX_MEM_DEPTH_BIT = 18;
parameter	MEM_DEPTH = 1<<MAX_MEM_DEPTH_BIT;


input [ADDR_MEM_WIDTH_LENGTH-1:0] Addr; 	// Input Address 
input [31:0] DataW; // Data that needs to be written into the address 
	
input Clk;
input MemRW; 		// Control signal for memory write read
		

output reg[31:0] DataR; // Contents of memory location at Address

reg [7:0] DataMEM [0:MEM_DEPTH-1];

integer i;  

initial begin  
for(i=0;i<= MEM_DEPTH;i=i+1)  
    DataMEM [i] <= 8'd0;  
end      


always @(posedge Clk) begin  
#500;   
	if (MemRW) begin 
   
  {DataMEM[Addr],DataMEM[Addr+1],DataMEM[Addr+2],DataMEM[Addr+3]} <= DataW;       
   end
   else begin
  DataR <= {DataMEM[Addr],DataMEM[Addr+1],DataMEM[Addr+2],DataMEM[Addr+3]};
   end
   end
 endmodule   
