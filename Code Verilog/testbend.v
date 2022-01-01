`timescale 1ps/1ps
module main_tb(
     );

	reg Clock;

	main main_test(Clock);
	
	initial begin
		Clock <= 1'b0;
		forever #500 Clock <= ~Clock;
		
		
		# 500; 
	end
	


endmodule
