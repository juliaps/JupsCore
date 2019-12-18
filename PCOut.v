module PCOut(ProgramCounter, dpc1, dpc2);
	input [8:0] ProgramCounter;
	wire [8:0] bin2;
	wire [8:0] bin;
	wire signal;
	wire [3:0] unit, ten, hundred;
	output [6:0] dpc1, dpc2;

	assign bin2 = ProgramCounter;
	//assign signal = 1'b1;

	ConversorComp2 c2(.bin2(bin2), .out(bin), .signal(signal));

	ConversorBCD cBCD(.bin(bin), .bcd1(unit), .bcd2(ten), .bcd3(hundred));

	Display d1(.number(unit), .halt(1), .display(dpc1));

	Display d2(.number(ten), .halt(1), .display(dpc2));

endmodule 