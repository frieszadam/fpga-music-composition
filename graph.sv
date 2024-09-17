// This modules is a helper module that creates the graph portion of the visual.
// Takes in x and y coord and uses to create the axes and labels. 
module graph (x, y, r, g, b);
	input logic [9:0] x;
	input logic [8:0] y;
	output logic [7:0] r, g, b;

	// Setting up the graph
   always_comb begin
		// y-axis line & labels 
		if ( (x > 59 && x < 65) && ( y > 29 && y < 451)) begin
			r = 255; g = 255; b = 255;
		end 
		
		// Tick #1
		else if ( (x > 54 && x < 60) && ( y > 45 && y < 49)) begin
			r = 255; g = 255; b = 255;
		end 
		
		// C
		else if ( (x > 29 && x < 54) && ( y > 29 && y < 65)) begin
			// Side part
			if ( (x > 29 && x < 32) && ( y > 40 && y < 54)) begin
				r = 90; g = 222; b = 0;
			end 
			
			// Top part
			else if ( (x > 31 && x < 38) && ( y > 36 && y < 40)) begin
				r = 90; g = 222; b = 0;
			end 
			
			// Bottom part
			else if ( (x > 31 && x < 38) && ( y > 54 && y < 58)) begin
				r = 90; g = 222; b = 0;
			end
			
			else begin
				r = 0; g = 0; b = 0;
			end				
		end 
		
		// Tick #2
		else if ( (x > 54 && x < 60) && ( y > 80 && y < 84)) begin
			r = 255; g = 255; b = 255;
		end
		
		// C#
		else if ( (x > 29 && x < 54) && ( y > 64 && y < 100)) begin
			// Side part
			if ( (x > 29 && x < 32) && ( y > 75 && y < 89)) begin
				r = 219; g = 221; b = 0;
			end 
			
			// Top part
			else if ( (x > 31 && x < 38) && ( y > 71 && y < 75)) begin
				r = 219; g = 221; b = 0;
			end 
			
			// Bottom part
			else if ( (x > 31 && x < 38) && ( y > 89 && y < 93)) begin
				r = 219; g = 221; b = 0;
			end
			
			// #
			else if ( (x > 40 && x < 51) && ( y > 75 && y < 79)) begin
				r = 219; g = 221; b = 0;
			end
			
			else if ( (x > 40 && x < 51) && ( y > 85 && y < 89)) begin
				r = 219; g = 221; b = 0;
			end	
			
			else if ( (x > 42 && x < 45) && ( y > 71 && y < 93)) begin
				r = 219; g = 221; b = 0;
			end
			
			else if ( (x > 46 && x < 49) && ( y > 71 && y < 93)) begin
				r = 219; g = 221; b = 0;
			end
			
			else begin
				r = 0; g = 0; b = 0;
			end				
		end 
		
		// Tick #3
		else if ( (x > 54 && x < 60) && ( y > 115 && y < 119)) begin
			r = 255; g = 255; b = 255;
		end
		
		// D
		else if ( (x > 29 && x < 54) && ( y > 99 && y < 135)) begin
			// Left part
			if ( (x > 29 && x < 32) && ( y > 106 && y < 128)) begin
				r = 219; g = 95; b = 0;
			end 
			
			// Top part
			else if ( (x > 31 && x < 37) && ( y > 106 && y < 110)) begin
				r = 219; g = 95; b = 0;
			end 
			
			// Bottom part
			else if ( (x > 31 && x < 37) && ( y > 124 && y < 128)) begin
				r = 219; g = 95; b = 0;
			end
			
			// Right part
			else if ( (x > 36 && x < 39) && ( y > 110 && y < 124)) begin
				r = 219; g = 95; b = 0;
			end 
			
			else begin
				r = 0; g = 0; b = 0;
			end
		end 
		
		// Tick #4
		else if ( (x > 54 && x < 60) && ( y > 150 && y < 154)) begin
			r = 255; g = 255; b = 255;
		end
		
		
		// D#
		else if ( (x > 29 && x < 54) && ( y > 134 && y < 170)) begin
			// Left part
			if ( (x > 29 && x < 32) && ( y > 141 && y < 163)) begin
				r = 188; g = 0; b = 0;
			end 
			
			// Top part
			else if ( (x > 31 && x < 37) && ( y > 141 && y < 145)) begin
				r = 188; g = 0; b = 0;
			end 
			
			// Bottom part
			else if ( (x > 31 && x < 37) && ( y > 159 && y < 163)) begin
				r = 188; g = 0; b = 0;
			end
			
			// Right part
			else if ( (x > 36 && x < 39) && ( y > 145 && y < 159)) begin
				r = 188; g = 0; b = 0;
			end 
			
			// #
			else if ( (x > 40 && x < 51) && ( y > 145 && y < 149)) begin
				r = 188; g = 0; b = 0;
			end
			
			else if ( (x > 40 && x < 51) && ( y > 155 && y < 159)) begin
				r = 188; g = 0; b = 0;
			end	
			
			else if ( (x > 42 && x < 45) && ( y > 141 && y < 163)) begin
				r = 188; g = 0; b = 0;
			end
			
			else if ( (x > 46 && x < 49) && ( y > 141 && y < 163)) begin
				r = 188; g = 0; b = 0;
			end
			
			else begin
				r = 0; g = 0; b = 0;
			end
		end 
		
		// Tick #5
		else if ( (x > 54 && x < 60) && ( y > 185 && y < 189)) begin
			r = 255; g = 255; b = 255;
		end
		
		// E
		else if ( (x > 29 && x < 54) && ( y > 169 && y < 205)) begin
			// Left part
			if ( (x > 29 && x < 32) && ( y > 176 && y < 198)) begin
				r = 233; g = 0; b = 88;
			end 
			
			// Top part
			else if ( (x > 31 && x < 37) && ( y > 176 && y < 180)) begin
				r = 233; g = 0; b = 88;
			end 
			
			// Bottom part
			else if ( (x > 31 && x < 37) && ( y > 194 && y < 198)) begin
				r = 233; g = 0; b = 88;
			end
			
			// Middle part
			else if ( (x > 31 && x < 37) && ( y > 185 && y < 189)) begin
				r = 233; g = 0; b = 88;
			end
			
			else begin
				r = 0; g = 0; b = 0;
			end
		end 
		
		// Tick #6
		else if ( (x > 54 && x < 60) && ( y > 220 && y < 224)) begin
			r = 255; g = 255; b = 255;
		end
		
		// F
		else if ( (x > 29 && x < 54) && ( y > 204 && y < 240)) begin
			// Left part
			if ( (x > 29 && x < 32) && ( y > 211 && y < 233)) begin
				r = 233; g = 0; b = 226;
			end 
			
			// Top part
			else if ( (x > 31 && x < 37) && ( y > 211 && y < 215)) begin
				r = 233; g = 0; b = 226;
			end 
			
			// Middle part
			else if ( (x > 31 && x < 37) && ( y > 220 && y < 224)) begin
				r = 233; g = 0; b = 226;
			end
			
			else begin
				r = 0; g = 0; b = 0;
			end
		end 
		
		// Tick #7
		else if ( (x > 54 && x < 60) && ( y > 255 && y < 259)) begin
			r = 255; g = 255; b = 255;
		end
		
		// F
		else if ( (x > 29 && x < 54) && ( y > 239 && y < 275)) begin
			// Left part
			if ( (x > 29 && x < 32) && ( y > 246 && y < 268)) begin
				r = 111; g = 0; b = 231;
			end 
			
			// Top part
			else if ( (x > 31 && x < 37) && ( y > 246 && y < 250)) begin
				r = 111; g = 0; b = 231;
			end 
			
			// Middle part
			else if ( (x > 31 && x < 37) && ( y > 255 && y < 259)) begin
				r = 111; g = 0; b = 231;
			end
			
			// #
			else if ( (x > 40 && x < 51) && ( y > 250 && y < 254)) begin
				r = 111; g = 0; b = 231;
			end
			
			else if ( (x > 40 && x < 51) && ( y > 260 && y < 264)) begin
				r = 111; g = 0; b = 231;
			end	
			
			else if ( (x > 42 && x < 45) && ( y > 246 && y < 268)) begin
				r = 111; g = 0; b = 231;
			end
			
			else if ( (x > 46 && x < 49) && ( y > 246 && y < 268)) begin
				r = 111; g = 0; b = 231;
			end
			
			else begin
				r = 0; g = 0; b = 0;
			end
		end 
		
		// Tick #8
		else if ( (x > 54 && x < 60) && ( y > 290 && y < 294)) begin
			r = 255; g = 255; b = 255;
		end
		
		// G
		else if ( (x > 29 && x < 54) && ( y > 274 && y < 310)) begin
			// Left part
			if ( (x > 29 && x < 32) && ( y > 285 && y < 299)) begin
				r = 0; g = 0; b = 216;
			end 
			
			// Top part
			else if ( (x > 31 && x < 38) && ( y > 281 && y < 285)) begin
				r = 0; g = 0; b = 216;
			end 
			
			// Bottom part
			else if ( (x > 31 && x < 38) && ( y > 299 && y < 303)) begin
				r = 0; g = 0; b = 216;
			end
			
			// Right part
			else if ( (x > 36 && x < 39) && ( y > 294 && y < 299)) begin
				r = 0; g = 0; b = 216;
			end
			
			else if ( (x > 33 && x < 39) && ( y > 292 && y < 295)) begin
				r = 0; g = 0; b = 216;
			end
			
			else begin
				r = 0; g = 0; b = 0;
			end				
		end 

		// Tick #9
		else if ( (x > 54 && x < 60) && ( y > 325 && y < 329)) begin
			r = 255; g = 255; b = 255;
		end
		
		// G#
		else if ( (x > 29 && x < 54) && ( y > 309 && y < 345)) begin
			// Left part
			if ( (x > 29 && x < 32) && ( y > 320 && y < 334)) begin
				r = 0; g = 89; b = 233;
			end 
			
			// Top part
			else if ( (x > 31 && x < 38) && ( y > 316 && y < 320)) begin
				r = 0; g = 89; b = 233;
			end 
			
			// Bottom part
			else if ( (x > 31 && x < 38) && ( y > 334 && y < 338)) begin
				r = 0; g = 89; b = 233;
			end
			
			// Right part
			else if ( (x > 36 && x < 39) && ( y > 329 && y < 334)) begin
				r = 0; g = 89; b = 233;
			end
			
			else if ( (x > 33 && x < 39) && ( y > 327 && y < 330)) begin
				r = 0; g = 89; b = 233;
			end
			
			// #
			else if ( (x > 40 && x < 51) && ( y > 320 && y < 324)) begin
				r = 0; g = 89; b = 233;
			end
			
			else if ( (x > 40 && x < 51) && ( y > 330 && y < 334)) begin
				r = 0; g = 89; b = 233;
			end	
			
			else if ( (x > 42 && x < 45) && ( y > 316 && y < 338)) begin
				r = 0; g = 89; b = 233;
			end
			
			else if ( (x > 46 && x < 49) && ( y > 316 && y < 338)) begin
				r = 0; g = 89; b = 233;
			end
			
			else begin
				r = 0; g = 0; b = 0;
			end				
		end 
		
		// Tick #10 
		else if ( (x > 54 && x < 60) && ( y > 360 && y < 364)) begin
			r = 255; g = 255; b = 255;
		end
		
		
		// A
		else if ( (x > 29 && x < 54) && ( y > 344 && y < 380)) begin
			// Left part
			if ( (x > 29 && x < 32) && ( y > 355 && y < 373)) begin
				r = 0; g = 227; b = 233;
			end 
			
			//Right part
			else if ( (x > 36 && x < 39) && ( y > 355 && y < 373)) begin
				r = 0; g = 227; b = 233;
			end 
			
			// Top part
			else if ( (x > 31 && x < 37) && ( y > 351 && y < 355)) begin
				r = 0; g = 227; b = 233;
			end 
			
			// Middle part
			else if ( (x > 31 && x < 37) && ( y > 360 && y < 364)) begin
				r = 0; g = 227; b = 233;
			end
			
			else begin
				r = 0; g = 0; b = 0;
			end				
		end

		// Tick #11
		else if ( (x > 54 && x < 60) && ( y > 395 && y < 399)) begin
			r = 255; g = 255; b = 255;
		end		
		
				
		// A
		else if ( (x > 29 && x < 54) && ( y > 379 && y < 415)) begin
			// Left part
			if ( (x > 29 && x < 32) && ( y > 390 && y < 408)) begin
				r = 0; g = 230; b = 108;
			end 
			// Right part
			else if ( (x > 36 && x < 39) && ( y > 390 && y < 408)) begin
				r = 0; g = 230; b = 108;
			end 
			
			// Top part
			else if ( (x > 31 && x < 37) && ( y > 386 && y < 390)) begin
				r = 0; g = 230; b = 108;
			end 
			
			// Middle part
			else if ( (x > 31 && x < 37) && ( y > 395 && y < 399)) begin
				r = 0; g = 230; b = 108;
			end
			
			// #
			else if ( (x > 40 && x < 51) && ( y > 390 && y < 394)) begin
				r = 0; g = 230; b = 108;
			end
			
			else if ( (x > 40 && x < 51) && ( y > 400 && y < 404)) begin
				r = 0; g = 230; b = 108;
			end	
			
			else if ( (x > 42 && x < 45) && ( y > 386 && y < 408)) begin
				r = 0; g = 230; b = 108;
			end
			
			else if ( (x > 46 && x < 49) && ( y > 386 && y < 408)) begin
				r = 0; g = 230; b = 108;
			end
			
			else begin
				r = 0; g = 0; b = 0;
			end				
		end
		
		// Tick #12
		else if ( (x > 54 && x < 60) && ( y > 430 && y < 434)) begin
			r = 255; g = 255; b = 255;
		end
		
		// B 
		else if ( (x > 29 && x < 54) && ( y > 414 && y < 450)) begin
			// Left part
			if ( (x > 29 && x < 32) && ( y > 421 && y < 443)) begin
				r = 0; g = 211; b = 0;
			end 
			
			// Right parts
			else if ( (x > 36 && x < 39) && ( y > 425 && y < 430)) begin
				r = 0; g = 211; b = 0;
			end
			
			else if ( (x > 36 && x < 39) && ( y > 434 && y < 439)) begin
				r = 0; g = 211; b = 0;
			end
						
			// Top part
			else if ( (x > 31 && x < 37) && ( y > 421 && y < 425)) begin
				r = 0; g = 211; b = 0;
			end 
			
			// Bottom part
			else if ( (x > 31 && x < 37) && ( y > 439 && y < 443)) begin
				r = 0; g = 211; b = 0;
			end
			
			// Middle part
			else if ( (x > 31 && x < 37) && ( y > 430 && y < 434)) begin
				r = 0; g = 211; b = 0;
			end
			
			else begin
				r = 0; g = 0; b = 0;
			end
		end
		
		// x-axis line 
		else if ( (x > 59 && x < 609) && ( y > 450 && y < 457)) begin
			r = 255; g = 255; b = 255;
		end
		
		// x-axis tick 
		else if ( (x > 334 && x < 337) && ( y > 456 && y < 464)) begin
			r = 255; g = 255; b = 255;
		end
		
		// x-axis tick 
		else if ( (x > 603 && x < 607) && ( y > 456 && y < 464)) begin
			r = 255; g = 255; b = 255;
		end
		
		// 20  
		else if ( (x > 589 && x < 609) && ( y > 464 && y < 479)) begin
			// 2
			if ( (x > 594 && x < 599) && ( y > 464 && y < 466)) begin
				r = 255; g = 255; b = 255;
			end 
			else if ( (x > 597 && x < 599) && ( y > 465 && y < 469)) begin
				r = 255; g = 255; b = 255;
			end 
			else if ( (x > 594 && x < 599) && ( y > 468 && y < 470)) begin
				r = 255; g = 255; b = 255;
			end 
			else if ( (x > 594 && x < 596) && ( y > 469 && y < 473)) begin
				r = 255; g = 255; b = 255;
			end 
			else if ( (x > 594 && x < 599) && ( y > 472 && y < 474)) begin
				r = 255; g = 255; b = 255;
			end
		
			// 0
			else if ( (x > 600 && x < 607) && ( y > 464 && y < 466)) begin
				r = 255; g = 255; b = 255;
			end
			else if ( (x > 600 && x < 603) && ( y > 465 && y < 473)) begin
				r = 255; g = 255; b = 255;
			end
			else if ( (x > 600 && x < 607) && ( y > 472 && y < 474)) begin
				r = 255; g = 255; b = 255;
			end
			else if ( (x > 604 && x < 607) && ( y > 465 && y < 473)) begin
				r = 255; g = 255; b = 255;
			end
			else begin
				r = 0; g = 0; b = 0;
			end
		end 
		

		else begin 
			r = 0; g = 0; b = 0;
		end 
	end
endmodule 