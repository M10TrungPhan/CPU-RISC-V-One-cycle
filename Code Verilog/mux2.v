

module mux2 (in0,in1,sel,out);
parameter WIDTH_DATA_LENGTH =32;
output wire [WIDTH_DATA_LENGTH-1:0] out;
input wire [WIDTH_DATA_LENGTH-1:0] in0;
input wire [WIDTH_DATA_LENGTH-1:0] in1;
input wire sel;

assign out = (sel)? in1:in0;
endmodule 