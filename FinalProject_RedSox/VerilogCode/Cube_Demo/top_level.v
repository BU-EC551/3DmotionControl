`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:01:41 04/20/2014 
// Design Name: 
// Module Name:    top_level 
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
module top_level(
			JA,
			SDI,
			SDO,
			SS,
			SCLK,
			x_final,
			y_final,
			z_final,
			clk,
			rst,
			sw,
			an,
			seg
    );

input clk,rst;
input [3:0] sw;
	 
input SDI;

output SDO,SS,SCLK;

output [15:0] x_final, y_final, z_final;
output [3:0] an;
output [6:0] seg;	 
inout [3:0] JA;	



//internal wire
wire [19:0] gyro_x, gyro_y, gyro_z;
wire [9:0] acc_x, acc_y, acc_z;
wire [9:0] DOUT_x, DOUT_y, DOUT_z;
wire [15:0] x_final_out,y_final_out,z_final_out;
//wire temp_data;
wire [3:0] sw;

//Gyro instance
PmodGYRO_Demo gyro(
		.sw(sw[1:0]),//In
//		.sel(sw[3:2]),
		.clk(clk),//In
		.JA(JA),//In
		.x_axis_data(gyro_x),//Out
		.y_axis_data(gyro_y),//Out
		.z_axis_data(gyro_z)//Out
//		.temp_data(temp_data)//output
);

//Acc instances
PmodACL_Demo acc(
		.CLK(clk),//Input
		.RST(sw[0]),//Input
//		.SW(sw),//Input
		.SDI(SDI),//Input
		.SDO(SDO),//Output
		.SCLK(SCLK),//Output
		.SS(SS),//Output
		.acc_out_x(acc_x),//Output 10-bit, MSB=sign, rest is magnitude
		.acc_out_y(acc_y),//Output 10-bit, MSB=sign, rest is magnitude
		.acc_out_z(acc_z)//Output  10-bit, MSB=sign, rest is magnitude
);


//CF instance: Combine gyro data and accelerometer data in complimentary filter
CF compfilter(
			 .gyroData_x(gyro_x),.gyroData_y(gyro_y),.gyroData_z(gyro_z),//GYRO In
			 .x_accel_data(acc_x),.y_accel_data(acc_y),.z_accel_data(acc_z),//ACC In
			 .clk(clk),
			 .RST(sw[0]),//In
			 .x_final(x_final_out),.y_final(y_final_out),.z_final(z_final_out)//DEGREE Out
);


//SSD instance
display_controller SSD(
		.clk(clk),//input
		.rst(sw[0]),//input
		.sel(sw[3:2]),//input
//		.temp_data(temp_data),//input
		.x_axis(x_final_out),//input 
		.y_axis(y_final_out),//input 
		.z_axis(z_final_out),
		//.z_axis({6'b0,acc_z[9:0]}),//input 
//		.dp(dp),//output
		.an(an),//output
		.seg(seg)//output
//		.display_sel(sw[4])//input
);

assign x_final = x_final_out; 
assign y_final = y_final_out; 
assign z_final = z_final_out; 

endmodule
