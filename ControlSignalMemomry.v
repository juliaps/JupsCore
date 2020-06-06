module ControlSignalMemomry(clk, exec_process_in, select_proc_reg_write_in, select_proc_reg_read_in, exec_process_out, select_proc_reg_write_out, select_proc_reg_read_out);
	input clk,exec_process_in, select_proc_reg_write_in, select_proc_reg_read_in;
	output reg exec_process_out, select_proc_reg_write_out, select_proc_reg_read_out;

	always @(posedge clk) begin
		exec_process_out <= exec_process_in;
		select_proc_reg_write_out <= select_proc_reg_write_in;
		select_proc_reg_read_out <= select_proc_reg_read_in;
	end
endmodule 