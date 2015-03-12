`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:33 04/01/2014 
// Design Name: 
// Module Name:    Sine2 
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
module Sine2(degreesX,degreesY,degreesZ,outX,outY,outZ);

	 
input [9:0] degreesX,degreesY,degreesZ;
output [7:0] outX,outY,outZ;


wire [9:0] degreesX,degreesY,degreesZ;
wire [7:0] cos [0:360];


//look up table assignment
assign cos[0] = 0;

assign cos[1] = 1;//7;
assign cos[2] = 3;//4;
assign cos[3] = 5;//2;
assign cos[4] = 6;//9;
assign cos[5] = 8;//7;
assign cos[6] = 10;//4;
assign cos[7] = 12;//1;
assign cos[8] = 13;//9;
assign cos[9] = 15;//6;

assign cos[10] = 17;//3;
assign cos[11] = 19;//0;
assign cos[12] = 20;//7;
assign cos[13] = 22;//4;
assign cos[14] = 23;//1;
assign cos[15] = 25;//8;
assign cos[16] = 27;//5;
assign cos[17] = 29;//2;
assign cos[18] = 30;//9;
assign cos[19] = 32;//5;

assign cos[20] = 34;//2;
assign cos[21] = 35;//8;
assign cos[22] = 37;//4;
assign cos[23] = 39;//0;
assign cos[24] = 40;//6;
assign cos[25] = 42;//2;
assign cos[26] = 43;//8;
assign cos[27] = 45;//4;
assign cos[28] = 46;//9;
assign cos[29] = 48;//4;

assign cos[30] = 50;//0;
assign cos[31] = 51;//5;
assign cos[32] = 52;//9;
assign cos[33] = 54;//4;
assign cos[34] = 55;//9;
assign cos[35] = 57;//3;
assign cos[36] = 58;//7;
assign cos[37] = 60;//1;
assign cos[38] = 61;//5;
assign cos[39] = 62;//9;


assign cos[40] = 64;//2;
assign cos[41] = 65;//6;
assign cos[42] = 66;//9;
assign cos[43] = 68;//2;
assign cos[44] = 69;//4;
assign cos[45] = 70;//7;
assign cos[46] = 71;//9;
assign cos[47] = 73;//1;
assign cos[48] = 74;//3;
assign cos[49] = 75;//4;

assign cos[50] = 76;//6;
assign cos[51] = 77;//7;
assign cos[52] = 78;//8;
assign cos[53] = 79;//8;
assign cos[54] = 80;//9;
assign cos[55] = 81;//9;
assign cos[56] = 82;//9;
assign cos[57] = 83;//8;
assign cos[58] = 84;//8;
assign cos[59] = 85;//7;

assign cos[60] = 86;//6;
assign cos[61] = 87;//4;
assign cos[62] = 88;//2;
assign cos[63] = 89;//1;
assign cos[64] = 89;//8;
assign cos[65] = 90;//6;
assign cos[66] = 91;//3;
assign cos[67] = 92;//0;
assign cos[68] = 92;//7;
assign cos[69] = 93;//3;

assign cos[70] = 93;//9;
assign cos[71] = 94;//5;
assign cos[72] = 95;//1;
assign cos[73] = 95;//6;
assign cos[74] = 96;//1;
assign cos[75] = 96;//5;
assign cos[76] = 97;//0;
assign cos[77] = 97;//4;
assign cos[78] = 97;//8;
assign cos[79] = 98;//1;

assign cos[80] = 98;//4;
assign cos[81] = 98;//7;
assign cos[82] = 99;//0;
assign cos[83] = 99;//2;
assign cos[84] = 99;//4;
assign cos[85] = 99;//6;
assign cos[86] = 99;//7;
assign cos[87] = 99;//8;
assign cos[88] = 99;//9;
assign cos[89] = 99;//9;

assign cos[90] = 100;//0;


assign cos[91] = 99;//9;
assign cos[92] = 99;//9;
assign cos[93] = 99;//8;
assign cos[94] = 99;//7;
assign cos[95] = 99;//6;
assign cos[96] = 99;//4;
assign cos[97] = 99;//2;
assign cos[98] = 99;//0;
assign cos[99] = 98;//7;
assign cos[100] = 98;


assign cos[101] = 98;
assign cos[102] = 97;
assign cos[103] = 97;
assign cos[104] = 97;
assign cos[105] = 96;
assign cos[106] = 96;
assign cos[107] = 95;
assign cos[108] = 95;
assign cos[109] = 94;
assign cos[110] = 93;

assign cos[111] = 93;
assign cos[112] = 93;
assign cos[113] = 92;
assign cos[114] = 92;
assign cos[115] = 91;
assign cos[116] = 90;
assign cos[117] = 89;
assign cos[118] = 89;
assign cos[119] = 88;

assign cos[120] = 87;
assign cos[121] = 86;
assign cos[122] = 85;
assign cos[123] = 84;
assign cos[124] = 83;
assign cos[125] = 82;
assign cos[126] = 81;
assign cos[127] = 80;
assign cos[128] = 79;
assign cos[129] = 78;


assign cos[130] = 77;
assign cos[131] = 76;
assign cos[132] = 75;
assign cos[133] = 74;
assign cos[134] = 73;
assign cos[135] = 71;
assign cos[136] = 70;
assign cos[137] = 69;
assign cos[138] = 68;
assign cos[139] = 66;

assign cos[140] = 65;
assign cos[141] = 64;
assign cos[142] = 62;
assign cos[143] = 61;
assign cos[144] = 60;
assign cos[145] = 58;
assign cos[146] = 57;
assign cos[147] = 55;
assign cos[148] = 54;
assign cos[149] = 52;

assign cos[150] = 50;
assign cos[151] = 48;
assign cos[152] = 46;
assign cos[153] = 45;
assign cos[154] = 43;
assign cos[155] = 42;
assign cos[156] = 40;
assign cos[157] = 39;
assign cos[158] = 37;
assign cos[159] = 35;

assign cos[160] = 34;
assign cos[161] = 32;
assign cos[162] = 30;
assign cos[163] = 29;
assign cos[164] = 27;
assign cos[165] = 25;
assign cos[166] = 24;
assign cos[167] = 22;
assign cos[168] = 20;
assign cos[169] = 19;

assign cos[170] = 17;
assign cos[171] = 15;
assign cos[172] = 13;
assign cos[173] = 12;
assign cos[174] = 10;
assign cos[175] = 8;
assign cos[176] = 6;
assign cos[177] = 5;
assign cos[178] = 3;
assign cos[179] = 1;

assign cos[180] = 0;

assign cos[181] = -1;//7;
assign cos[182] = -3;//4;
assign cos[183] = -5;//2;
assign cos[184] = -6;//9;
assign cos[185] = -8;//7;
assign cos[186] = -10;//4;
assign cos[187] = -12;//1;
assign cos[188] = -13;//9;
assign cos[189] = -15;//6;

assign cos[190] = -17;//3;
assign cos[191] = -19;//0;
assign cos[192] = -20;//7;
assign cos[193] = -22;//4;
assign cos[194] = -23;//1;
assign cos[195] = -25;//8;
assign cos[196] = -27;//5;
assign cos[197] = -29;//2;
assign cos[198] = -30;//9;
assign cos[199] = -32;//5;

assign cos[200] = -34;//2;
assign cos[201] = -35;//8;
assign cos[202] = -37;//4;
assign cos[203] = -39;//0;
assign cos[204] = -40;//6;
assign cos[205] = -42;//2;
assign cos[206] = -43;//8;
//assign cos[207] = -45;//4;
assign cos[208] = -46;//9;
assign cos[209] = -48;//4;

assign cos[210] = -50;//0;
assign cos[211] = -51;//5;
assign cos[212] = -52;//9;
assign cos[213] = -54;//4;
assign cos[214] = -55;//9;
assign cos[215] = -57;//3;
assign cos[216] = -58;//7;
assign cos[217] = -60;//1;
assign cos[218] = -61;//5;
assign cos[219] = -62;//9;


assign cos[220] = -64;//2;
assign cos[221] = -65;//6;
assign cos[222] = -66;//9;
assign cos[223] = -68;//2;
assign cos[224] = -69;//4;
assign cos[225] = -70;//7;
assign cos[226] = -71;//9;
assign cos[227] = -73;//1;
assign cos[228] = -74;//3;
assign cos[229] = -75;//4;

assign cos[230] = -76;//6;
assign cos[231] = -77;//7;
assign cos[232] = -78;//8;
assign cos[233] = -79;//8;
assign cos[234] = -80;//9;
assign cos[235] = -81;//9;
assign cos[236] = -82;//9;
assign cos[237] = -83;//8;
assign cos[238] = -84;//8;
assign cos[239] = -85;//7;

assign cos[240] = -86;//6;
assign cos[241] = -87;//4;
assign cos[242] = -88;//2;
assign cos[243] = -89;//1;
assign cos[244] = -89;//8;
assign cos[245] = -90;//6;
assign cos[246] = -91;//3;
assign cos[247] = -92;//0;
assign cos[248] = -92;//7;
assign cos[249] = -93;//3;

assign cos[250] = -93;//9;
assign cos[251] = -94;//5;
assign cos[252] = -95;//1;
assign cos[253] = -95;//6;
assign cos[254] = -96;//1;
assign cos[255] = -96;//5;
assign cos[256] = -97;//0;
assign cos[257] = -97;//4;
assign cos[258] = -97;//8;
assign cos[259] = -98;//1;

assign cos[260] = -98;//4;
assign cos[261] = -98;//7;
assign cos[262] = -99;//0;
assign cos[263] = -99;//2;
assign cos[264] = -99;//4;
assign cos[265] = -99;//6;
assign cos[266] = -99;//7;
assign cos[267] = -99;//8;
assign cos[268] = -99;//9;
assign cos[269] = -99;//9;

assign cos[270] = -100;//0;


assign cos[271] = -99;//9;
assign cos[272] = -99;//9;
assign cos[273] = -99;//8;
assign cos[274] = -99;//7;
assign cos[275] = -99;//6;
assign cos[276] = -99;//4;
assign cos[277] = -99;//2;
assign cos[278] = -99;//0;
assign cos[279] = -98;//7;
assign cos[280] = -98;


assign cos[281] = -98;
assign cos[282] = -97;
assign cos[283] = -97;
assign cos[284] = -97;
assign cos[285] = -96;
assign cos[286] = -96;
assign cos[287] = -95;
assign cos[288] = -95;
assign cos[289] = -94;
assign cos[290] = -93;

assign cos[291] = -93;
assign cos[292] = -93;
assign cos[293] =  -92;
assign cos[294] = -92;
assign cos[295] = -91;
assign cos[296] = -90;
assign cos[297] = -89;
assign cos[298] = -89;
assign cos[299] = -88;

assign cos[300] = -87;
assign cos[301] = -86;
assign cos[302] = -85;
assign cos[303] = -84;
assign cos[304] = -83;
assign cos[305] = -82;
assign cos[306] = -81;
assign cos[307] = -80;
assign cos[308] = -79;
assign cos[309] = -78;


assign cos[310] = -77;
assign cos[311] = -76;
assign cos[312] = -75;
assign cos[313] = -74;
assign cos[314] = -73;
assign cos[315] = -71;
assign cos[316] = -70;
assign cos[317] = -69;
assign cos[318] = -68;
assign cos[319] = -66;

assign cos[320] = -65;
assign cos[321] = -64;
assign cos[322] = -62;
assign cos[323] = -61;
assign cos[324] = -60;
assign cos[325] = -58;
assign cos[326] = -57;
assign cos[327] = -55;
assign cos[328] = -54;
assign cos[329] = -52;

assign cos[330] = -50;
assign cos[331] = -48;
assign cos[332] = -46;
//assign cos[153] = -45;
assign cos[334] = -43;
assign cos[335] = -42;
assign cos[336] = -40;
assign cos[337] = -39;
assign cos[338] = -37;
assign cos[339] = -35;

assign cos[340] = -34;
assign cos[341] = -32;
assign cos[342] = -30;
assign cos[343] = -29;
assign cos[344] = -27;
assign cos[345] = -25;
assign cos[346] = -24;
assign cos[347] = -22;
assign cos[348] = -20;
assign cos[349] = -19;

assign cos[350] = -17;
assign cos[351] = -15;
assign cos[352] = -13;
assign cos[353] = -12;
assign cos[354] = -10;
assign cos[355] = -8;
assign cos[356] = -6;
assign cos[357] = -5;
assign cos[358] = -3;
assign cos[359] = -1;

assign cos[360] = 0;


//assign outputs to variable inputs
assign outX = cos[degreesX];
assign outY = cos[degreesY];
assign outZ = cos[degreesZ];






endmodule
