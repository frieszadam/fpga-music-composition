// This module thoroughly tests the user_io module. 

module user_io_tb ();		
			
	logic SW0, SW1, KEY0, KEY1, KEY2, KEY3, clk;
	logic [5:0] note_RAM [39:0];
	logic confirm, reset, delete, write_en;
	logic [6:0] HEX1, HEX2, HEX3;
	logic [5:0] i_note, pos_out, note_out; // current user defined position in composition, i_note is the upper bound of valid data index. 
	
	integer i;
	logic [5:0] test_vectors [0:86];
	
	// outputs are i_note and note_RAM
	user_io dut (.*);
	
	always begin
		clk = 1'b1; #5; clk = 1'b0; #5;
	end
	
	initial begin
		$readmemb("tests.txt", test_vectors);
		for (i = 0; i < 86; i++) begin
			{SW1, SW0, KEY3, KEY2, KEY1, KEY0} = test_vectors[i]; @(posedge clk);
		end
		$stop;
	end
	
endmodule