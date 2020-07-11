//Clock : receive the automatic clock
//Jump : receive the flag to jump
// AdressJump : receive the adress to jump
// Halt : block the program counter
// PC: sends the adress of instruction memory
 
module ProgramCounter(Clock, j , jr, zero , branch, AddressJump, Halt, pc_out);
	input      Clock , j, jr, zero, branch, Halt;
	input  	  [31:0] AddressJump; //, pc_in;
	output     [31:0] pc_out;
	reg        [31:0] PC;
	
	always @ (posedge Clock) begin
		if (zero && branch) begin
			PC <= AddressJump;
		end
		else if (j) begin
			PC <= AddressJump;
		end
		else if (jr) begin
			PC <= AddressJump;
		end
		//else if (change_pc) begin
		//	PC <= pc_in;
		//end
		else if (!Halt) begin
			PC <= PC +1'b1;
		end
	end

	assign pc_out = PC;

endmodule

	
	