module ConversorBCD(bin, bcd1, bcd2, bcd3);
	input 	  [8:0] bin;
	output reg [3:0] bcd1, bcd2, bcd3;
	integer idx;

	always @ (*) begin
		bcd1 = 4'd0;
		bcd2 = 4'd0;
		bcd3 = 4'd0;
	
		for(idx = 8; idx >= 0; idx = idx - 1) begin
			if(bcd3 >= 5)
				bcd3 = bcd3 + 4'b0011;
			if(bcd2 >= 5)
				bcd2 = bcd2 + 4'b0011;
			if(bcd1 >= 5)
				bcd1 = bcd1 + 4'b0011;
			
			bcd3 = bcd3 << 1;
			bcd3[0] = bcd2[3];
			bcd2 = bcd2 << 1;
			bcd2[0] = bcd1[3];
			bcd1 = bcd1 << 1 ;
			bcd1[0] = bin[idx];
		end
	end
endmodule 