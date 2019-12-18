//Button: Button to check in/out
 
module JupsCore(AutoClock, Button, Switches, Display1, Display2, Display3, dPC1, dPC2);
	input  AutoClock, Button;
	input  [15:0] Switches;
	output [6:0] Display1, Display2, Display3, dPC1, dPC2;
	wire  [31:0]  data1, Data2, data3, dataALU, programCounter;
	wire clk;
	wire halt;
	wire  bounceButton, buttonHalt;
	wire alu, branch, im, in, j, jal, jr, write, writemem, usestk, type_r, zero;
	wire [31:0] addrJump, Instruction;
	wire [15:0] binaryData;
	wire [31:0] datain, dataMem, imediate, data2;
	wire [4:0] aluCode , AddrWrite;
	
	

	FrequenceDivider fd( .AutoClock(AutoClock),
  				  			   .Clock(clk)
	); 
	
	DeBounce_v DB( .clk(AutoClock), 
						.n_reset(1'b1), 
						.button_in(Button),
						.DB_out(bounceButton)
	);
	
	setHalt sh ( .Clock(clk),
					 .DebounceOut(bounceButton),
					 .Halt(buttonHalt)
	);
	
	Mux_32 MuxAddrJump( .input_1(data1),
							  .input_2(imediate),
							  .flag(jr),
							  .mux_output(addrJump)
	);
	
	ProgramCounter pc( .Clock(clk),
							 .j(j),
							 .jr(jr),
							 .zero(zero),
							 .branch(branch),
							 .AddressJump(addrJump),
							 .Halt(halt),
							 .pc_out(programCounter)
	);
	
	InstructionMemory istM( .AutoClock(AutoClock),
									.Clock(clk),
									.ProgramCounter(programCounter),
								   .Instruction(Instruction)
	);
	
	ControlUnit controlUnit(  .Button(~bounceButton),
									  .Opcode(Instruction[31:26]),
									  .alu_code(aluCode),
									  .ALU(alu),
									  .branch(branch),
									  .Halt(halt),
									  .Im(im),
									  .In(in),
									  .Jal(jal),
									  .Jr(jr),
									  .Jump(j),
									 // .Mem(mem), 
									  .Write(write),
									  .WriteMem(writemem),
									  .useStk(usestk),
									  .type_r(type_r)
									  //.type_i(type_i),
									  //.type_in(type_in)
	);
	
	RandomAccessMemory RAM( .DataIn(data2),
									.Addr(dataALU),
									.Clock(clk), 
									.ClockAuto(AutoClock),
									.WriteMem(writemem),
									.useStk(usestk),
									.DataOut(dataMem)
	);
	
	Mux_16 MuxExtender( .input_1(Switches),
							  .input_2(Instruction[15:0]),
							  .flag(in),
							  .mux_output(binaryData)
	);
	
	Extender ext( .DataIn(binaryData), 
					  .DataOut(imediate)
	);
	
	Mux_32 MuxDataInRB( .input_1(dataALU),
							  .input_2(dataMem),
							  .flag(alu),
							  .mux_output(datain)
	);
	
	Mux_5 MuxRegDest( .input_1(Instruction[15:11]),
							.input_2(Instruction[20:16]),
							.flag(type_r),
							.mux_output(AddrWrite)
	);
	
	RegisterBank rbank(  .Clock(clk), 
								.jal(jal),
								.Write(write),
							   .Addr1(Instruction[25:21]),
								.Addr2(Instruction[20:16]),
								.Addr3(Instruction[15:11]),
								.AddrWrite(AddrWrite),
								.ProgramCounter(programCounter),
								.DataIn(datain),
								.Data1(data1),
								.Data2(data2),
								.Data3(data3)
	);
	
	Out out( .dataOut(data1[8:0]),
				.halt(halt),
				.display1(Display1),
				.display2(Display2),
				.display3(Display3)
	);
	
	
	Mux_32 MuxALU( .input_1(imediate),
						.input_2(data2),
						.flag(im),
						.mux_output(Data2)
	);
	
	ALU arilu( .alu_code(aluCode),
				  .Data1(data1),
				  .Data2(Data2),
				  .OutALU(dataALU),
				  .zero(zero)
	);
	
	PCOut pco( .ProgramCounter(programCounter[8:0]),
				  .dpc1(dPC1),
				  .dpc2(dPC2)
	);
	
		
endmodule