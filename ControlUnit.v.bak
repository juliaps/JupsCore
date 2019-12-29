module ControlUnit (Button, Opcode, alu_code, ALU, branch, Halt, Im, In, Jal, Jr, Jump, Write, WriteMem, useStk, type_r);
	input Button;
	input [5:0] Opcode;
	output reg [4:0] alu_code;
	output reg ALU, branch, Halt, Im, In, Jal, Jr, Jump, Write, WriteMem, useStk, type_r;
	
	always @ (*) begin
		case (Opcode)
			6'b000001: //halt
				begin
				ALU = 1'b0; 
				Halt = 1'b1;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b0;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b11111;
				type_r = 1'b0;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b000010 : //add
				begin
				ALU = 1'b1; 
				Halt = 1'b0;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00000;
				type_r = 1'b1;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b000011 : //sub
				begin
				ALU = 1'b1; 
				Halt = 1'b0;
				Im = 1'b0;
			   In = 1'b0;	
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00001;
				type_r = 1'b1;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b010100 : //addi
				begin
				ALU = 1'b1; 
				Halt = 1'b0;
				In = 1'b0;
				Im = 1'b1; 
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00000;
				type_r = 1'b0;
				//type_i = 1'b1;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b010101 : //subi
				begin
				ALU = 1'b1; 
				Halt = 1'b0;
				Im = 1'b1;
			   In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00001;
				type_r = 1'b0;
				//type_i = 1'b1;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b000110: //mov
				begin
				ALU = 1'b1; 
				Halt = 1'b0;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00010;
				type_r = 1'b0;
				//type_i = 1'b1;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b000100: //mult
				begin
				ALU = 1'b1; 
				Halt = 1'b0;
				Im = 1'b0; 
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00011;
				type_r = 1'b1;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b000101: //div
				begin
				ALU = 1'b1; 
				Halt = 1'b0;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00100;
				type_r = 1'b1;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b010001: //bneq
				begin
				ALU = 1'b0; 
				Halt = 1'b0;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b0;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00001;
				type_r = 1'b0;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b010000: //beq 
				begin
				ALU = 1'b0; 
				Halt = 1'b0;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b0;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00001;
				type_r = 1'b0;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b1;
				end
			6'b010010: //slt
				begin
				ALU = 1'b1;
				Halt = 1'b0;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00110;
				type_r = 1'b1;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b010011: //sgt
				begin
				ALU = 1'b1;
				Halt = 1'b0;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
			//	Mem = 1'b0;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00111;
				type_r = 1'b1;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b001011: //in
				begin
				ALU = 1'b1;
				Im = 1'b1;
				In = 1'b1;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				//Halt = 1'b1;
				alu_code = 5'b00101;
				type_r = 1'b0;
				//type_i = 1'b0;
				//type_in = 1'b1;
				branch = 1'b0;
				if (Button) Halt = 1'b0;
				else Halt = 1'b1;
				end
			6'b001100: //out
				begin
				//Write = 1'b1;
				ALU = 1'b0; 
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b0;
				WriteMem = 1'b0;
				useStk = 1'b0;
				Halt = 1'b1;
				alu_code = 5'b11111;
				type_r = 1'b0;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				if (Button) Halt = 1'b0;
				//else begin
					//Halt = 1'b1;
				//end
				end
			6'b000111: //lw
				begin
				ALU = 1'b0; 
				Halt = 1'b0;
				Im = 1'b1;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b1;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00000;
				type_r = 1'b0;
				//type_i = 1'b1; //verificar segybdi a logica
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b001000: //sw
				begin
				ALU = 1'b0; 
				Halt = 1'b0;
				Im = 1'b1;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b0;
				WriteMem = 1'b1;
				useStk = 1'b0;
				alu_code = 5'b00000;
				type_r = 1'b0;
				//type_i = 1'b1;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b001101: //jr
				begin
				ALU = 1'b0; 
				Halt = 1'b0;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b1;
				Jump = 1'b0; //tava 1
				//Mem = 1'b0;
				Write = 1'b0;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b11111;
				type_r = 1'b0;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b001110: //j
				begin 
				ALU = 1'b0; 
				Halt = 1'b0;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b1;
				//Mem = 1'b0;
				Write = 1'b0;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b11111;
				type_r = 1'b0;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b001111: //jal
				begin
				ALU = 1'b0; 
				Halt = 1'b0;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b1;
				Jr = 1'b0;
				Jump = 1'b1;
				//Mem = 1'b0;
				Write = 1'b0;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b11111;
				type_r = 1'b0;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b010110: //loadi
				begin
				ALU = 1'b1; 
				Halt = 1'b0;
				Im = 1'b1;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b00101;
				type_r = 1'b0;
				//type_i = 1'b0;
				//type_in = 1'b1;
				branch = 1'b0;
				end
			6'b001001: //push
				begin
				ALU = 1'b0; 
				Halt = 1'b0;
				Im = 1'b1;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b0;
				WriteMem = 1'b1;
				useStk = 1'b1;
				alu_code = 5'b00000;
				type_r = 1'b0;
				//type_i = 1'b1;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			6'b001010: //pop
				begin
				ALU = 1'b0; 
				Halt = 1'b0;
				Im = 1'b1;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b1;
				Write = 1'b1;
				WriteMem = 1'b0;
				useStk = 1'b1;
				alu_code = 5'b00000;
				type_r = 1'b0;
				//type_i = 1'b1;
				//type_in = 1'b0;
				branch = 1'b0;
				end
			default:
				begin
				ALU = 1'b0; 
				Halt = 1'b0;
				Im = 1'b0;
				In = 1'b0;
				Jal = 1'b0;
				Jr = 1'b0;
				Jump = 1'b0;
				//Mem = 1'b0;
				Write = 1'b0;
				WriteMem = 1'b0;
				useStk = 1'b0;
				alu_code = 5'b11111;
				type_r = 1'b0;
				//type_i = 1'b0;
				//type_in = 1'b0;
				branch = 1'b0;
				end
		endcase
	end
endmodule