module ConversorComp2(bin2, out, signal);
	input 	  [8:0] bin2;
	output reg [8:0] out;
	output reg signal;

	always @ (*) begin
		if(bin2[8] == 1'b1) begin
			signal = 1;
			out = ~(bin2[8:0]) + 1'b1;
		end
		else begin
			signal = 0;
			out = bin2[8:0];
		end
	
	end

endmodule 