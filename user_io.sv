/*
	user_io: takes in user input to create a RAM storing the user's composition. outputs control signals
				info about the user composition. displays information for the user on the hexes. 
	inputs:
		clk: clock
		SW0: if 0, the user is in drafting mode. if 1, the user is in edit mode.
		SW1: if 1 music is played, if 0 music is not played. while music playing no input is taken
		KEY0: in draft mode, increase draft note octave. in edit mode, reset.
		KEY1: in draft mode, increase note letter. in edit mode, move forward in composition.
		KEY2: in draft mode, confirm note selection. in edit mode, delete currently selected note.
		KEY3: in draft mode, decrease note letter. in edit mode, move back in composition.
	outputs:
		curr_pos: index of currently selected note. each index corresponds to a 0.5s chunk of time. 
		note_RAM: array storing 20s of audio information. each entry is 0-63 with 0 being C2 and 63 being D#7
		confirm: note was placed at curr_pos.
		delete: note at curr_pos was deleted.
		reset: composition was reset.
		i_note: number of notes placed so far in composition. can also be used as upper end of indeces to check.
		write_en: play music out loud!
		HEX1, HEX2, HEX3: hexes to display note info on.

*/
`define MAXINDEX 39
module user_io (clk, SW0, SW1, KEY0, KEY1, KEY2, KEY3, note_out,
					pos_out, note_RAM, confirm, delete, reset, i_note, write_en,
					HEX1, HEX2, HEX3);
	input logic SW0, SW1, KEY0, KEY1, KEY2, KEY3, clk;
	output logic [5:0] note_RAM [39:0];
	output logic confirm, reset, delete, write_en;
	output logic [6:0] HEX1, HEX2, HEX3;
	output logic [5:0] i_note, pos_out, note_out; // current user defined position in composition, i_note is the upper bound of valid data index. 
	
	// define local vars and states
	// separate state used for s_delete because it is done sequentially
	// and for s_play so the user cannot change the piece while it's playing
	enum {s_draft, s_edit, s_play} ps, ns;
	logic note_up, note_down, octave_up, move_forward, move_back, confirm_int;
	logic play, sel_edit, set_note;
	logic KEY0_f, KEY1_f, KEY2_f, KEY3_f;
	
	io_pulse_gen filter (clk, {KEY0, KEY1, KEY2, KEY3}, {KEY0_f, KEY1_f, KEY2_f, KEY3_f});

	logic [3:0] curr_note; // note letter 0-11 C = 0, ..., B = 11
	logic [2:0] curr_octave; // octave 2-7
	logic [5:0] draft_tone, curr_pos; // numerical rep of drafted tone and note being deleted
	
	// map signals to user input 
	assign octave_up = ps==s_draft & KEY0_f;
	assign note_up = ps==s_draft & KEY1_f;
	assign note_down = ps==s_draft & KEY3_f;
	
	assign reset = ps==s_edit & KEY0_f;
	assign delete = ps==s_edit & KEY2_f;
	assign move_forward = (ps==s_edit & KEY1_f);
	assign move_back = ps==s_edit & KEY3_f;
		
	assign write_en = SW1;
	assign sel_edit = SW0;
	assign draft_tone = 12*(curr_octave-2) + curr_note;
	assign confirm_int = ps==s_draft & KEY2_f;
	assign set_note = (ps!= s_draft) & (ns==s_draft);
	
	// next state logic
	always_comb begin
		casex({sel_edit, write_en})
			2'b10: ns = s_edit;
			2'bx1: ns = s_play;
			2'b00: ns = s_draft;
		endcase
	end
		
	// update present state
	always_ff @(posedge clk)
		ps <= ns;
	
	// RTL operations
	always_ff @(posedge clk) begin
		// s_draft ops
		if (note_up & ~note_down)
			curr_note <= curr_note==11? 0: curr_note+1'b1;
			
		if (~note_up & note_down)
			curr_note <= curr_note==0? 12: curr_note-1'b1;
			
		if (octave_up)
			curr_octave <= (curr_octave ==7)? 2: curr_octave + 1;
		
		if (confirm_int) begin
			note_RAM[curr_pos] <= draft_tone;
			i_note <= curr_pos==i_note? i_note+1: i_note;
			curr_pos <= (curr_pos+1==`MAXINDEX)? curr_pos: curr_pos + 1;
			note_out <= draft_tone;
			confirm <= 1;
			pos_out <= curr_pos;
		end
		else 
			confirm <= 0;
		// s_edit ops
		if (reset) begin
			i_note <= 0;
			curr_pos <= 0;
			curr_note <= 0;
			curr_octave <= 2;
		end
		
		else if (ps==s_edit) begin
			curr_note <= note_RAM[curr_pos]%12; 
			curr_octave <= note_RAM[curr_pos]/12 + 2;
		end
		
		if (set_note) begin
			curr_note <= 0;
			curr_octave <= 2;
		end
		
		if (move_forward) begin
			if ((curr_pos == i_note) | (curr_pos+1==`MAXINDEX)) // user cannot move above i_note or onto maxindex
				curr_pos <= 0;
			else
				curr_pos <= curr_pos+1;
		end
		
		if (move_back) begin
			if (curr_pos == 0)
				curr_pos <= (i_note==`MAXINDEX)? i_note-1: i_note;
			else
				curr_pos <= curr_pos - 1;
		end
		
		if (delete) begin
			i_note <= i_note-1;
			curr_pos <= i_note-1;
		end
	end
	
	// HEX displays
	
	logic [3:0] hex_note, hex_sign;
	logic [6:0] leds_note, leds_sign, leds_oct;
	
	always_comb begin
		case(curr_note)
			0: begin hex_note = 4'hC; hex_sign = 8; end
			1: begin hex_note = 4'hC; hex_sign = 0; end
			2: begin hex_note = 4'hD; hex_sign = 8; end
			3: begin hex_note = 4'hD; hex_sign = 0; end
			4: begin hex_note = 4'hE; hex_sign = 8; end
			5: begin hex_note = 4'hF; hex_sign = 8; end
			6: begin hex_note = 4'hF; hex_sign = 0; end
			7: begin hex_note = 4'h1; hex_sign = 8; end
			8: begin hex_note = 4'h1; hex_sign = 0; end
			9: begin hex_note = 4'hA; hex_sign = 8; end
			10: begin hex_note = 4'hA; hex_sign = 0; end
			11: begin hex_note = 4'hB; hex_sign = 8; end
			default: begin hex_note = 4'b1111; hex_sign = 4'b1111; end
		endcase
	end // always_comb
	
	logic hex_en;
	seg7 note (hex_note, hex_en, leds_note);
	seg7 sign (hex_sign, hex_en, leds_sign);
	seg7 octave (curr_octave, hex_en, leds_oct);
	
	assign hex_en = ~(curr_pos==i_note & ps==s_edit);
	assign HEX3 = leds_note;
	assign HEX2 = leds_sign;
	assign HEX1 = leds_oct;
	
endmodule // user_io