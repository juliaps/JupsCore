//Clock : receive the automatic clock
//Jump : receive the flag to jump
// AdressJump : receive the adress to jump
// Halt : block the program counter
// PC: sends the adress of instruction memory
 
module ProgramCounter(Clock, j , jr, zero , branch, change_pc, zera_pc_cnt, AddressJump, pc_in, pc_curr, Halt, exec_proc, pc_out, pc_counter);
	input      Clock , j, jr, zero, branch, change_pc, zera_pc_cnt, Halt, exec_proc;
	input  	  [31:0] AddressJump, pc_in, pc_curr;
	output     [31:0] pc_out;
	reg        [31:0] PC;
	output reg [4:0] pc_counter;
	
	always @ (posedge Clock) begin
		if (zero && branch) begin
			PC <= AddressJump;
			if(exec_proc) begin
				pc_counter <= pc_counter + 1'b1;
			end
			if (zera_pc_cnt) begin
				pc_counter <= 0;
			end
		end
		else if (j) begin
			PC <= AddressJump;
			if(exec_proc) begin
				pc_counter <= pc_counter + 1'b1;
			end
			if (zera_pc_cnt) begin
				pc_counter <= 0;
			end
		end
		else if (jr) begin
			PC <= AddressJump;
			if(exec_proc) begin
				pc_counter <= pc_counter + 1'b1;
			end
			if (zera_pc_cnt) begin
				pc_counter <= 0;
			end
		end
		else if (change_pc) begin
			PC <= pc_in;
			pc_counter <= 0;
		end
		else if (!Halt) begin
			PC <= pc_curr +1'b1;
			if(exec_proc) begin
				pc_counter <= pc_counter + 1'b1;
			end
			if (zera_pc_cnt) begin
				pc_counter <= 0;
			end
		end
	end

	assign pc_out = PC;

endmodule

	
	