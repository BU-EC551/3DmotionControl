`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:10:57 02/21/2014 
// Design Name: 
// Module Name:    vga_display 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
 module task3(clk, rst,HS, VS, red, green, blue, btns, btnu, btnl, btnr, btnd, mode, xAxis, yAxis, zAxis);
	 input clk;
	 input rst;
    input btns;
    input btnu;
    input btnl;
    input btnd;
    input btnr;
	 input mode;
	 output HS, VS;
	 output [2:0] red, green;
	 output [1:0] blue;
	 input [9:0]   xAxis;		// x-axis data from PmodACL
    input [9:0]   yAxis;		// y-axis data from PmodACL
    input [9:0]   zAxis;		// z-axis data from PmodACL
	 
	 //reg HS, VS;
	 reg [2:0] red, green;
	 reg [1:0] blue;
	 reg [7:0] data;
	 
	 wire blank;
	 wire [10:0] hcounter, vcounter;
	 wire pix_clk;
	 
	 wire [7:0] data_out;

   // Button debounce
   button_debounce button_debounce_btns (
      .i_clk(clk),
      .i_button(btns),
      .o_button_state(btns_debounce)
      );      

   // Button debounce
   button_debounce button_debounce_btnu (
      .i_clk(clk),
      .i_button(btnu),
      .o_button_state(btnu_debounce)
      );      

  // Button debounce
   button_debounce button_debounce_btnd (
      .i_clk(clk),
      .i_button(btnd),
      .o_button_state(btnd_debounce)
      );      

   // Button debounce
   button_debounce button_debounce_btnl (
      .i_clk(clk),
      .i_button(btnl),
      .o_button_state(btnl_debounce)
      );      

   // Button debounce
   button_debounce button_debounce_btnr (
      .i_clk(clk),
      .i_button(btnr),
      .o_button_state(btnr_debounce)
      );      

 
   //VGA clock divider
   clk_divider 
      #(4) 
      divider1(
         .i_clk(clk), 
         .o_clk(pix_clk)
    );

	 clk_divider 
         #(1000000) 
      divider2(
         .i_clk(clk), 
         .o_clk(slow_clk)
    );
	 
	 
   vga_controller_640_60 controller(
	.pixel_clk(pix_clk),
	.HS(HS),
	.VS(VS),
	.hcounter(hcounter),
	.vcounter(vcounter),
	.blank(blank));
	
  wire ball_en, maze_en;
  wire [5:0] maze_en_portions;
  wire [7:0] ball_rgb;
   maze_and_ball maze (
      .clk(slow_clk),
		.rst(rst), 
      .hcounter(hcounter),
      .vcounter(vcounter),
      .up(btnu_debounce),
      .down(btnd_debounce),
      .left(btnl_debounce), 
      .right(btnr_debounce),
      .ball_en(ball_en),
      .ball_rgb(ball_rgb),
      .maze_en(maze_en),
		.maze_en_portions(maze_en_portions), 
		.xAxis(xAxis),
		.yAxis(yAxis),
		.zAxis(zAxis)
    );

	 /* always@(posedge clk) begin
      if(!blank)begin
        {red,green,blue} = 8'b00000000;
        if (maze_en) begin
          {red,green,blue} = 8'b11100000;
        end
        if (ball_en) begin
          //{red,green,blue} = 8'b00000011;
          {red,green,blue} = ball_rgb;
        end 
	   end
	     else {red,green,blue} = 8'b00000000;
    end */
	 
	 	
	reg [30:0] cnt = 31'b0; 
	always @ (posedge clk) begin
		cnt <= cnt + 1'b1; 
	end
	
		always @ (cnt) begin
			if(!blank) begin
				{red,green,blue} = 8'b00000000;
				if (mode) begin
					if (maze_en) begin
						//{red,green,blue} = 8'b11100000;
						if(maze_en_portions[0]) begin
							if (cnt[28:27] == 0) begin
								{red,green,blue} = 8'b10010010;
							end
							else begin
							{red,green,blue} = 8'b00000000;
							end
						end
						if(maze_en_portions[1]) begin
							if (cnt[28:27] == 1) begin
								{red,green,blue} = 8'b11011000;
							end
							else begin
								{red,green,blue} = 8'b00000000;
							end
						end
						if(maze_en_portions[2]) begin
							if (cnt[28:27] == 2) begin
								{red,green,blue} = 8'b11010001;
							end
							else begin
								{red,green,blue} = 8'b00000000;
							end
						end
						if(maze_en_portions[3]) begin
							if (cnt[28:27] == 0) begin
								{red,green,blue} = 8'b00100110;
							end
							else begin
								{red,green,blue} = 8'b00000000;
							end
						end
						if(maze_en_portions[4]) begin
							if (cnt[28:27] == 1) begin
								{red,green,blue} = 8'b10101011;
							end
							else begin
								{red,green,blue} = 8'b00000000;
							end
						end	
						if(maze_en_portions[5]) begin
							if (cnt[28:27] == 2) begin
								{red,green,blue} = 8'b00001011;
							end
							else begin
								{red,green,blue} = 8'b00000000;
							end
						end
					end
					
					if (ball_en) begin
						{red,green,blue} = ball_rgb;
					end 
					
				end
				else begin
					if (maze_en) begin
						//{red,green,blue} = 8'b11100000;
						if(maze_en_portions[0]) begin
							if (cnt[30:28] == 0) begin
								{red,green,blue} = 8'b10010010;
							end
							else begin
								{red,green,blue} = 8'b00001011;
							end
						end
						if(maze_en_portions[1]) begin
							if (cnt[30:28] == 1) begin
								{red,green,blue} = 8'b11011000;
							end
							else begin
								{red,green,blue} = 8'b10010010;
							end
						end
						if(maze_en_portions[2]) begin
							if (cnt[30:28] == 2) begin
								{red,green,blue} = 8'b11010001;
							end
							else begin
								{red,green,blue} = 8'b00100110;
							end
						end
						if(maze_en_portions[3]) begin
							if (cnt[30:28] == 3) begin
								{red,green,blue} = 8'b00100110;
							end
							else begin
								{red,green,blue} = 8'b11011000;
							end
						end
						if(maze_en_portions[4]) begin
							if (cnt[30:28] == 4) begin
								{red,green,blue} = 8'b10101011;
							end
							else begin
								{red,green,blue} = 8'b11010001;
							end
						end	
						if(maze_en_portions[5]) begin
							if (cnt[30:28] == 5) begin
								{red,green,blue} = 8'b00001011;
							end
							else begin
								{red,green,blue} = 8'b11010001;
							end
						end
					end
					
					if (ball_en) begin
						{red,green,blue} = ball_rgb;
					end 
					
				end
			end
			else begin
				{red,green,blue} = 8'b00000000;
			end
		end	 

endmodule




