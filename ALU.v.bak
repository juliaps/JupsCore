module ALU(alu_code, Data1, Data2, OutALU, zero);
	input [4:0] alu_code;
	input [31:0] Data1, Data2;
	output reg [31:0] OutALU;
	output zero;
	
	wire [31:0] notZero;
	assign notZero = ( Data2 == 0 ) ? 1 : Data2;
	
	always @ (*) begin
		case(alu_code)
			5'b00000 : OutALU = Data1 + Data2; //add // addi //load //store
			5'b00001 : OutALU = Data1 - Data2; //sub //beq //bneq //subi
			5'b00010 : OutALU = Data1; //mov
			5'b00011 : OutALU = Data1 * Data2; //mult
			5'b00100 : OutALU = Data1 / notZero; //div 
			5'b00101 : OutALU = Data2; // loadi // in
			5'b00110 : OutALU = Data1 <= Data2 ? 1'b1 : 1'b0; //slt
			5'b00111 : OutALU = Data1 >= Data2 ? 1'b1 : 1'b0; //sgt
			default: 
			begin
				OutALU = 0;
			end
		endcase
	end
	
	assign zero = ( OutALU == 0 );
		
endmodule
