`timescale 1ns / 1ps

//We can use a width of 640 and a height of 480. so X center is 320 and Y center is 240.

//x y z for array
module OneAngle(clk,reset,RW,LineNum, x_feed,y_feed,z_feed, outX,outY, outX2,outY2, outZ, outZ2
    );

//line respective order, AB,BC,CD,DA,     EF,FG,GH,HE     AE,BF,CG,DH
//out will be one line AX,AY,BX,BY
	 
parameter outSize = 12;


input clk,reset,RW;
input [3:0] LineNum;
input [9:0] x_feed,y_feed,z_feed;
output reg signed [outSize:0] outX,outY,outZ,outX2,outY2,outZ2;


wire signed[7:0] outAngleX,outAngleXSin, outAngleY,outAngleYSin, outAngleZ,outAngleZSin;
wire signed [outSize:0] OoutX ,OoutY,OoutZ,OoutX2,OoutY2,OoutZ2;


wire signed [5:0] AA [0:2];
wire signed [5:0] BB [0:2];
wire signed [5:0] CC [0:2];
wire signed [5:0] DD [0:2];
wire signed [5:0] EE [0:2];
wire signed [5:0] FF [0:2];
wire signed [5:0] GG [0:2];
wire signed [5:0] HH [0:2];

//storage of cube points
assign AA[0] = 10; assign AA[1] = 10 ; assign AA[2] = 0;
assign BB[0] =  10; assign BB[1] = -10 ; assign BB[2] = 0;
assign CC[0] = -10; assign CC[1] = -10 ; assign CC[2] = 0;
assign DD[0] =  -10; assign DD[1] = 10; assign DD[2] = 0;

assign EE[0] = 10;  assign EE[1] =  10 ; assign EE[2] = 10;
assign FF[0] = 10;  assign FF[1] =  -10 ; assign FF[2] = 10;
assign GG[0] = -10; assign GG[1] = -10 ; assign GG[2] = 10;

//variable storage of cube points
reg signed [5:0] PP [0:2];
reg signed [5:0] JJ [0:2];

reg signed [outSize:0] interoutX,interoutY,interoutZ,interoutX2,interoutY2,interoutZ2;

//state machine variable
reg [2:0] calcbreak;


//look up tables
Cos2 c1(x_feed,y_feed,z_feed,outAngleX, outAngleY, outAngleZ);
Sine2 s1(x_feed,y_feed,z_feed,outAngleXSin, outAngleYSin, outAngleZSin);


//beginning of clock cycle to breakdown the calculations
always@(posedge clk)begin

		
if(reset == 1)begin

	calcbreak <= 0;
			
end

calcbreak <= calcbreak + 1;

//state recycle
if(calcbreak == 5)begin

	calcbreak <= 0;

end

//Cascading states for breaking up calculation
if(calcbreak == 0)begin
			interoutX <=   PP[0]  * outAngleZ  ;//-    PP[1] *outAngleZSin +   PP[0] * outAngleY  +    PP[2] *outAngleYSin/100; 
			interoutY <=   PP[0] * outAngleZSin;// + PP[1] * outAngleZ  +   PP[1] * outAngleX  ) /100 ;//-    PP[2] *outAngleXSin/100;
			interoutX2 <=  JJ[0] * outAngleZ ;//-    JJ[1] *outAngleZSin  +   JJ[0] * outAngleY  ) /100 ;//+    JJ[2] *outAngleYSin/100;  //10
			interoutY2 <=  JJ[0] * outAngleZSin ;//+ JJ[1] * outAngleZ +   JJ[1] * outAngleX  ) /100 ;//-    JJ[2] *outAngleXSin/100;  //-10
			
			interoutZ <=  PP[1] * outAngleXSin;//+ PP[2] * outAngleX  - PP[0] * outAngleYSin + PP[2] * outAngleY ;
			interoutZ2 <=  JJ[1] * outAngleXSin;//+ JJ[2] * outAngleX - JJ[0] * outAngleYSin + JJ[2] * outAngleY ;
			
			outX <=    outX;
			outY <=   outY;
			outX2 <=   outX2; 
			outY2 <=   outY2; 
			
			outZ <=  outZ; 
			outZ2 <=  outZ2;



end

if(calcbreak == 1)begin
			interoutX <=  interoutX  - PP[1] *outAngleZSin; 
			interoutY <=  interoutY +   PP[1] * outAngleZ; 
			interoutX2 <=  interoutX2 - JJ[1] *outAngleZSin; 
			interoutY2 <=  interoutY2 + JJ[1] * outAngleZ; 
			
			interoutZ <=  interoutZ + PP[2] * outAngleX; 
			interoutZ2 <=  interoutZ2 + JJ[2] * outAngleX; 
			
			outX <=    outX;
			outY <=   outY;
			outX2 <=   outX2; 
			outY2 <=   outY2; 
			
			outZ <=  outZ; 
			outZ2 <=  outZ2;
			

end

if(calcbreak == 2)begin
			interoutX <=  interoutX +  PP[0] * outAngleY  ; 
			interoutY <=    interoutY + PP[1] * outAngleX   ;//-    PP[2] *outAngleXSin/100;
			interoutX2 <=  interoutX2 +  JJ[0] * outAngleY  ;//+    JJ[2] *outAngleYSin/100;  //10
			interoutY2 <=   interoutY2 + JJ[1] * outAngleX  ;//-    JJ[2] *outAngleXSin/100;  //-10
			
			interoutZ <=  interoutZ -  PP[0] * outAngleYSin;// + PP[2] * outAngleY ;
			interoutZ2 <= interoutZ2 - JJ[0] * outAngleYSin;// + JJ[2] * outAngleY ;
			
						outX <=    outX;
			outY <=   outY;
			outX2 <=   outX2; 
			outY2 <=   outY2; 
			
			outZ <=  outZ; 
			outZ2 <=  outZ2;
			

end

if(calcbreak == 3)begin
			interoutX <=    interoutX +   PP[2] * outAngleYSin; 
			interoutY <=   interoutY  -  PP[2] * outAngleXSin;
			interoutX2 <=   interoutX2 +   JJ[2] *outAngleYSin;  //10
			interoutY2 <=   interoutY2 - JJ[2] *outAngleXSin;  //-10
			
			interoutZ <=  interoutZ +  PP[2] * outAngleY ;
			interoutZ2 <=  interoutZ2 + JJ[2] * outAngleY ;
			
			outX <=    outX;
			outY <=   outY;
			outX2 <=   outX2; 
			outY2 <=   outY2; 
			
			outZ <=  outZ; 
			outZ2 <=  outZ2;
			

			
end
//final calculation state assigned to output
if(calcbreak == 4)begin
			outX <=    interoutX/100 + PP[0];
			outY <=   interoutY/100 + PP[1];
			outX2 <=   interoutX2/100 + JJ[0]; 
			outY2 <=   interoutY2/100 + JJ[1]; 
			
			outZ <=  interoutZ/100 + PP[2]; 
			outZ2 <=  interoutZ2/100 + PP[2];
			
			interoutX <=   0;
			interoutY <=  0;
			interoutX2 <=  0; 
			interoutY2 <=   0; 
			
			interoutZ <=  0; 
			interoutZ2 <=  0;
end


//state to assign new set of points from the cube to calculate
if(calcbreak == 5)begin


	case(LineNum)

	4'b0000: begin 
			
			PP[0] <= 10;
			PP[1] <= 10;
			PP[2] <= -10;
			
			JJ[0] <= 10;
			JJ[1] <= -10;
			JJ[2] <= -10;
			
			//rotate about Z
			
			/*
			outX <= (  AA[0] * outAngleZ -    AA[1] *outAngleZSin  +   AA[0] * outAngleY  +    AA[2] *outAngleYSin) / 100; 
			outY <= (  AA[0] * outAngleZSin + AA[1] * outAngleZ    +   AA[1] * outAngleX  -    AA[2] *outAngleXSin )/ 100;
			outX2 <= ( BB[0] * outAngleZ -    BB[1] *outAngleZSin  +   BB[0] * outAngleY  +    BB[2] *outAngleYSin) / 100;  //10
			outY2 <= ( BB[0] * outAngleZSin + BB[1] * outAngleZ    +   BB[1] * outAngleX  -    BB[2] *outAngleXSin )/ 100;  //-10
			
			outZ <= ( AA[1] * outAngleXSin + AA[2] * outAngleX  - AA[0] * outAngleYSin + AA[2] * outAngleY )/100;
			outZ2 <= ( BB[1] * outAngleXSin + BB[2] * outAngleX - BB[0] * outAngleYSin + BB[2] * outAngleY )/100;
			*/
			
			//rotate aboutX
			//outY <= (  AA[1] * outAngleX -    AA[2] *outAngleXSin ) / 1000; 
			//outZ <= (  AA[1] * outAngleXSin + AA[2] * outAngleX )/ 1000;
			//outY2 <= ( BB[1] * outAngleX -    BB[2] *outAngleXSin ) / 1000;  //10
			//outZ2 <= ( BB[1] * outAngleXSin + BB[2] * outAngleX )/ 1000;  //-10
			
			//rotate about y
			//outX <= (     AA[0] * outAngleY +    AA[2] *outAngleYSin ) / 1000; 
			//outZ <= ( 0 - AA[0] * outAngleYSin + AA[2] * outAngleY )/ 1000;
			//outX2 <= (    BB[0] * outAngleY +    BB[2] *outAngleYSin ) / 1000;  //10
			//outZ2 <= (0 - BB[0] * outAngleYSin + BB[2] * outAngleY )/ 1000;  //-10
			
		end
		
4'b0001: begin 

			
			PP[0] <= 10;
			PP[1] <= -10;
			PP[2] <= -10;
			
			JJ[0] <= -10;
			JJ[1] <= -10;
			JJ[2] <= -10;
			

			//rotate about Z
			
			/*
			outX <= (  BB[0] * outAngleZ -    BB[1] *outAngleZSin +  BB[0] * outAngleY  +    BB[2] *outAngleYSin ) / 100; //10
			outY <= (  BB[0] * outAngleZSin + BB[1] * outAngleZ   +  BB[1] * outAngleX  -    BB[2] *outAngleXSin)/ 100; //-10
			outX2 <= ( CC[0] * outAngleZ -    CC[1] *outAngleZSin +  CC[0] * outAngleY  +    CC[2] *outAngleYSin ) / 100; //-10
			outY2 <= ( CC[0] * outAngleZSin + CC[1] * outAngleZ   +  CC[1] * outAngleX  -    CC[2] *outAngleXSin )/ 100;  //-10
			
			outZ <= ( BB[1] * outAngleXSin + BB[2] * outAngleX  - BB[0] * outAngleYSin + BB[2] * outAngleY )/100;
			outZ2 <= ( CC[1] * outAngleXSin + CC[2] * outAngleX - CC[0] * outAngleYSin + CC[2] * outAngleY )/100;
			
			*/
			//rotate aboutX
			//outY <= (  BB[1] * outAngleX -    BB[2] *outAngleXSin ) / 1000; 
			//outZ <= (  BB[1] * outAngleXSin + BB[2] * outAngleX )/ 1000;
			//outY2 <= ( CC[1] * outAngleX -    CC[2] *outAngleXSin ) / 1000;  //10
			//outZ2 <= ( CC[1] * outAngleXSin + CC[2] * outAngleX )/ 1000;  //-10
			
			//rotate about y
			//outX <= (     BB[0] * outAngleY +    BB[2] *outAngleYSin ) / 1000; 
			//outZ <= ( 0 - BB[0] * outAngleYSin + BB[2] * outAnglY )/ 1000;
			//outX2 <= (    CC[0] * outAngleY +    CC[2] *outAngleYSin ) / 1000;  //10
			//outZ2 <= (0 - CC[0] * outAngleYSin + CC[2] * outAngleY )/ 1000;  //-10
			end

4'b0010: begin 

			PP[0] <= -10;
			PP[1] <= -10;
			PP[2] <= -10;
			
			JJ[0] <= -10;
			JJ[1] <= 10;
			JJ[2] <= -10;
			//rotate about Z
			//outX  <= ( CC[0] * outAngleZ -    CC[1] *outAngleZSin +  CC[0] * outAngleY +    CC[2] *outAngleYSin) / 100; //-10
			//outY  <= ( CC[0] * outAngleZSin + CC[1] * outAngleZ   +  CC[1] * outAngleX -    CC[2] *outAngleXSin)/ 100;   //-10
			//outX2 <= ( DD[0] * outAngleZ -    DD[1] *outAngleZSin +  DD[0] * outAngleY +    DD[2] *outAngleYSin) / 100;  //-10
			//outY2 <= ( DD[0]  * outAngleZSin + DD[1] * outAngleZ  +  DD[1] * outAngleX -    DD[2] *outAngleXSin )/ 100;    //10
			
			//outZ <= ( CC[1] * outAngleXSin + CC[2] * outAngleX  - CC[0] * outAngleYSin + CC[2] * outAngleY )/100;
			//outZ2 <= ( DD[1] * outAngleXSin + DD[2] * outAngleX - DD[0] * outAngleYSin + DD[2] * outAngleY )/100;
			
			
			//rotate aboutX
			//outY <= (  CC[1] * outAngleX -    CC[2] *outAngleXSin ) / 1000; 
			//outZ <= (  CC[1] * outAngleXSin + CC[2] * outAngleX )/ 1000;
			//outY2 <= ( DD[1] * outAngleX -    DD[2] *outAngleXSin ) / 1000;  //10
			//outZ2 <= ( DD[1] * outAngleXSin + DD[2] * outAngleX )/ 1000;  //-10
			
			//rotate about y
			//outX <= (     CC[0] * outAngleY +    CC[2] *outAngleYSin ) / 1000; 
			//outZ <= ( 0 - CC[0] * outAngleYSin + CC[2] * outAngleY )/ 1000;
			//outX2 <= (    DD[0] * outAngleY +    DD[2] *outAngleYSin ) / 1000;  //10
			//outZ2 <= (0 - DD[0] * outAngleYSin + DD[2] * outAngleY )/ 1000;  //-10
		end
4'b0011: begin 
			PP[0] <= -10;
			PP[1] <= 10;
			PP[2] <= -10;
			
			JJ[0] <= 10;
			JJ[1] <= 10;
			JJ[2] <= -10;

			//rotate about Z
			//outX  <= ( DD[0]  * outAngleZ -    DD[1]  *outAngleZSin +  DD[0] * outAngleY +    DD[2] *outAngleYSin ) / 100; 
			//outY  <= ( DD[0]  * outAngleZSin + DD[1]  * outAngleZ   +  DD[1] * outAngleX -    DD[2] *outAngleXSin)/ 100;
			//outX2 <= ( AA[0] * outAngleZ -     AA[1] *outAngleZSin  +  AA[0] * outAngleY +    AA[2] *outAngleYSin ) / 100; 
			//outY2 <= ( AA[0] * outAngleZSin +  AA[1] * outAngleZ    +  AA[1] * outAngleX -    AA[2] *outAngleXSin)/ 100;
			
			
			//outZ <= ( DD[1] * outAngleXSin + DD[2] * outAngleX  - DD[0] * outAngleYSin + DD[2] * outAngleY )/100;
			//outZ2 <= ( AA[1] * outAngleXSin + AA[2] * outAngleX - AA[0] * outAngleYSin + AA[2] * outAngleY )/100;
			
			//rotate aboutX
			//outY <= (  DD[1] * outAngleX -    DD[2] *outAngleXSin ) / 1000; 
			//outZ <= (  DD[1] * outAngleXSin + DD[2] * outAngleX )/ 1000;
			//outY2 <= ( AA[1] * outAngleX -    AA[2] *outAngleXSin ) / 1000;  //10
			//outZ2 <= ( AA[1] * outAngleXSin + AA[2] * outAngleX )/ 1000;  //-10
			
			//rotate about y
			//outX <= (     DD[0] * outAngleY +    DD[2] *outAngleYSin ) / 1000; 
			//outZ <= ( 0 - DD[0] * outAngleYSin + DD[2] * outAngleY )/ 1000;
			//outX2 <= (    AA[0] * outAngleY +    AA[2] *outAngleYSin ) / 1000;  //10
			//outZ2 <= (0 - AA[0] * outAngleYSin + AA[2] * outAngleY )/ 1000;  //-10
			end
			
			
			
			
			
			

4'b0100: begin 
			PP[0] <= 10;
			PP[1] <= 10;
			PP[2] <= 10;
			
			JJ[0] <= 10;
			JJ[1] <= -10;
			JJ[2] <= 10;

			//rotate about Z
			//outX  <=	( FF[0] * outAngleZ -     FF[1] *outAngleZSin  +  FF[0] * outAngleY +    FF[2] *outAngleYSin ) / 100; 
			//outY  <= ( FF[0] * outAngleZSin +  FF[1] * outAngleZ    +  FF[1] * outAngleX -    FF[2] *outAngleXSin)/ 100;
			//outX2 <= ( EE[0] * outAngleZ -     EE[1] *outAngleZSin  +  EE[0] * outAngleY +    EE[2] *outAngleYSin ) / 100; 
			//outY2 <= ( EE[0] * outAngleZSin +  EE[1] * outAngleZ    +  EE[1] * outAngleX -    EE[2] *outAngleXSin)/ 100;
			
			
			
			//outZ <= 	( FF[1] * outAngleXSin + FF[2] * outAngleX - FF[0] * outAngleYSin + FF[2] * outAngleY )/100;
			//outZ2 <= ( EE[1] * outAngleXSin + EE[2] * outAngleX - EE[0] * outAngleYSin + EE[2] * outAngleY )/100;
		
			//rotate aboutX
			//outY <= (  DD[1] * outAngleX -    DD[2] *outAngleXSin ) / 1000; 
			//outZ <= (  DD[1] * outAngleXSin + DD[2] * outAngleX )/ 1000;
			//outY2 <= ( AA[1] * outAngleX -    AA[2] *outAngleXSin ) / 1000;  //10
			//outZ2 <= ( AA[1] * outAngleXSin + AA[2] * outAngleX )/ 1000;  //-10
			
			//rotate about y
			//outX <= (     DD[0] * outAngleY +    DD[2] *outAngleYSin ) / 1000; 
			//outZ <= ( 0 - DD[0] * outAngleYSin + DD[2] * outAngleY )/ 1000;
			//outX2 <= (    AA[0] * outAngleY +    AA[2] *outAngleYSin ) / 1000;  //10
			//outZ2 <= (0 - AA[0] * outAngleYSin + AA[2] * outAngleY )/ 1000;  //-10
		end


4'b0101: begin 

			PP[0] <= 10;
			PP[1] <= -10;
			PP[2] <= 10;
			
			JJ[0] <= -10;
			JJ[1] <= -10;
			JJ[2] <= 10;

			//rotate about Z
			//outX  <=	( FF[0] * outAngleZ -     FF[1] *outAngleZSin  +  FF[0] * outAngleY +    FF[2] *outAngleYSin ) / 100; 
			//outY  <= ( FF[0] * outAngleZSin +  FF[1] * outAngleZ    +  FF[1] * outAngleX -    FF[2] *outAngleXSin)/ 100;
			//outX2 <= ( GG[0] * outAngleZ -     GG[1] *outAngleZSin  +  GG[0] * outAngleY +    GG[2] *outAngleYSin ) / 100; 
			//outY2 <= ( GG[0] * outAngleZSin +  GG[1] * outAngleZ    +  GG[1] * outAngleX -    GG[2] *outAngleXSin)/ 100;
			
			
			
			//outZ <= 	( FF[1] * outAngleXSin + FF[2] * outAngleX - FF[0] * outAngleYSin + FF[2] * outAngleY )/100;
			//outZ2 <= ( GG[1] * outAngleXSin + GG[2] * outAngleX - GG[0] * outAngleYSin + GG[2] * outAngleY )/100;
		
			//rotate aboutX
			//outY <= (  DD[1] * outAngleX -    DD[2] *outAngleXSin ) / 1000; 
			//outZ <= (  DD[1] * outAngleXSin + DD[2] * outAngleX )/ 1000;
			//outY2 <= ( AA[1] * outAngleX -    AA[2] *outAngleXSin ) / 1000;  //10
			//outZ2 <= ( AA[1] * outAngleXSin + AA[2] * outAngleX )/ 1000;  //-10
			
			//rotate about y
			//outX <= (     DD[0] * outAngleY +    DD[2] *outAngleYSin ) / 1000; 
			//outZ <= ( 0 - DD[0] * outAngleYSin + DD[2] * outAngleY )/ 1000;
			//outX2 <= (    AA[0] * outAngleY +    AA[2] *outAngleYSin ) / 1000;  //10
			//outZ2 <= (0 - AA[0] * outAngleYSin + AA[2] * outAngleY )/ 1000;  //-10
		end
			
	
4'b0110: begin 
			PP[0] <= -10;
			PP[1] <= -10;
			PP[2] <= 10;
			
			JJ[0] <= -10;
			JJ[1] <= 10;
			JJ[2] <= 10;

end

4'b0111: begin 
			PP[0] <= -10;
			PP[1] <= 10;
			PP[2] <= 10;
			
			JJ[0] <= 10;
			JJ[1] <= 10;
			JJ[2] <= 10;

end

4'b1000: begin 
			PP[0] <= 10;
			PP[1] <= 10;
			PP[2] <= 10;
			
			JJ[0] <= 10;
			JJ[1] <= 10;
			JJ[2] <= -10;

end

4'b1001: begin 
			PP[0] <= -10;
			PP[1] <= 10;
			PP[2] <= 10;
			
			JJ[0] <= -10;
			JJ[1] <= 10;
			JJ[2] <= -10;

end

4'b1010: begin 
			PP[0] <= -10;
			PP[1] <= -10;
			PP[2] <= 10;
			
			JJ[0] <= -10;
			JJ[1] <= -10;
			JJ[2] <=-10;

end

4'b1011: begin 
			PP[0] <= 10;
			PP[1] <= -10;
			PP[2] <= 10;
			
			JJ[0] <= 10;
			JJ[1] <= -10;
			JJ[2] <= -10;

end

4'b1100: begin 
				
			PP[0] <= 10;
			PP[1] <= 10;
			PP[2] <= 10;
			
			JJ[0] <= 10;
			JJ[1] <= 10;
			JJ[2] <= -10;

end


endcase


end	



end



endmodule
