module InstructionMemory(AutoClock, Clock, ProgramCounter, Instruction);
	input 	  AutoClock, Clock;
	input 	  [31:0] ProgramCounter;
	output reg [31:0] Instruction;
	reg 		  [31:0] MemInst [99:0];

	always @ (posedge Clock) begin
	
		MemInst[0] <= 32'b00101100000011100000000000000000; //in r4
		MemInst[1] <= 32'b01010001110011110000000000000101; //addi r5 r4 5
		MemInst[2] <= 32'b00110001111000000000000000000000; //out r5
	
		//MemInst[0] <= 32'b01011000000010110000000000001111; //loadi r1 15
		//MemInst[1] <= 32'b00011100000011000000000000000000; //lw r2 1
		//MemInst[2] <= 32'b00100001100011010000000000000101; //sw r3 r2 5
		//MemInst[3] <= 32'b00011101100011100000000000000101; //lw r4 r2 5
		//MemInst[4] <= 32'b01010001110011110000000000000101; //addi r5 r4 5
		//MemInst[5] <= 32'b01010101110100000000000000000011; //subi r6 r4 3
		//MemInst[6] <= 32'b00110100000000000000000000000000; //jr r0

	end
	
	always @ (posedge AutoClock) begin
		Instruction <= MemInst[ProgramCounter];
	end
endmodule