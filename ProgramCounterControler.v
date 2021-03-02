// Verifica se o contandor ja atingiu o limite
// Se atingiu o limite avisa que vai  trocar para a execuçao do so
// e seta o pc para a instruçao que o so realiza a troca de contexto
// caso contrario so mantem o pc atual

module ProgramCounterController(pc_cnt, pc_curr, clk, enable_so , pc_new);
	input clk;
	input [31:0] pc_cnt, pc_curr;
	output reg enable_so;
	output reg [31:0] pc_new;
	
	always @ (posedge Clock) begin
		if(pc_cnt == 20) begin
			enable_so <= 1'b1;
		end
		else begin
			enable_so <= 1'b0;
		end
	end
	
	assign pc_new = (enable_so) ? 32'b00000000000000000000000000000011; : pc_curr;
	
endmodule 