module setHalt(Clock, DebounceOut, Halt);
	input Clock, DebounceOut;
	output reg Halt;
	
	reg state = 0;
	
	//teste assim, senao funfar, apaga linha 14, deixa original (linha 15) e descomenta os testes 2
	
	always @ ( posedge Clock )
	begin
		if(state == 0)
		begin
			//Halt = 0;	//teste 2
			//Halt = ~ Halt;		//testa isso, add em 29.10.2019
			Halt = DebounceOut;	//original
			if(DebounceOut == 0)
				state = 1;
		end
		else
		begin
			//Halt = 0; // teste 2
			Halt = 1;
			if(DebounceOut == 1)
				state = 0;
		end
	end

endmodule 

/*
module setHalt(Clock, DebounceOut, Halt);
	input Clock, DebounceOut;
	output reg Halt;
	
	reg state = 0;
	
	//teste assim, senao funfar, apaga linha 14, deixa original (linha 15) e descomenta os testes 2
	
	always @ ( posedge Clock )
	begin
		if(state == 0)
		begin
			//Halt = 0;	//teste 2
			Halt = ~ Halt;		//testa isso, add em 29.10.2019
			//Halt = DebounceOut;	//original
			if(DebounceOut == 0)
				state = 1;
		end
		else
		begin
			//Halt = 0; // teste 2
			Halt = 1;
			if(DebounceOut == 1)
				state = 0;
		end
	end

endmodule 
*/