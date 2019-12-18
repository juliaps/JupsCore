module ConversorBinP2(switches, bin2);
	input  [9:0] switches;
	output reg [8:0] bin2;
	
	always @ (*) begin
		if(switches[9] == 1'b1) begin
			bin2 = ~(switches[8:0]) + 9'b000000001;
		end
		else begin
			bin2 = switches[8:0];
		end
	
	end
endmodule