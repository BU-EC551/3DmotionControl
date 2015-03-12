`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:41:10 04/18/2014 
// Design Name: 
// Module Name:    GYRO_Interface 
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
module GYRO_Interface(
		clk,
		rst,
		start,
		x_axis_data,
		y_axis_data,
		z_axis_data,
		miso,
		mosi,
		sclk,
		slaveSelect
);

// ==============================================================================
// 									   Port Declarations
// ==============================================================================
			input            clk;
			input            rst;
			input            start;
			output [15:0]    x_axis_data;
			output [15:0]    y_axis_data;
			output [15:0]    z_axis_data;
			input            miso;
			output           mosi;
			output           sclk;
			output			  slaveSelect;
			
			wire         begin_transmission;
			wire         end_transmission;	
			wire [7:0]   send_data;
			wire [7:0]   recieved_data;
			wire [7:0]   temp_data;
			//--------------------------------------
			//		Serial Port Interface Controller
			//--------------------------------------
			master_interface gyro_master(
						.begin_transmission(begin_transmission),
						.end_transmission(end_transmission),
						.send_data(send_data),
						.recieved_data(recieved_data),
						.clk(clk),
						.rst(rst),
						.slave_select(slaveSelect),
						.start(start),
						.temp_data(temp_data),
						.x_axis_data(x_axis_data),
						.y_axis_data(y_axis_data),
						.z_axis_data(z_axis_data)
			);
			
			//--------------------------------------
			//		    Serial Port Interface
			//--------------------------------------
			spi_interface gyro_spi(
						.begin_transmission(begin_transmission),
						.slave_select(slaveSelect),
						.send_data(send_data),
						.recieved_data(recieved_data),
						.miso(miso),
						.clk(clk),
						.rst(rst),
						.end_transmission(end_transmission),
						.mosi(mosi),
						.sclk(sclk)
			);

endmodule
