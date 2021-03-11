//Button: Button to check in/out
 
module JupsCore(AutoClock, Button, Switches, Display1, Display2, Display3, dPC1, dPC2, dPC3);
	input  AutoClock, Button;
	input  [15:0] Switches;
	output [6:0] Display1, Display2, Display3, dPC1, dPC2, dPC3;
	wire  [31:0]  data1, Data2, data3, dataALU, programCounter, NewProgramCounter;
	wire clk;
	wire halt, enableSO;
	wire  bounceButton, buttonHalt, resetButton;
	wire alu, branch, change_pc, im, in, j, jal, jr, write, writemem, usestk, type_r, zero, end_proc, exec_process, select_proc_reg_read, select_proc_reg_write , curr_exec_process, curr_select_proc_reg_write, curr_select_proc_reg_read , zera_pc_cnt;
	wire [31:0] addrJump, Instruction;
	wire [15:0] binaryData;
	wire [31:0] datain, dataMem, imediate, data2;
	wire [4:0] aluCode , AddrWrite, pc_cnt, new_pc_counter;
	
	

	FrequenceDivider fd( .AutoClock(AutoClock),
  				  			   .Clock(clk)
	); 
	
	DeBounce_v DB( .clk(AutoClock), 
						.n_reset(1'b1), 
						.button_in(Button),
						.DB_out(bounceButton)
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
							 .change_pc(change_pc),
							 .zera_pc_cnt(zera_pc_cnt),
							 .AddressJump(addrJump),
							 .pc_in(data1),
							 .pc_curr(NewProgramCounter),
							 .Halt(halt),
							 .exec_proc(exec_process),
							 .pc_out(programCounter),
							 .pc_counter(pc_cnt)
	);
	
	ProgramCounterController pcc( .end_proc(end_proc),
											.pc_counter(pc_cnt),
											.pc_curr(programCounter),
											.enable_so(enableSO), 
											.pc_new(NewProgramCounter)
	);
	
	InstructionMemory istM( .AutoClock(AutoClock),
									.Clock(clk),
									.ProgramCounter(NewProgramCounter),
								   .Instruction(Instruction)
	);
	
	ControlSignalMemomry csm(  .clk(clk),
										.exec_process_in(exec_process),
										.select_proc_reg_write_in(select_proc_reg_write),
										.select_proc_reg_read_in(select_proc_reg_read),
										.exec_process_out(curr_exec_process),
										.select_proc_reg_write_out(curr_select_proc_reg_write),
										.select_proc_reg_read_out(curr_select_proc_reg_read)
	);

	
	ControlUnit controlUnit(  .Button(~bounceButton),
									  .curr_exec_process(curr_exec_process),
									  .curr_select_proc_reg_write(curr_select_proc_reg_write),
									  .curr_select_proc_reg_read(curr_select_proc_reg_read),
									  .Opcode(Instruction[31:26]),
									  .alu_code(aluCode),
									  .ALU(alu),
									  .branch(branch),
									  .change_pc(change_pc),
									  .Halt(halt),
									  .Im(im),
									  .In(in),
									  .Jal(jal),
									  .Jr(jr),
									  .Jump(j),
									  .Write(write),
									  .WriteMem(writemem),
									  .useStk(usestk),
									  .type_r(type_r),
									  .exec_process(exec_process),
									  .select_proc_reg_read(select_proc_reg_read),
									  .select_proc_reg_write(select_proc_reg_write),
									  .end_proc(end_proc),
									  .zera_pc_cnt(zera_pc_cnt)
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
								.select_proc_reg_read(select_proc_reg_read),
								.select_proc_reg_write(select_proc_reg_write),
								.change_so(enableSO),
								.end_proc(end_proc),
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
	
	Out pcout( .dataOut(NewProgramCounter[8:0]),
				  .halt(1'b1),
				  .display1(dPC1),
				  .display2(dPC2),
				  .display3(dPC3)
	);
	
		
endmodule