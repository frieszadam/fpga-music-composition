// This module thoroughly tests the io_pulse_gen module for a LEN of 2. 
module io_pulse_gen_tb ();
	logic clk;
	logic [3:0] buttons, button_pulse;
	integer i;

	io_pulse_gen dut (.*);
	
	always begin
		clk = 1; #5; clk = 0; #5;
	end
	
	initial begin
		buttons = 0; @(posedge clk);
		for (i = 0; i < 4; i=i+1) begin
			buttons[i] = 1; @(posedge clk);
			buttons[i] = 0; @(posedge clk);
			buttons[i] = 1; @(posedge clk);
			repeat(8)
				@(posedge clk);
		end
		buttons = 0;
		repeat(4)
			@(posedge clk);

		$stop;
	end
endmodule