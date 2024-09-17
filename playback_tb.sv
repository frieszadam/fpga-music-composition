// This module thoroughly tests the decoder_audio_playback module. 

`timescale 1 ps / 1 ps
module playback_tb();
	logic clk, write_ready, write_en;
	logic [5:0] note_RAM [39:0];	
	logic [5:0] i_note;
	logic write;
	logic [23:0] write_data;
	integer i;
	
	decoder_audio_playback dut (.*);
	
		
	always begin
		clk = 1; #5; clk = 0; #5;
	end
			
	always begin
		write_ready = 1; #5; write_ready = 0; #15;
	end
	
	initial begin
		for (i = 0; i < 5; i=i+1) begin
			note_RAM[i] = i;
		end
		write_en = 0; i_note = 5; @(posedge clk);
		write_en = 1; @(posedge clk);
		repeat(1000000)
			@(posedge clk);
		$stop;
	end
endmodule