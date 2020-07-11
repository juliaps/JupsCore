module InstructionMemory(AutoClock, Clock, ProgramCounter, Instruction);
	input 	  AutoClock, Clock;
	input 	  [31:0] ProgramCounter;
	output reg [31:0] Instruction;
	reg 		  [31:0] InstMem [799:0];

	always @ (posedge Clock) begin
	
		//InstMem[0] <= 32'b00101100000011100000000000000000; //in r4
		//InstMem[1] <= 32'b01010001110011110000000000000101; //addi r5 r4 5
		//InstMem[2] <= 32'b00110001111000000000000000000000; //out r5
		
		InstMem[0] = 32'b00011011111000000000000000000000; //mov r0 r31
		InstMem[1] = 32'b00010100000000000000000000000000; //j main
		//main 
		InstMem[2] = 32'b01011000000000000000000011100000; //loadi r28 7
		InstMem[3] = 32'b00001011111111110000000000000001; //addi r31 r31 1
		InstMem[4] = 32'b00100111111000000000000000000000; //push r28 r31 0
		//disablewriteproc 
		InstMem[5] = 32'b00101011111110000000000000000000; //pop r14 r31 0
		//enablewriteproc 
		InstMem[6] = 32'b01010011111111110000000000000001; //subi r31 r31 1
		//disablewriteproc 
		//syscall 3
		InstMem[7] = 32'b01011000000000000000000000000000; //loadi r15 proximo_pc
		//setsopc r15
		InstMem[8] = 32'b00101011111111100000000000000000; //pop r30 r31 0
		InstMem[9] = 32'b01001111110000000000000000000000; //jr r30
		//syscall 1
		//setsopc r15
		// 


	end
	
	always @ (posedge AutoClock) begin
		Instruction <= InstMem[ProgramCounter];
	end
endmodule