//DataIn: value to be extended
//DataOut: value extended
module Extender (DataIn, DataOut);
	input 	  [15:0] DataIn;
	output reg [31:0] DataOut;
	
	always @ (*) begin
		if(DataIn[15] == 1) begin
			DataOut <= {16'b1111111111111111, DataIn};
		end
		else begin
			DataOut <= {16'b0000000000000000, DataIn};
		end

	end
endmodule