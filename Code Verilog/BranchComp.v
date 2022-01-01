module BranchComp (A,B,BrUn,BrEq,BrLT);

parameter WIDTH_DATA_LENGTH = 32;

input wire [WIDTH_DATA_LENGTH-1:0] A;
input wire [WIDTH_DATA_LENGTH-1:0] B;
input wire BrUn;

output reg BrEq;
output reg BrLT;

reg [WIDTH_DATA_LENGTH-1:0] C ;
reg [WIDTH_DATA_LENGTH-1:0] D ;

always @ (*) begin

if (BrUn) begin
if ( A[31] < B[31] ) 
begin 
BrEq = 1'd0;
BrLT = 1'd1;
end
else if ( A[31] > B[31] )
begin 
BrEq = 1'd0;
BrLT = 1'd0;
end	
else begin
C = A & 32'h7fffffff;
D = B & 32'h7fffffff;	 
BrEq = (C==D)? 1'd1: 1'd0;
BrLT = (C<D) ? 1'd1 : 1'd0;
end 
end
else begin
BrEq = (A==B)? 1'd1: 1'd0;
BrLT = (A<B) ? 1'd1 : 1'd0;
end
end
endmodule
