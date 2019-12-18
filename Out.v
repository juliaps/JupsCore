module Out(dataOut, halt, display1, display2, display3);
	input [8:0] dataOut;
	input halt;
	wire [8:0] bin;
	wire signal;
	wire [3:0] unit, ten, hundred;
	output [6:0] display1, display2, display3;

	ConversorComp2 c2(.bin2(dataOut), .out(bin), .signal(signal));

	ConversorBCD cBCD(.bin(bin), .bcd1(unit), .bcd2(ten), .bcd3(hundred));

	Display d1(.number(unit), .halt(halt), .display(display1));

	Display d2(.number(ten), .halt(halt), .display(display2));

	Display d3(.number(hundred), .halt(halt), .display(display3));

endmodule 