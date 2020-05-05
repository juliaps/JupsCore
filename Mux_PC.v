module Mux_PC(input_1, input_2, set, flag, mux_output);
	input [31:0] input_1, input_2;
	input flag, set;
	output reg [31:0] mux_output;
	
	always @ (*) begin
		if (set) begin 
			if (flag) begin
				mux_output <= input_1;
			end
			else begin
				mux_output <= input_2;
			end
		end
		else begin
			mux_output <= 32'b00000000000000000000000000000000;
		end
	end 
endmodule	