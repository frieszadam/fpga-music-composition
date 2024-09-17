/*
	seg7: modified 7 segment driver set up for the DE1-SoC board. 
	everything is normal except 0 corresponds to s, 1 corresponds to a g, and 8 corresponds to off.
*/
module seg7 (hex, en, leds);
	input  logic [3:0] hex;
	input logic en;
	output logic [6:0] leds;

	always_comb begin
		if (~en)
			leds = 7'b1111111;
		else begin
			case (hex)
				//       Light: 6543210
				//			Normal config
				4'h2: leds = 7'b0100100;
				4'h3: leds = 7'b0110000;
				4'h4: leds = 7'b0011001;
				4'h5: leds = 7'b0010010;
				4'h6: leds = 7'b0000010;
				4'h7: leds = 7'b1111000;
				4'hA: leds = 7'b0001000;
				4'hB: leds = 7'b0000011;
				4'hC: leds = 7'b1000110;
				4'hD: leds = 7'b0100001;
				4'hE: leds = 7'b0000110;
				4'hF: leds = 7'b0001110;
				
				// Repurposed
				4'h0: leds = 7'b0010010; // s for sharp
				4'h1: leds = 7'b1000010; // g for g
				
				default: leds = 7'b1111111;
			endcase
		end
	end

endmodule  // seg7