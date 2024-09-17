// This module thoroughly tests the note_decoder module. 

module note_decoder_tb ();
		
	logic clk, reset, place, delete;
	logic [5:0] curr_pos, curr_note, i_note;
	logic [9:0] x;
	logic [8:0] y;
	logic [23:0] color;
	
	note_decoder dut (.*);

	always begin
		clk = 1; #5; clk = 0; #5;
	end
	
	always_ff@(posedge clk) begin
		if (reset) begin
			x <= 0; y <= 0;
		end
		else if (x == 639) begin
			x <= 0;
			y <= y==479? 0: y+1;
		end
		else 
			x<=x+1;
	end
	
	initial begin
		curr_note = 0; curr_pos = 0; i_note = 0; place = 0; delete = 0; reset = 0; @(posedge clk);
		reset = 1; @(posedge clk);
		reset = 0; @(posedge clk);
		
		repeat(50)
			@(posedge clk);
			
		place = 1; @(posedge clk);
		curr_pos = 1; i_note = 1; place = 0; curr_note = 1; @(posedge clk);
		
		place = 1; @(posedge clk);
		curr_pos = 2; i_note = 2; place = 0; curr_note = 2; @(posedge clk);
		
		place = 1; @(posedge clk);
		curr_pos = 3; i_note = 3; place = 0; curr_note = 3; @(posedge clk);
		
		place = 1; @(posedge clk);
		curr_pos = 4; i_note = 4; place = 0;@(posedge clk);
		
		repeat(50)
			@(posedge clk); 
			
		delete = 1; @(posedge clk);
		curr_pos = 0; i_note = 0; delete = 0; @(posedge clk);

		repeat(500000)
			@(posedge clk);
//		
//		delete = 1; @(posedge clk);
//		curr_pos = 0; i_note = 0; delete = 0; @(posedge clk);
//		repeat(500000)
//			@(posedge clk);
			
		$stop;
	end

endmodule