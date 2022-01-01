`timescale 1ps/1ps
module ImmGen(in,ImmSel,out);
input wire [24:0] in;
input [2:0] ImmSel;
output reg [31:0] out;

always @(*) 
begin
#320
case (ImmSel)
	3'b000: begin //31->20 ext sign
		if (in[24]==1)begin
			out <= {20'hfffff , in[24:13]};
		end
		else begin
			out <= {20'h00000 , in[24:13]};
		end
	end
	3'b001: begin // 31->20 ext unsign
			out <= {20'h00000 , in[24:13]};
	end
	3'b010: begin // 24-> 20 extsign
		if (in[17]==1)begin
			out <= {27'h7ffffff , in[17:13]};
		end
		else begin
			out <= {27'h0000000 , in[17:13]};
		end
	end
	3'b011: begin // 31->25 +11->7 ext sign
		if (in[24]==1)begin
			out <= {20'hfffff , in[24:18],in[4:0]};
		end
		else begin
			out <= {20'h00000 , in[24:18],in[4:0]};
		end	
	end
	3'b100: begin //31 +7+30->25+ 11->8+ 1'd0 extsign
		if (in[24]==1)begin
			out <= ~((~({19'h7ffff , in[24],in[0],in[23:18],in[4:1],1'b0})+1)/4)+1;
		end
		else begin
			out <= ({19'h00000 , in[24],in[0],in[23:18],in[4:1],1'b0})/4;
		end	
	end
	3'b101: begin // 31->12 + 12'h000
			out <= {in[24:5],12'h000};
	end
	3'b110: begin // 31 + 8'd0 + 20 + 30->21 + 1'd0 + extsign
		if (in[24] ==1) begin
			out <= ~((~({11'h7ff,in[24],in[12:5],in[13],in[23:14],1'b0})+1)/4)+1 ;
		end
		else begin
			out <= ({11'h0,in[24],in[12:5],in[13],in[23:14],1'b0})/4;
		end
	end
	3'b111: begin //JALR
		if (in[24]==1)begin
			out <= ~((~({20'hfffff , in[24:13]}) +1)/4)+1;
		end
		else begin
			out <= ({20'h0, in[24:13]})/4;
		end
	end

	default: begin
			out <= 32'd0;
	end
endcase
end



endmodule
