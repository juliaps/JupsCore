//Data: data to insert in memory or stack
//Addr: address use to write in memory 
//WriteMem: flag to enawble or disable write in memory
//Clock
//ClockAuto
//WriteStk : flag to enable or disable write in stack
//StackPointer: Stack Pointer value 

module RandomAccessMemory(DataIn,Addr, Clock, ClockAuto, WriteMem, useStk, DataOut);
	input [31:0] DataIn, Addr;
	input WriteMem, useStk, Clock, ClockAuto;
	output [31:0] DataOut;
	reg [31:0] RAM [299:0]; 
	reg [31:0] Stack [299:0]; 
	reg [31:0] DataMem, DataStack;
	
	always @ (posedge Clock) begin
		if(WriteMem) begin
			if (useStk) begin
				Stack[Addr] <= DataIn; 
			end
			else begin
				RAM[Addr] <= DataIn; 
			end
		end
	end

	always @ (posedge ClockAuto)
	begin
		DataMem   <= RAM[Addr];
		DataStack <= Stack[Addr];
	end
	
	assign DataOut = (useStk) ? DataStack : DataMem;
endmodule 