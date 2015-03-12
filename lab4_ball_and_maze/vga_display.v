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
 module vga_display(clk,HS, VS, red, green, blue, sw[7:0], btns, btnu, btnl, btnr, btnd);
	 input clk;
    input [7:0] sw;
    input btns;
    input btnu;
    input btnl;
    input btnd;
    input btnr;
	 output HS, VS;
	 output [2:0] red, green;
	 output [1:0] blue;
	 
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
  wire [7:0] ball_rgb;
   maze_and_ball maze (
      .clk(slow_clk),
      .hcounter(hcounter),
      .vcounter(vcounter),
      .up(btnu_debounce),
      .down(btnd_debounce),
      .left(btnl_debounce), 
      .right(btnr_debounce),
      .ball_en(ball_en),
      .ball_rgb(ball_rgb),
      .maze_en(maze_en)
    );

	 always@(posedge clk) begin
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
    end
		
    
	 

endmodule




