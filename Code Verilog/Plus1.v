
module Plus1(in,out);
input wire [31:0] in;
output reg [31:0] out;
always @(*) begin
out <= in +32'd1;
end
endmodule
