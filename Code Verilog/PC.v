`timescale 1ps/1ps
module PC (in,Clock,out);
parameter WIDTH_MEMORY_LENGTH = 32;
input  [WIDTH_MEMORY_LENGTH-1:0] in;
input  Clock ;
output reg [WIDTH_MEMORY_LENGTH-1:0] out;
initial begin
	
	out = 32'd0;
end


always @ (posedge Clock) begin
#1000;
	out <= in;
	$display("PC=%h",out);

end
endmodule
