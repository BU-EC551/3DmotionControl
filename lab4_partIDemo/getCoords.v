`timescale 1ns / 1ps
module getCoords(
	input													clk_in,  
	input													rst_in,
	input 			signed	[15:0] 				x_axis_in, 
	output	reg 	signed	[P_COUNT_W-1:0] 	incY,
	output												slowClk
    );

	parameter  P_COUNT_W = 16; 

	reg [22:0] counter;
	always @ (posedge clk_in) begin
		counter <= counter + 1'b1;
	end
	assign slowClk = counter[22];
	
	// Gives 1.5Hz 
	always @ (posedge slowClk) begin
		if (rst_in) begin
			incY = 0; 
		end 
			else begin
			incY = incY + ($signed(x_axis_in[P_COUNT_W-1:0]) >>> 8); //2's complement shifter problem, use >>> is signed shift
			if (incY > 500) begin
				incY = 500; 
			end else if (incY < -500) begin
				incY = -500; 
			end
		end
	end

endmodule