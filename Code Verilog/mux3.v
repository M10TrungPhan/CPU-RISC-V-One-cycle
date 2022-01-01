
module mux3 (in0 , in1 , in2 , sel , out);
parameter WIDTH_DATA_LENGTH =32;
input wire [WIDTH_DATA_LENGTH-1:0] in0;
input wire [WIDTH_DATA_LENGTH-1:0] in1;
input wire [WIDTH_DATA_LENGTH-1:0] in2;
input wire [1:0] sel;
output reg [WIDTH_DATA_LENGTH-1:0] out;



always @ (*)
begin
case (sel)
	2'b00: out = in0;
	2'b01: out = in1;
	2'b10: out = in2;	
	default: out = 2'dx;
endcase
end


endmodule 
