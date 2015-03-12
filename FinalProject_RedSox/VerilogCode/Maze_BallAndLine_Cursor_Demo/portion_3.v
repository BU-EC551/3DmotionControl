`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:07 03/25/2014 
// Design Name: 
// Module Name:    portion_3 
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

module portion_3(hcounter, vcounter, enable, x_ball, y_ball, ball_width, stop_right, stop_left, stop_up, stop_down
    );
	 
    input  [10:0] hcounter, vcounter;
	 output        enable;
    input  [10:0] x_ball, y_ball;
    input   [4:0] ball_width;
    output reg    stop_right, stop_left, stop_up, stop_down;


    wire n1, n2, n3, n4, n5, n6, n7 , n8 , n9 , n10 , n11, n12 , n13 , n14 , n15 , n16 , n17 , n18, n19 , n20 , n21 ; 
    assign n1 =  (hcounter >515   && hcounter <525    &&  vcounter >20   && vcounter<79);
	 assign n2 =  (hcounter >548   && hcounter <558    &&  vcounter >46   && vcounter<108);
	 assign n3 =  (hcounter >449   && hcounter <558    &&  vcounter >98   && vcounter<108);
	 assign n4 =  (hcounter >482   && hcounter <492    &&  vcounter >98   && vcounter<158);
	 assign n5 =  (hcounter >449   && hcounter <459    &&  vcounter >98   && vcounter<264);
	 assign n6 =  (hcounter >416   && hcounter <459    &&  vcounter >254  && vcounter<264);
	 assign n7 =  (hcounter >416   && hcounter <426    &&  vcounter >254  && vcounter<332);
	 assign n8 =  (hcounter >317   && hcounter <459    &&  vcounter >322  && vcounter<332);
	 assign n9 =  (hcounter >317   && hcounter <327    &&  vcounter >322  && vcounter<358);
	 assign n10 = (hcounter>294    && hcounter <327    &&  vcounter >348  && vcounter<358);
	 assign n11 = (hcounter>294    && hcounter <304    &&  vcounter >348  && vcounter<384);
	 assign n12 = (hcounter>205    && hcounter <304    &&  vcounter >374  && vcounter<384);
    assign n13 = (hcounter>218    && hcounter <228    &&  vcounter >322  && vcounter<384);
	 assign n14 = (hcounter>152    && hcounter <228    &&  vcounter >322  && vcounter<332);
	 assign n15 = (hcounter>152    && hcounter <162    &&  vcounter >322  && vcounter<410); 
	 assign n16 = (hcounter>152    && hcounter <195    &&  vcounter >400  && vcounter<410);
	 assign n17 = (hcounter>185    && hcounter <195    &&  vcounter >400  && vcounter<428);
	 assign n18 = (hcounter>185    && hcounter <304    &&  vcounter >418  && vcounter<428);
	 assign n19 = (hcounter>218    && hcounter <228    &&  vcounter >285  && vcounter<306); //new
	 assign n20 = (hcounter>218    && hcounter <261    &&  vcounter >296  && vcounter<306);//new
	 assign n21 = (hcounter>251    && hcounter <261    &&  vcounter >296 && vcounter<355); //new
	 assign enable = n1||n2||n3||n4||n5||n6|| n7||n8||n9||n10||n11||n12||n13||n14||n15||n16||n17||n18|| n19 ||n20 ||n21;

// Collision detection
     reg collision;
     always @(x_ball, y_ball, ball_width)
     begin
        stop_right = 0;
        stop_left  = 0;
        stop_up    = 0;
        stop_down  = 0;
        
   if (((x_ball+ball_width == 515) && (y_ball >20-ball_width   && y_ball<79-1)) || //n1
	    ((x_ball+ball_width == 548) && (y_ball >46-ball_width   && y_ball<108-1)) || //n2
	    ((x_ball+ball_width == 449) && (y_ball >98-ball_width   && y_ball<108-1)) || //n3
	    ((x_ball+ball_width == 482) && (y_ball >98-ball_width   && y_ball<158-1)) || //n4
	    ((x_ball+ball_width == 449) && (y_ball >98-ball_width   && y_ball<264-1)) || //n5
	    ((x_ball+ball_width == 416) && (y_ball >254-ball_width  && y_ball<264-1)) || //n6 
	    ((x_ball+ball_width == 416) && (y_ball >254-ball_width  && y_ball<332-1)) || //n7
	    ((x_ball+ball_width == 317) && (y_ball >322-ball_width  && y_ball<332-1)) || //n8
	    ((x_ball+ball_width == 317) && (y_ball >322-ball_width  && y_ball<358-1)) || //n9
	    ((x_ball+ball_width == 294) && (y_ball >348-ball_width  && y_ball<358-1)) || //n10
	    ((x_ball+ball_width == 294) && (y_ball >348-ball_width  && y_ball<384-1)) || //n11
	    ((x_ball+ball_width == 205) && (y_ball >374-ball_width  && y_ball<384-1)) || //n12
	    ((x_ball+ball_width == 218) && (y_ball >322-ball_width  && y_ball<384-1)) || //n13
	    ((x_ball+ball_width == 152) && (y_ball >322-ball_width  && y_ball<332-1)) || //n14
	    ((x_ball+ball_width == 152) && (y_ball >322-ball_width  && y_ball<410-1)) || //n15
	    ((x_ball+ball_width == 152) && (y_ball >400-ball_width  && y_ball<410-1)) || //n16
	    ((x_ball+ball_width == 185) && (y_ball >400-ball_width  && y_ball<428-1)) || //n17
		 ((x_ball+ball_width == 185) && (y_ball >418-ball_width  && y_ball<428-1)) || //n15
	    ((x_ball+ball_width == 218) && (y_ball >285-ball_width  && y_ball<306-1)) || //n16
	    ((x_ball+ball_width == 218) && (y_ball >296-ball_width  && y_ball<306-1)) ||
       ((x_ball+ball_width == 251) && (y_ball >296-ball_width  && y_ball<355-1)))  //n18
		  begin
           stop_right = 1;
        end
		  
        if (((x_ball == 525-1) && (y_ball >20-ball_width  && y_ball<79-1)) || //n1
	    ((x_ball == 558-1) && (y_ball >46-ball_width  && y_ball<108-1)) || //n2
	    ((x_ball == 558-1) && (y_ball >98-ball_width  && y_ball<108-1)) || //n3
	    ((x_ball == 492-1) && (y_ball >98-ball_width  && y_ball<158-1)) || //n4
	    ((x_ball == 459-1) && (y_ball >98-ball_width  && y_ball<264-1)) || //n5
	    ((x_ball == 459-1) && (y_ball >254-ball_width  && y_ball<264-1)) || //n6 
	    ((x_ball == 426-1) && (y_ball >254-ball_width  && y_ball<332-1)) || //n7
	    ((x_ball == 459-1) && (y_ball >322-ball_width  && y_ball<332-1)) || //n8
	    ((x_ball == 327-1) && (y_ball >322-ball_width  && y_ball<358-1)) || //n9
	    ((x_ball == 327-1) && (y_ball >348-ball_width  && y_ball<358-1)) || //n10
	    ((x_ball == 304-1) && (y_ball >348-ball_width  && y_ball<384-1)) || //n11
	    ((x_ball == 304-1) && (y_ball >374-ball_width  && y_ball<384-1)) || //n12
	    ((x_ball == 228-1) && (y_ball >322-ball_width  && y_ball<384-1)) || //n13
	    ((x_ball == 228-1) && (y_ball >322-ball_width  && y_ball<332-1)) || //n14
	    ((x_ball == 162-1) && (y_ball >322-ball_width  && y_ball<410-1)) || //n15
	    ((x_ball == 195-1) && (y_ball >400-ball_width  && y_ball<410-1)) || //n16
	    ((x_ball == 195-1) && (y_ball >400-ball_width  && y_ball<428-1)) || //n17
		 ((x_ball == 304-1) && (y_ball >418-ball_width  && y_ball<428-1)) || //n14
	    ((x_ball == 228-1) && (y_ball >285-ball_width  && y_ball<306-1)) || //n15
	    ((x_ball == 261-1) && (y_ball >296-ball_width  && y_ball<306-1)) || //n16
       ((x_ball == 261-1)  && (y_ball >296-ball_width  && y_ball<355-1)))  //n18
			begin
           stop_left = 1;
        end
if (((y_ball+ball_width == 20) && (x_ball >515-ball_width  && x_ball<525-1)) || //n1
	((y_ball+ball_width == 46)  && (x_ball >548-ball_width  && x_ball<558-1)) || //n2
	((y_ball+ball_width == 98)  && (x_ball >449-ball_width  && x_ball<558-1)) || //n3
	((y_ball+ball_width == 98)  && (x_ball >482-ball_width  && x_ball<492-1)) || //n4
	((y_ball+ball_width == 98)  && (x_ball >449-ball_width  && x_ball<459-1)) || //n5
	((y_ball+ball_width == 254) && (x_ball >416-ball_width  && x_ball<459-1)) || //n6
	((y_ball+ball_width == 254) && (x_ball >416-ball_width  && x_ball<426-1)) || //n7
	((y_ball+ball_width == 322) && (x_ball >317-ball_width  && x_ball<459-1)) || //n8
	((y_ball+ball_width == 322) && (x_ball >317-ball_width  && x_ball<327-1)) || //n9
	((y_ball+ball_width == 348) && (x_ball >294-ball_width  && x_ball<327-1)) || //n10
	((y_ball+ball_width == 348) && (x_ball >294-ball_width  && x_ball<304-1)) || //n11
	((y_ball+ball_width == 374) && (x_ball >205-ball_width  && x_ball<304-1)) || //n12
	((y_ball+ball_width == 322) && (x_ball >218-ball_width  && x_ball<228-1)) || //n13
	((y_ball+ball_width == 322) && (x_ball >152-ball_width  && x_ball<228-1)) || //n14
	((y_ball+ball_width == 322) && (x_ball >152-ball_width  && x_ball<162-1)) || //n15
	((y_ball+ball_width == 400) && (x_ball >152-ball_width  && x_ball<195-1)) || //n16
	((y_ball+ball_width == 400) && (x_ball >185-ball_width  && x_ball<195-1)) || //n17
	((y_ball+ball_width == 418) && (x_ball >185-ball_width  && x_ball<304-1)) || //n14
	((y_ball+ball_width == 285) && (x_ball >218-ball_width  && x_ball<228-1)) || //n15
	((y_ball+ball_width == 296) && (x_ball >218-ball_width  && x_ball<261-1)) || //n16
   ((y_ball+ball_width == 296) && (x_ball >251-ball_width  && x_ball<261-1))) //n18
	begin
           stop_down = 1;
        end
		  
if (((y_ball == 79-1) && (x_ball >515-ball_width  && x_ball<525-1)) || //n1
	((y_ball == 108-1) && (x_ball >548-ball_width  && x_ball<558-1)) || //n2
	((y_ball == 108-1) && (x_ball >449-ball_width  && x_ball<558-1)) || //n3
	((y_ball == 158-1) && (x_ball >482-ball_width  && x_ball<492-1)) || //n4
	((y_ball == 264-1) && (x_ball >449-ball_width  && x_ball<459-1)) || //n5
	((y_ball == 264-1) && (x_ball >416-ball_width  && x_ball<459-1)) || //n6
	((y_ball == 332-1) && (x_ball >416-ball_width  && x_ball<426-1)) || //n7
	((y_ball == 332-1) && (x_ball >317-ball_width  && x_ball<459-1)) || //n8
	((y_ball == 358-1) && (x_ball >317-ball_width  && x_ball<327-1)) || //n9
	((y_ball == 358-1) && (x_ball >294-ball_width  && x_ball<327-1)) || //n10
	((y_ball == 384-1) && (x_ball >294-ball_width  && x_ball<304-1)) || //n11
	((y_ball == 384-1) && (x_ball >205-ball_width  && x_ball<304-1)) || //n12
	((y_ball == 384-1) && (x_ball >218-ball_width  && x_ball<228-1)) || //n13
	((y_ball == 332-1) && (x_ball >152-ball_width  && x_ball<228-1)) || //n14
	((y_ball == 410-1) && (x_ball >152-ball_width  && x_ball<162-1)) || //n15
	((y_ball == 410-1) && (x_ball >152-ball_width  && x_ball<195-1)) || //n16
	((y_ball == 428-1) && (x_ball >185-ball_width  && x_ball<195-1)) || //n17
	((y_ball == 428-1) && (x_ball >185-ball_width  && x_ball<304-1)) || //n13
	((y_ball == 306-1) && (x_ball >218-ball_width  && x_ball<228-1)) || //n14
	((y_ball == 306-1) && (x_ball >218-ball_width  && x_ball<261-1)) || //n15
   ((y_ball == 355-1) && (x_ball >251-ball_width  && x_ball<261-1))) //n18
	begin
           stop_up = 1;
        end
     end
endmodule
