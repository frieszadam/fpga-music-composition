/*
	note_decoder: takes in the current note and the current position of note RAM, as well as status
	signals such reset, place and delete. The modules uses the inputs to generates the corresponding color
	values for the VGA. 
	inputs:
		clk: Clock Signal
		reset: Resets the module and clears the display
		place: Visually places a note at the current position.
		delete: Visually deletes the note at the current position. 
		curr_pos: Current index in the note_rAM 
		curr_note: Current note being placed.
		i_note: Total number of notes that has been placed so far
		x: X-coordinates of the pixel in the VGA
		y: Y-coordiantes of the pixel in the VGA
	outputs:
		color: 24-bit color that represents 8 bits of r,g,b

*/
`define XOFFSET 64
`define YOFFSET 29
module note_decoder (clk, reset, place, delete, curr_pos, i_note, curr_note, x, y, color);
	input logic clk, reset, place, delete;
	input logic [5:0] curr_pos, curr_note, i_note;
	input logic [9:0] x;
	input logic [8:0] y;
	output logic [23:0] color;
	
	// local variables and states
	integer i;
	logic [23:0] rgb_RAM [39:0] [11:0]; // x then y
	logic [7:0] note_r, note_g, note_b, graph_r, graph_g, graph_b;
	logic [5:0] x_count;
	enum {s_draw, s_reset} ps, ns;

	note_color color_gen (curr_note, note_r, note_g, note_b);
	graph labels (.x, .y, .r(graph_r), .g(graph_g), .b(graph_b));
	
	// update present state
	always_ff @(posedge clk)
		ps <= ns;

	// next state logic
	always_comb begin
		case(ps)
			s_reset: ns = x_count==39? s_draw: s_reset;
			s_draw: ns = reset? s_reset: s_draw;
		endcase
	end
	// assign our output color value based on x and y pos of video_driver scanner
	always_comb begin
		if( (x > 65 && x < 639) && ( y > 29 && y < 449)) 
			color = rgb_RAM[(x-`XOFFSET)/22][(y-`YOFFSET)/35];
		else
			color = {graph_r, graph_g, graph_b};
	end
	
	// RTL operations
	always_ff @(posedge clk) begin
		if (delete) begin
			for (i = 0; i < 12; i = i+1)
				rgb_RAM[i_note][i] <= 0; // we delete at i_note because by the time we recieve delete i_note has been updated in user_io
		end
		
		if (place) begin 
			for (i = 0; i < 12; i = i+1) 
				rgb_RAM[curr_pos][i] <= (i==(curr_note%12))? {note_r,note_g,note_b}: 0;
		end
		
		if (reset)
			x_count <= 0;
			
		if (ps == s_reset) begin
			x_count <= x_count+1;
			for (i = 0; i < 12; i = i+1)
				rgb_RAM[x_count][i] <= 0;
		end
	end
endmodule