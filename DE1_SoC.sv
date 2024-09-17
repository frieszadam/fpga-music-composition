module DE1_SoC (KEY, LEDR, SW, CLOCK_50, CLOCK2_50, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS,
					FPGA_I2C_SCLK, FPGA_I2C_SDAT, AUD_XCK, AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK, AUD_ADCDAT, AUD_DACDAT, HEX1, HEX2, HEX3);

	// I2C Audio/Video config interface
	output FPGA_I2C_SCLK;
	inout FPGA_I2C_SDAT;
	// Audio CODEC
	output AUD_XCK;
	input AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK;
	input AUD_ADCDAT;
	output AUD_DACDAT;
	
	output logic [9:0] LEDR;
	input logic [3:0] KEY;
	input logic [9:0] SW;

	input CLOCK_50, CLOCK2_50;
	output [7:0] VGA_R;
	output [7:0] VGA_G;
	output [7:0] VGA_B;
	output VGA_BLANK_N;
	output VGA_CLK;
	output VGA_HS;
	output VGA_SYNC_N;
	output VGA_VS;
	output logic [6:0] HEX1, HEX2, HEX3;

	logic [9:0] x;
	logic [8:0] y;
	logic [7:0] r, g, b;
	
	// Local wires.
	logic read_ready, write_ready, read, write;
	logic [23:0] readdata_left, readdata_right;
	logic [23:0] writedata_left, writedata_right;
	
	logic [5:0] note_RAM [39:0];
	
	logic [23:0] write_data;
	logic [5:0] i_note, curr_pos;
	
	logic delete, reset, confirm, write_en;
	logic [5:0] note_out; 
	
	assign writedata_left = write_data;
	assign writedata_right = write_data;
	
	note_decoder color_gen (.clk(CLOCK_50), .reset, .place(confirm), .delete, .curr_pos, .i_note, .curr_note(note_out), .x, .y, .color({r, g, b}));

	user_io note_interface (.clk(CLOCK_50), .SW0(SW[0]), .SW1(SW[1]), .KEY0(KEY[0]), .KEY1(KEY[1]), .KEY2(KEY[2]), .KEY3(KEY[3]),
									.pos_out(curr_pos), .delete(delete), .i_note(i_note), .confirm(confirm), .note_RAM(note_RAM), .write_en(write_en), .reset,
									.HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .note_out);
	
	decoder_audio_playback audio_interface (.clk(CLOCK_50), .write_ready(write_ready), .note_RAM(note_RAM), .write_en(write_en), 
														 .i_note(i_note), .write(write), .write_data(write_data));
															
	
	
	video_driver #(.WIDTH(640), .HEIGHT(480))
		v1 (.CLOCK_50, .reset(0), .x, .y, .r, .g, .b,
			 .VGA_R, .VGA_G, .VGA_B, .VGA_BLANK_N,
			 .VGA_CLK, .VGA_HS, .VGA_SYNC_N, .VGA_VS);

	/////////////////////////////////////////////////////////////////////////////////
// Audio CODEC interface. 
//
// The interface consists of the following wires:
// read_ready, write_ready - CODEC ready for read/write operation 
// readdata_left, readdata_right - left and right channel data from the CODEC
// read - send data from the CODEC (both channels)
// writedata_left, writedata_right - left and right channel data to the CODEC
// write - send data to the CODEC (both channels)
// AUD_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio CODEC
// I2C_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio/Video Config module
/////////////////////////////////////////////////////////////////////////////////
	clock_generator my_clock_gen(
		// inputs
		CLOCK2_50,
		reset,

		// outputs
		AUD_XCK
	);

	audio_and_video_config cfg(
		// Inputs
		CLOCK_50,
		reset,

		// Bidirectionals
		FPGA_I2C_SDAT,
		FPGA_I2C_SCLK
	);

	audio_codec codec(
		// Inputs
		CLOCK_50,
		reset,

		read,	write,
		writedata_left, writedata_right,

		AUD_ADCDAT,

		// Bidirectionals
		AUD_BCLK,
		AUD_ADCLRCK,
		AUD_DACLRCK,

		// Outputs
		read_ready, write_ready,
		readdata_left, readdata_right,
		AUD_DACDAT
	);
	
endmodule  // DE1_SoC