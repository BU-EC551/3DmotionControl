`timescale 1ns / 1ps
module move_circle(
	 input CLK, 
	 input RST, 
    input [9:0] xAxisG,
	 input [9:0] yAxisG, 
	 input vga_blank,
	 input [10:0] vga_hcounter,
    input [10:0] vga_vcounter,
	 output [2:0] vgaRed,
	 output [2:0] vgaGreen,
    output [2:1] vgaBlue,
    output Hsync,
    output Vsync
    );
	 
	 // VGA
	wire        vga_clk;
	wire 			circle_clk;
	reg   [2:0] vga_red;
	reg   [2:0] vga_grn;
	reg   [1:0] vga_blu;
	reg pixel_on; 
	
	reg [9:0] xCoord = 400; 
	reg [9:0] yCoord = 400; 
	reg [9:0] tempXMag; 
	reg [9:0] tempYMag; 
	// Circle movement clock divider 
	clk_divider #(10000000) circle_clk_div(
		.i_clk(CLK),
		.o_clk(circle_clk)
	);
	
	// Every time raw G value comes in, update xcoord, ycoord 
	always @ (posedge circle_clk) begin
		if (RST) begin
			xCoord = 300; 
			yCoord = 300; 
		end 
		else begin
			if (xAxisG[9]) begin
				tempXMag = {xAxisG[9], (9'b000000000 - xAxisG[8:0])};
				xCoord = xCoord - tempXMag[8:3];
			end
			else begin
				xCoord = xCoord + xAxisG[8:3];
			end
			
			if (yAxisG[9]) begin
				tempYMag = {yAxisG[9], (9'b000000000 - yAxisG[8:0])};
				yCoord = yCoord - tempYMag[8:3];
			end
			else begin
				yCoord = yCoord + yAxisG[8:3];
			end
			
			//xCoord = xCoord + (xAxisG >>> 8);
			//yCoord = yCoord + (yAxisG >>> 8);
		end
	end
	 
	 always @ (vga_hcounter or vga_vcounter) begin
		if (vga_hcounter == (xCoord) && vga_vcounter == (yCoord)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 1) && vga_vcounter == (yCoord)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 2) && vga_vcounter == (yCoord)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 3) && vga_vcounter == (yCoord)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 4) && vga_vcounter == (yCoord)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 5) && vga_vcounter == (yCoord)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 2) && vga_vcounter == (yCoord + 1)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 2) && vga_vcounter == (yCoord + 2)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 2) && vga_vcounter == (yCoord + 3)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 1) && vga_vcounter == (yCoord + 4)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 4) && vga_vcounter == (yCoord + 1)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 4) && vga_vcounter == (yCoord + 2)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 4) && vga_vcounter == (yCoord + 3)) begin
			pixel_on = 1'b1; 
		end
		else if (vga_hcounter == (xCoord + 4) && vga_vcounter == (yCoord + 4)) begin
			pixel_on = 1'b1; 
		end
		else begin
			pixel_on = 1'b0; 
		end
	 end

    always @(vga_blank, pixel_on)
    begin
      if (vga_blank == 0) begin
         if (pixel_on == 1) begin
            vga_red = 3'b000;
            vga_grn = 3'b111;
            vga_blu = 2'b00;
         end else begin
            vga_red = 3'b000;
            vga_grn = 3'b000;
            vga_blu = 2'b00;
         end
      end else begin
         vga_red = 3'b000;
         vga_grn = 3'b000;
         vga_blu = 2'b00;
      end
    end

   assign vgaRed   = vga_red;
   assign vgaGreen = vga_grn;
   assign vgaBlue  = vga_blu;

endmodule
