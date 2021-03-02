// Verifica se o contandor ja atingiu o limite
// Se atingiu o limite avisa que vai  trocar para a execuçao do so
// e seta o pc para a instruçao que o so realiza a troca de contexto
// caso contrario so mantem o pc atual

module ProgramCounterController(end_proc, pc_counter, pc_curr, enable_so , pc_new);
	input end_proc;
	input [4:0]  pc_counter;
	input [31:0] pc_curr;
	output reg enable_so;
	output wire [31:0] pc_new;
	//wire [31:0] pc_so;
	
	always @ (*) begin
		if(pc_counter == 20) begin
			enable_so <= 1'b1;
		end
		else if(end_proc) begin
			enable_so <= 1'b1;
		end
		else begin
			enable_so <= 1'b0;
		end
	end
	
	//assign pc_so = 32'b00000000000000000000000000000011 ;
	assign pc_new = (enable_so) ? 32'b00000000000000000000000000000011  : pc_curr;
	
endmodule 