/*
	decoder_audio_playback: takes in a decoded version of composition and outputs amplitudes to be played to the codec.
	inputs:
		clk: clock.
		write_ready: is the audio codec ready to be written to. 
		write_en: shall I play music now?
		note_RAM: array storing 20s of audio information. each entry is 0-63 with 0 being C2 and 63 being D#7
		i_note: number of notes placed so far in composition. can also be used as upper end of indeces to check
	outputs:
		write: write to the audio codec!
		write_data: this is the data to write to the audio codec.
*/
`define MAX 39
`define LOOPNUM 461
`define ROM_NOTE_LEN 375
module decoder_audio_playback (clk, write_ready, write_en, note_RAM, i_note, write, write_data);
	input logic clk, write_ready, write_en;
	input logic [5:0] note_RAM [39:0];	
	input logic [5:0] i_note;
	output logic write;
	output logic [23:0] write_data;
		
	// local vars
	// index tracks index of note_RAM, note_address tracks address of ROM w/ audio data in it.
	// counter tracks the number of times a section of audio data has been played in a row. 
	logic [23:0] note_0, note_1;
	logic [8:0] counter;
	logic [5:0] index;
	logic [14:0] note_address;
	logic index_eq_inote, note_address_eq_max, counter_eq_LOOPNUM;
	logic incr_counter, incr_note_address, incr_index, clear_index, set_note_address, clear_counter;
	enum {s_idle, s_index, s_counter, s_note_address} ps, ns;
	
	all_notes_2 note_data (.address(note_address), .clock(clk), .q(write_data));

	// update ps 
	always_ff @(posedge clk) 
		ps <= write_en? ns: s_idle;
		
	// determine ns
	always_comb begin
		case(ps)
			s_idle: ns = write_en? s_index: s_idle;
			s_index: ns = index_eq_inote? s_index: s_counter;
			s_counter: ns = counter_eq_LOOPNUM? s_index: s_note_address;
			s_note_address: ns = note_address_eq_max? s_counter: s_note_address;
		endcase
	end
	
	// status signals
	assign index_eq_inote = index==i_note;
	assign note_address_eq_max = note_address==(`ROM_NOTE_LEN)*(note_RAM[index]+1);
	assign counter_eq_LOOPNUM = counter==`LOOPNUM;
	
	// control signals
	assign clear_index = (ps==s_index & index_eq_inote) | (ps==s_idle & write_en);
	assign clear_counter = ps==s_index & ~index_eq_inote;
	assign set_note_address = ps==s_counter & ~counter_eq_LOOPNUM;
	assign incr_index = ps==s_counter & counter_eq_LOOPNUM;
	assign incr_counter = ps==s_note_address & note_address_eq_max;
	assign incr_note_address = ps==s_note_address & ~note_address_eq_max;
	assign write = write_ready & ps!=s_idle;

	// RTL ops
	always_ff @(posedge clk) begin
		if (clear_index)
			index <= 0;
		if (clear_counter) 
			counter <= 0;
		if (set_note_address)
			note_address <= `ROM_NOTE_LEN*note_RAM[index];
		if (incr_index)
			index <= index + 1;
		if (incr_counter)
			counter <= counter + 1;
		if (incr_note_address)
			note_address <= note_address + write;
	end
endmodule // decoder_audio_playback