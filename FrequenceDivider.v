module FrequenceDivider(AutoClock, Clock);
	input AutoClock;
	output reg Clock;
	reg [23:0] Count;
	
	always@(posedge AutoClock)
		begin 
			if(Count == 24'b101111101011110000100000)
				begin
					Count <= 24'b000000000000000000000000;
					Clock <= ~Clock;
				end
			else
				begin
					Count <= Count + 24'b000000000000000000000001;
				end
		end
endmodule