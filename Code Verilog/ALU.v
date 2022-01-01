
module ALU(A,B,ALU_Sel,ALU_Out);
parameter WIDTH_DATA_LENGTH = 32;
parameter WIDTH_SEL_LENGTH = 4; // log 2 cua 10 = 4

input [WIDTH_DATA_LENGTH-1:0] A;
input [WIDTH_DATA_LENGTH-1:0] B;
input [WIDTH_SEL_LENGTH-1 :0] ALU_Sel;

output [WIDTH_DATA_LENGTH -1 :0] ALU_Out;
reg CarryOut;
    
reg [WIDTH_DATA_LENGTH-1:0] ALU_Result;
reg [WIDTH_DATA_LENGTH-1:0] C;
reg [WIDTH_DATA_LENGTH-1:0] D;


assign ALU_Out = ALU_Result; // ALU out

always @(*)
    begin
        case(ALU_Sel)
        4'b0000: // Addition
           ALU_Result = A + B ; 
        4'b0001: // Subtraction
           ALU_Result = A - B ;
        4'b0010: //  Shift left (sll)
           ALU_Result = A<< (B);
        4'b0011: // (slt)
            ALU_Result = (A<B) ? 32'd1 : 32'd0 ;
        4'b0100: //  (sltu)
	   if ( A[31] < B[31] ) 
	   begin ALU_Result = 32'd1;
	   end
	   else if ( A[31] > B[31] )
	   begin ALU_Result = 32'd0;
	   end
	   else begin
	   C = A & 32'h7fffffff;
	   D = B & 32'h7fffffff;	 
           ALU_Result = (C<D) ? 32'd1 :32'd0;
	   end 
         4'b0101: // xor
           ALU_Result = A^B;
         4'b0110: // srl
           ALU_Result = A >> (B);
         4'b0111: // sra
	   ALU_Result = A >>> (B);
          4'b1000: //  Logical or 
           ALU_Result = A | B;
          4'b1001: //  Logical and
           ALU_Result = A & B;
   	default: ALU_Result = A + B ; 
        endcase
    end

endmodule



