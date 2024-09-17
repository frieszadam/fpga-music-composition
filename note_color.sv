// This modules is a helper module that changes the color of the VGA based on the note 
// Takes in the note and choses the color based on it.
module note_color (note, r, g, b);
	input logic [5:0] note;
	output logic [7:0] r, g, b;
	
	// Chooses a color based on the notes and the octave 
	always_comb begin 
		case (note)
			// Octave 2
			0: begin r = 66; g = 200; b = 0; end
			1: begin r = 195; g = 199; b = 0;end
			2: begin r = 195; g = 73; b = 0; end
			3: begin r = 144; g = 0; b = 0; end
			4: begin r = 210; g = 0; b = 65; end
			5: begin r = 211; g = 0; b = 202;end
			6: begin r = 89; g = 0; b = 207; end
			7: begin r = 0; g = 0; b = 172; end
			8: begin r = 0; g = 66; b = 210; end
			9: begin r = 0; g = 203; b = 211;end
			10: begin r = 0; g = 206; b = 86;end
			11: begin r = 0; g = 166; b = 0; end
			
			// Octave 3
			12: begin r = 78; g = 211; b = 0; end 
			13: begin r = 207; g = 210; b = 0;end 
			14: begin r = 207; g = 84; b = 0;end 
			15: begin r = 167; g = 0; b = 0; end 
			16: begin r = 221; g = 0; b = 77;end 
			17: begin r = 222; g = 0; b = 214;end 
			18: begin r = 100; g = 0; b = 219;end 
			19: begin r = 0; g = 0; b = 195; end 
			20: begin r = 0; g = 78; b = 221;end 
			21: begin r = 0; g = 215; b = 222;end 
			22: begin r = 0; g = 218; b = 97; end 
			23: begin r = 0; g = 190; b = 0; end
			
			// Octave 4
			24: begin r = 90; g = 222; b = 0; end 
			25: begin r = 219; g = 221; b = 0; end 
			26: begin r = 219; g = 95; b = 0; end 
			27: begin r = 188; g = 0; b = 0; end 
			28: begin r = 233; g = 0; b = 88; end 
			29: begin r = 233; g = 0; b = 226; end 
			30: begin r = 111; g = 0; b = 231; end 
			31: begin r = 0; g = 0; b = 216; end 
			32: begin r = 0; g = 89; b = 233; end 
			33: begin r = 0; g = 227; b = 233; end 
			34: begin r = 0; g = 230; b = 108; end 
			35: begin r = 0; g = 211; b = 0; end
			
			// Octave 5
			36: begin r = 102; g = 233; b = 0; end
			37: begin r = 231; g = 232; b = 0; end
			38: begin r = 231; g = 106; b = 0; end
			39: begin r = 209; g = 0; b = 0; end
			40: begin r = 244; g = 0; b = 110; end
         41: begin r = 244; g = 0; b = 238; end
			42: begin r = 122; g = 0; b = 243; end
		   43: begin r = 0; g = 0; b = 237; end
         44: begin r = 0; g = 111; b = 244; end
         45: begin r = 0; g = 239; b = 244; end
         46: begin r = 0; g = 242; b = 119; end
         47: begin r = 0; g = 232; b = 0; end
         
			// Octave 6
			48: begin r = 114; g = 244; b = 0; end
         49: begin r = 242; g = 244; b = 0; end
			50: begin r = 243; g = 117; b = 0; end
         51: begin r = 232; g = 0; b = 0;  end
         52: begin r = 255; g = 0; b = 122; end
         53: begin r = 255; g = 0; b = 250; end
         54: begin r = 133; g = 0; b = 255; end
         55: begin r = 5; g = 0; b = 255;  end
         56: begin r = 0; g = 123; b = 255; end
         57: begin r = 0; g = 251; b = 255; end
         58: begin r = 0; g = 253; b = 130; end
         59: begin r = 0; g = 253; b = 2; end
			
			// Octave 7
			60: begin r = 126; g = 255; b = 0; end
			61: begin r = 254; g = 255; b = 0; end
			62: begin r = 255; g = 128; b = 0; end
			63: begin r = 255; g = 0; b = 0; end
			
		endcase
	end //always_comb
		
endmodule // note_color  