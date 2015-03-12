`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:07 03/09/2014 
// Design Name: 
// Module Name:    draw_lines 
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
module draw_lines(
      // 
      input                               i_clk,
      input                               i_reset,
		input											i_switchShape,
		input		signed	[P_Y_COORD_W-1:0] incY, 
      input            	[P_X_COORD_W-1:0] i_x0,//
      input             [P_X_COORD_W-1:0] i_x1,//trace here
      input		signed   [P_Y_COORD_W-1:0] i_y0,//
      input    signed   [P_Y_COORD_W-1:0] i_y1,//
      input            							i_clear_buffer,
      output                              o_waiting,
      // VGA 
      input             [P_X_COORD_W-1:0] i_hcounter,
      input             [P_Y_COORD_W-1:0] i_vcounter,
      output                              o_pixel_on
    );
	 
    // Parameter
    parameter P_X_COORD_W = 16;
    parameter P_Y_COORD_W = 16;
    parameter P_SCREEN_W = 640;
    parameter P_SCREEN_H = 480;
    parameter P_DATA_W = 1;
    parameter P_LOG2_RAM_DEPTH = 19;
    
    // Local parameter
    localparam STATE__WAITING = 0;
    localparam STATE__CLEAR   = 1;
    localparam STATE__LOAD    = 2;
    localparam STATE__DRAW    = 3;
    localparam STATE__DRAW2   = 4;
    
    // State registers
    reg [2:0] curr_state;
    reg [2:0] next_state;
    
    // Screen buffer control and data signals
    wire [P_LOG2_RAM_DEPTH-1:0] clear_addr;
	 wire [7:0]						  circle_addr; 
    wire [P_LOG2_RAM_DEPTH-1:0] bres_addr;
    wire [P_LOG2_RAM_DEPTH-1:0] bres_addr2;
    reg  [P_LOG2_RAM_DEPTH-1:0] buffer_addr;
    reg  [P_LOG2_RAM_DEPTH-1:0] buffer_addr2;
    wire clear_wr;
    wire circle_wr;
    wire bres_wr;
    reg  buffer_wr;
    reg  buffer_wr2;
    wire [P_DATA_W-1:0] clear_data;
    wire [P_DATA_W-1:0] bres_data;
    wire [P_DATA_W-1:0] bres_data2;
    reg  [P_DATA_W-1:0] buffer_data;
    reg  [P_DATA_W-1:0] buffer_data2;
    
    // Bresenham control signals
    wire bres_waiting;
    wire load_vals;
    
    // Bresenham coordinates
    wire     [P_X_COORD_W-1:0] x_val;
    wire     [P_Y_COORD_W-1:0] y_val;
    
    // Counter reset signal
    wire counter_reset;
	 
	 // Circle counter reset signal
	 wire circle_counter_reset; 
    
    // FIFO control signals
    wire fifo_empty;
    assign fifo_empty = 1'b1; // place holder until FIFO is implemented
    
    // Generate output waiting status signal
    assign o_waiting  = (curr_state == STATE__WAITING) ? 1'b1 : 1'b0;
    
    ///////////////////////////
    // Control state machine //
    ///////////////////////////
    // Change state
    always @(posedge i_clk) 
    begin
      if (i_reset) begin
         curr_state <= STATE__WAITING;
      end else begin
         curr_state <= next_state;
      end
    end

   // Next state logic
   always @(curr_state, i_clear_buffer, clear_addr, circle_addr, bres_waiting, fifo_empty)
   begin
      next_state = curr_state;
      case(curr_state)
         STATE__WAITING : begin
            if (i_clear_buffer == 1'b1) begin
               next_state = STATE__CLEAR;
            end
         end
         STATE__CLEAR : begin
            if (clear_addr == P_SCREEN_W*P_SCREEN_H) begin
               next_state = STATE__LOAD;
            end
         end
         STATE__LOAD : begin
            next_state = STATE__DRAW;
         end
         STATE__DRAW : begin
            if (bres_waiting && fifo_empty) begin
               next_state = STATE__DRAW2;
            end else if (~fifo_empty) begin
               next_state = STATE__LOAD;
            end
         end
			STATE__DRAW2 : begin
            if (circle_addr == 143) begin
               next_state = STATE__WAITING;
            end 
				else begin
               next_state = STATE__DRAW2;
            end
			end
			default : begin
				next_state = STATE__CLEAR;
			end
      endcase
   end
   
   //////////////////
   // Line drawing //
   //////////////////
	bresenham bres (
		.i_clk(i_clk), 
		.i_reset(i_reset), 
		.i_x0(i_x0), 
		.i_x1(i_x1), 
		.i_y0(i_y0), 
		.i_y1(i_y1), 
		.i_load_vals(load_vals), 
      .o_x_val(x_val),
      .o_y_val(y_val),
		.o_vals_rdy(bres_wr),
      .o_waiting(bres_waiting)
	);
   
   assign load_vals = (curr_state == STATE__LOAD) ? 1'b1 : 1'b0;

   ///////////////////
   // Screen buffer //
   ///////////////////
   // Implement screen buffer in dual port RAM
   //   One port used by VGA interface, one port used by Bresenham and clear
   dp_ram #(
      .P_DATA_W(P_DATA_W),
      .P_LOG2_RAM_DEPTH(P_LOG2_RAM_DEPTH)
      ) screen_buffer (
         .i_clk(i_clk),
         .i_a_wr(buffer_wr),
         .i_a_addr(buffer_addr),
         .i_a_data(buffer_data),
         .o_a_data(),
         .i_b_wr(1'b0),
         .i_b_addr(P_SCREEN_W*i_vcounter+i_hcounter),
         .i_b_data(0),
         .o_b_data(o_pixel_on)
    );
   
   // Generate RAM control signals   
   assign bres_addr  = P_SCREEN_W*y_val+x_val;
   assign bres_data  = 1;
	//assign bres_addr2  = P_SCREEN_W*(y_val-1)+x_val;
   assign bres_data2 = 1;
   assign clear_wr   = (curr_state == STATE__CLEAR) ? 1'b1 : 1'b0;
   assign circle_wr   = (curr_state == STATE__DRAW2) ? 1'b1 : 1'b0;
   assign clear_data = 0;
	
	//**** Keeping track of the moving "object" on line ****** 
	wire slowClk;
	reg [20:0] slowCounter;
	always @ (posedge i_clk) begin
		slowCounter <= slowCounter + 1'b1;
	end
	assign slowClk = slowCounter[20];
	
	always @ (posedge slowClk) begin
		if (i_reset) begin
			xCircle = 325;
		end
		else begin
			if (incY[P_Y_COORD_W-1]) begin
				xCircle = xCircle + (incY[5:4]); 
			end
			else begin
				xCircle = xCircle - (incY[5:4]);
			end
			if (xCircle >= 400) begin
				xCircle = 400; 
			end
			else if (xCircle <= 250) begin
				xCircle = 250; 
			end
		end
	end
	//********************************************************
	
	reg [P_LOG2_RAM_DEPTH-1:0] xCircle = 325;
	reg [P_LOG2_RAM_DEPTH-1:0] yCircle = 200;
   
   always @(bres_addr, bres_addr2, clear_addr, circle_addr,
            bres_wr, clear_wr, circle_wr,
            bres_data, clear_data, 
            curr_state)
   begin
      case (curr_state)
         STATE__CLEAR : begin
            buffer_wr   = clear_wr;
            buffer_addr = clear_addr;
            buffer_data = clear_data;
         end
         STATE__DRAW : begin
				if (x_val == xCircle) begin
					yCircle = y_val; 
				end
				buffer_wr   = bres_wr;
				buffer_data = bres_data;
				buffer_addr = bres_addr;
			end
			STATE__DRAW2 : begin
				if (i_switchShape) begin
				if (circle_addr == 1) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - circle_addr) + xCircle; 
				end
				else if (circle_addr >= 12 && circle_addr <= 14) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 12)) + xCircle + 1; 
				end
				else if ((circle_addr >= 24 && circle_addr <= 27) || circle_addr == 33) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 24)) + xCircle + 2; 
				end
				else if ((circle_addr >= 37 && circle_addr <= 40) || circle_addr == 44) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 36)) + xCircle + 3; 
				end
				else if ((circle_addr >= 48 && circle_addr <= 53) || circle_addr == 55) begin
					if (circle_addr == 51) begin 
						buffer_wr   = 0;
					end 
					else begin
						buffer_wr   = circle_wr;
					end
					buffer_data = 1; 
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 48)) + xCircle + 4; 
				end
				else if (circle_addr >= 60 && circle_addr <= 66) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 60)) + xCircle + 5; 
				end
				else if (circle_addr >= 72 && circle_addr <= 78) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 72)) + xCircle + 6; 
				end
				else if ((circle_addr >= 85 && circle_addr <= 89) || circle_addr == 91) begin
					buffer_data = 1; 
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 84)) + xCircle + 7; 
					if (circle_addr == 87) begin
						buffer_wr   = 0; 
					end
					else begin
						buffer_wr   = circle_wr;
					end
				end
				else if ((circle_addr >= 97 && circle_addr <= 100) || circle_addr == 104) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 96)) + xCircle + 8; 
				end
				else if ((circle_addr >= 108 && circle_addr <= 111) || circle_addr == 117) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 108)) + xCircle + 9; 
				end
				else if (circle_addr >= 120 && circle_addr <= 122) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 120)) + xCircle + 10; 
				end
				else if (circle_addr == 133) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 132)) + xCircle + 11; 
				end
				else begin
					buffer_addr = 0; 
					buffer_data = 0; 
					buffer_wr   = 0;
				end
				end 
				else begin
				if (circle_addr >= 5 && circle_addr <=6) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - circle_addr) + xCircle; 
				end
				else if (circle_addr >= 16 && circle_addr <= 19) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 12)) + xCircle + 1; 
				end
				else if (circle_addr >= 27 && circle_addr <= 32) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 24)) + xCircle + 2; 
				end
				else if (circle_addr >= 38 && circle_addr <= 45) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 36)) + xCircle + 3; 
				end
				else if (circle_addr >= 49 && circle_addr <= 58) begin
					buffer_wr   = circle_wr;
					buffer_data = 1; 
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 48)) + xCircle + 4; 
				end
				else if (circle_addr >= 60 && circle_addr <= 71) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 60)) + xCircle + 5; 
				end
				else if (circle_addr >= 72 && circle_addr <= 83) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 72)) + xCircle + 6; 
				end
				else if (circle_addr >= 85 && circle_addr <= 94) begin
					buffer_data = 1; 
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 84)) + xCircle + 7; 
					buffer_wr   = circle_wr;
				end
				else if (circle_addr >= 98 && circle_addr <= 105) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 96)) + xCircle + 8; 
				end
				else if (circle_addr >= 111 && circle_addr <= 116) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 108)) + xCircle + 9; 
				end
				else if (circle_addr >= 124 && circle_addr <= 127) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 120)) + xCircle + 10; 
				end
				else if (circle_addr >= 137 && circle_addr <= 138) begin
					buffer_data = 1; 
					buffer_wr   = circle_wr;
					buffer_addr = P_SCREEN_W*(yCircle - (circle_addr - 132)) + xCircle + 11; 
				end
				else begin
					buffer_addr = 0; 
					buffer_data = 0; 
					buffer_wr   = 0;
				end
				end
         end
         default : begin
            buffer_wr   = 1'b0;
            buffer_addr = 0;
            buffer_data = 0;
         end
      endcase
   end

   // Counter for clear address
   counter #(.P_COUNT_W(P_LOG2_RAM_DEPTH)) 
      counter (
         .i_clk(i_clk),
         .i_reset(counter_reset),
         .o_count(clear_addr)
	);
	
	// Counter for drawing circle 
   counter #(144) 
      counter2(
         .i_clk(i_clk),
         .i_reset(circle_counter_reset),
         .o_count(circle_addr)
	);
   
   // Reset the counter when not in clear state
   assign counter_reset = i_reset | ((curr_state == STATE__CLEAR) ? 1'b0 : 1'b1);

	// Reset the circle counter when not in state draw 2 
	assign circle_counter_reset = i_reset | ((curr_state == STATE__DRAW2) ? 1'b0 : 1'b1);


endmodule