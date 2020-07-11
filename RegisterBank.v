// Clock: receive automatic clock
// jal: flag to enable writes in register address
// mov: flag to select the instruction mov
// Write: flag to enable write in the register bank
// Addr1: address the first register to be read
// Addr2: address the second register to be read
// Addr3: address the register to be write
// ProgramCounter: current program counter
// Data1: address data the firts address
// Data2: address data the second address
// Data3: data to be write in the register ban

module RegisterBank(Clock, jal, Write, Addr1, Addr2, Addr3, AddrWrite, ProgramCounter, DataIn, Data1, Data2, Data3);
	input Clock, jal, Write; //, select_proc_reg_read, select_proc_reg_write;
	input  [4:0] Addr1, Addr2, Addr3, AddrWrite;
	input  [31:0] ProgramCounter, DataIn;
	output [31:0] Data1, Data2, Data3;
	reg [31:0] regs [63:0]; //rb_so and rb_program
	
	always @(posedge Clock) begin
		if (jal) begin
			regs[30] <= ProgramCounter + 1'b1;
		end
		
		if (Write) begin
			regs[AddrWrite] <= DataIn;
		end
	end
	
	assign Data1 = regs[Addr1];// + (32 * select_proc_reg_read)];
	assign Data2 = regs[Addr2];// + (32 * select_proc_reg_read)];
	assign Data3 = regs[Addr3];// + (32 * select_proc_reg_read)];
	
endmodule