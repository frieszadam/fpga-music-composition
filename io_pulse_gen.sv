`define LEN 1
module io_pulse_gen (clk, buttons, button_pulse);
	input logic clk;
	input logic [3:0] buttons;
	output logic [3:0] button_pulse;
	
	logic [3:0] b1, b2;
	// filter for metastability
	always_ff @(posedge clk) begin
		b1 <= buttons;
		b2 <= b1;
	end
	
	logic [12:0] counter0, counter1, counter2, counter3;
	logic wasOn0, wasOn1, wasOn2, wasOn3;
	
	always_ff@(posedge clk) begin
		case(b2[0])
			0: begin counter0 <= 0; wasOn0 <= 0; end
			1: counter0 <= counter0 + 1;
		endcase
		
		case(b2[1])
			0: begin counter1 <= 0; wasOn1 <= 0; end
			1: counter1 <= counter1 + 1;
		endcase
		
		case(b2[2])
			0: begin counter2 <= 0; wasOn2 <= 0; end
			1: counter2 <= counter2 + 1;
		endcase
		
		case(b2[3])
			0: begin counter3 <= 0; wasOn3 <= 0; end
			1: counter3 <= counter3 + 1;
		endcase
		
		if (counter0 ==`LEN) begin
			wasOn0 <= 1;
//			button_pulse[0] <= wasOn0 ? 0: 1;
		end
		if (counter1 ==`LEN) begin
			wasOn1 <= 1;
//			button_pulse[1] <= wasOn1 ? 0: 1;
		end
		if (counter2 ==`LEN) begin
			wasOn2 <= 1;
//			button_pulse[2] <= wasOn2 ? 0: 1;
		end
		if (counter3 ==`LEN) begin
			wasOn3 <= 1;
//			button_pulse[2] <= wasOn2 ? 0: 1;
		end
	end
	
	assign button_pulse = {~wasOn3 & counter3==`LEN, ~wasOn2 & counter2==`LEN, ~wasOn1 & counter1==`LEN, ~wasOn0 & counter0==`LEN};
endmodule // pulse_gen