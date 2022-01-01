`timescale 1ps/1ps
module ControlUnit(inst,BrEq,BrLT,Clock,PCSel,BSel,ASel,ALUSel,MemRW,WBSel,ImmSel,RegWEn,BrUn);

input [31:0] inst;
input BrEq;
input BrLT;
input Clock;

output reg PCSel;  
output reg [2:0] ImmSel;
output reg RegWEn;
output reg BrUn;
output reg BSel;
output reg ASel;
output reg [3:0] ALUSel;
output reg MemRW;
output reg [1:0 ]WBSel;


always @ (posedge Clock) begin
#300;
case (inst[6:2])
	
	5'b01100: begin  // R-Type
		case(inst[14:12])
			3'b000: begin
				if (inst[30]) begin // SUB
					PCSel <= 0;
					ImmSel <= 3'bxxx;
					RegWEn <= 1'b1;
					BrUn <= 1'bx; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b0001;
					MemRW <= 0;
					WBSel <= 2'b01;
				end
				else begin // ADD
					PCSel <= 0;
					ImmSel <= 3'bxxx;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b01;
				end
			end
			3'b001: begin       // SSL
					PCSel <= 0;
					ImmSel <= 3'bxxx;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b0010;
					MemRW <= 0;
					WBSel <= 2'b01;
			end
			3'b010: begin  //SLT
					PCSel <= 0;
					ImmSel <= 3'bxxx;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b0011;
					MemRW <= 0;
					WBSel <= 2'b01;
			end
			3'b011: begin //SLTU
					PCSel <= 0;
					ImmSel <= 3'bxxx;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b0100;
					MemRW <= 0;
					WBSel <= 2'b01;
			end
			3'b100: begin //XOR
					PCSel <= 0;
					ImmSel <= 3'bxxx;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b0101;
					MemRW <= 0;
					WBSel <= 2'b01;
			end	
			3'b101: begin //SRL
				if (inst[30]) begin
					PCSel <= 0;
					ImmSel <= 3'bxxx;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b0110;
					MemRW <= 0;
					WBSel <= 2'b01;
				end
				else begin //SRA
					
					PCSel <= 0;
					ImmSel <= 3'bxxx;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b0111;
					MemRW <= 0;
					WBSel <= 2'b01;
				end
			end
			3'b110: begin //OR
					PCSel <= 0;
					ImmSel <= 3'bxxx;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b1000;
					MemRW <= 0;
					WBSel <= 2'b01;
			end
			3'b111: begin //AND
					PCSel <= 0;
					ImmSel <= 3'bxxx;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b1001;
					MemRW <= 0;
					WBSel <= 2'b01;

			end
			default: begin       
					PCSel <= 0;
					ImmSel <= 3'bxxx;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b0010;
					MemRW <= 0;
					WBSel <= 2'b01;
			end
		endcase             // Het lenh R-Type
	end
	
	5'b00100: begin // I-type
		case(inst[14:12])
			3'b000: begin // ADDI
				 
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b01;
				
				
			end
			3'b010: begin      // SLTI
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0011;
					MemRW <= 0;
					WBSel <= 2'b01;
			end
			3'b011: begin  //SLTIU
					PCSel <= 0;
					ImmSel <= 3'b001;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0100;
					MemRW <= 0;
					WBSel <= 2'b01;
			end
			3'b100: begin //XORI
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0101;
					MemRW <= 0;
					WBSel <= 2'b01;
			end
			3'b110: begin //ORI
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b1000;
					MemRW <= 0;
					WBSel <= 2'b01;
			end	
			3'b101: begin //SRAI
				if (inst[30]) begin
					PCSel <= 0;
					ImmSel <= 3'b010;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0111;
					MemRW <= 0;
					WBSel <= 2'b01;
				end
				else begin //SRU
					PCSel <= 0;
					ImmSel <= 3'b010;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0110;
					MemRW <= 0;
					WBSel <= 2'b01;
				end
			end
			3'b001: begin //SLLI
					PCSel <= 0;
					ImmSel <= 3'b010;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0010;
					MemRW <= 0;
					WBSel <= 2'b01;
			end
			3'b111: begin //ANDI
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b1001;
					MemRW <= 0;
					WBSel <= 2'b01;
			end
			default: begin 
				 
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b01;
			end
		endcase
	end		

	5'b00000: begin   // I-LOAD-TYPE
		case (inst[14:12]) 
			3'b000: begin  //LB
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b00;
			end
			3'b001: begin  //LH
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b00;
			end
			3'b010: begin  //LW
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b00;
			end
			3'b100: begin  //LBU
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b00;
			end
			3'b101: begin  //LHU
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b00;
			end
			default: begin
					PCSel <= 0;
					ImmSel <= 3'b000;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b00;
			end
		endcase  // Het lenh I-LOAD TYPE
	end

	5'b01000: begin 	// S-Type
		case(inst[14:12]) 
			3'b000: begin    //SB   
					PCSel <= 0;
					ImmSel <= 3'b011;
					RegWEn <= 0;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 1;
					WBSel <= 2'bxx;
			end
			3'b001: begin       //SH
					PCSel <= 0;
					ImmSel <= 3'b011;
					RegWEn <= 0;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 1;
					WBSel <= 2'bxx;
			end
			3'b010: begin       //SW
					PCSel <= 0;
					ImmSel <= 3'b011;
					RegWEn <= 0;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 1;
					WBSel <= 2'bxx;
			end
			default: begin       
					PCSel <= 0;
					ImmSel <= 3'b011;
					RegWEn <= 0;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 1;
					WBSel <= 2'bxx;
			end
		endcase
	end // Ket Thuc S -LOAD

	5'b11000: begin // B-Type
		ImmSel <= 3'b100;
		RegWEn <= 0;
		BSel <= 1;
		ASel <= 1;
		ALUSel <= 4'b0000;
		MemRW <= 0;
		WBSel <= 2'bxx;		
		case (inst[14:12])
			3'b000: begin    // BEQ   neu BrEq=1
				BrUn <= 1'bx;
				#5 
				if (BrEq) PCSel <= 1;

				else PCSel <= 0; // BEQ   neu BrEq=0
			end
			3'b001: begin    // BNE   neu BrEq=1
				BrUn <= 1'bx;
				#5 				
				if (BrEq) PCSel <= 0;

				else PCSel <= 1;  // BNE   neu BrEq=0
			end
			3'b100: begin // BLT
					BrUn <= 1'b0;
					#5
					if (BrLT) PCSel <= 1;
					else PCSel <= 0;

			end
			3'b110: begin    // BGE khong thoa man  neu BrLT=1
				BrUn <= 0;
				#5
				if (BrLT) PCSel <= 0;
				else PCSel <= 1;
			end
			3'b101: begin    // BLTU   neu BrLT=1
				BrUn <= 1;
				#5
				if (BrLT) PCSel <= 1;
				else PCSel <= 0; // BLTU   neu BrLT=0
			end
		endcase
	end

	5'b01101: begin // LUI
					PCSel <= 0;
					ImmSel <= 3'b101;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 1'b0;
					ALUSel <= 4'b1111;
					MemRW <= 0;
					WBSel <= 2'b01;
	end
	
	5'b00101: begin // AUIPC
					PCSel <= 0;
					ImmSel <= 3'b101;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 1;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b01;
	end
	
	5'b11011: begin //JAL
					PCSel <= 1;
					ImmSel <= 3'b110;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 1;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b10;
	end
	
	5'b11001: begin //JALR
					PCSel <= 1;
					ImmSel <= 3'b111;
					RegWEn <= 1;
					BrUn <= 1'bx; 
					BSel <= 1;
					ASel <= 1;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b10;
	end
	default: begin 
					PCSel <= 0;
					ImmSel <= 3'b110;
					RegWEn <= 0;
					BrUn <= 1'b0; 
					BSel <= 0;
					ASel <= 0;
					ALUSel <= 4'b0000;
					MemRW <= 0;
					WBSel <= 2'b00;
	end
endcase
end

endmodule