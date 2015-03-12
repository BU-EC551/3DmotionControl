`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:02:56 04/17/2014 
// Design Name: 
// Module Name:    Cos2 
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
module Cos2( degreesX,degreesY,degreesZ,outX,outY,outZ);

	 
input [9:0] degreesX,degreesY,degreesZ;
output [7:0] outX,outY,outZ;

wire [9:0] degreesX,degreesY,degreesZ;
wire [7:0] cos [0:360];

//beginning of table assignments
assign cos[0] = 100;//0;
assign cos[1] = 99;//9;//;
assign cos[2] = 99;//9;
assign cos[3] = 99;//8;//;
assign cos[4] = 99;//7;
assign cos[5] = 99;//6;
assign cos[6] = 99;//4;
assign cos[7] = 99;//2;
assign cos[8] = 99;//0;
assign cos[9] = 98;//7;

assign cos[10] = 98;//4;
assign cos[11] = 98;//1;
assign cos[12] = 97;//8;
assign cos[13] = 97;//4;
assign cos[14] = 97;//0;
assign cos[15] = 96;//5;
assign cos[16] = 96;//1;
assign cos[17] = 95;//6;
assign cos[18] = 95;//1;
assign cos[19] = 94;//5;

assign cos[20] = 93;//9;
assign cos[21] = 93;//3;
assign cos[22] = 92;//7;
assign cos[23] = 92;//0;
assign cos[24] = 91;//3;
assign cos[25] = 90;//6;
assign cos[26] = 89;//8;
assign cos[27] = 89;//1;
assign cos[28] = 88;//2;
assign cos[29] = 87;//4;

assign cos[30] = 86;//6;
assign cos[31] = 85;//7;
assign cos[32] = 84;//8;
assign cos[33] = 83;//8;
assign cos[34] = 82;//9;
assign cos[35] = 81;//9;
assign cos[36] = 80;//9;
assign cos[37] = 79;//8;
assign cos[38] = 78;//8;
assign cos[39] = 77;//7;


assign cos[40] = 76;//6;
assign cos[41] = 75;//4;
assign cos[42] = 74;//3;
assign cos[43] = 73;//1;
assign cos[44] = 71;//9;
assign cos[45] = 70;//7;
assign cos[46] = 69;//4;
assign cos[47] = 68;//2;
assign cos[48] = 66;//9;
assign cos[49] = 65;//6;

assign cos[50] = 64;//2;
assign cos[51] = 62;//9;
assign cos[52] = 61;//5;
assign cos[53] = 60;//1;
assign cos[54] = 58;//7;
assign cos[55] = 57;//3;
assign cos[56] = 55;//9;
assign cos[57] = 54;//4;
assign cos[58] = 52;//9;
assign cos[59] = 51;//5;

assign cos[60] = 50;//0;
assign cos[61] = 48;//4;
assign cos[62] = 46;//9;
assign cos[63] = 45;//4;
assign cos[64] = 43;//8;
assign cos[65] = 42;//2;
assign cos[66] = 40;//6;
assign cos[67] = 39;//0;
assign cos[68] = 37;//4;
assign cos[69] = 35;//8;


assign cos[70] = 34;//2;
assign cos[71] = 32;//5;
assign cos[72] = 30;//9;
assign cos[73] = 29;//2;
assign cos[74] = 27;//5;
assign cos[75] = 25;//8;
assign cos[76] = 23;//1;
assign cos[77] = 22;//4;
assign cos[78] = 20;//7;
assign cos[79] = 19;//0;

assign cos[80] = 17;//3;
assign cos[81] = 15;//6;
assign cos[82] = 13;//9;
assign cos[83] = 12;//1;
assign cos[84] = 10;//4;
assign cos[85] = 8;//7;
assign cos[86] = 6;//9;
assign cos[87] = 5;//2;
assign cos[88] = 3;//4;
assign cos[89] = 1;//7;

assign cos[90] = 0;

assign cos[91] = -1;
assign cos[92] = -3;
assign cos[93] = -5;
assign cos[94] = -6;
assign cos[95] = -8;
assign cos[96] = -10;
assign cos[97] = -12;
assign cos[98] = -13;
assign cos[99] = -15;

assign cos[100] = -17;
assign cos[101] = -19;
assign cos[102] = -20;
assign cos[103] = -22;
assign cos[104] = -23;
assign cos[105] = -25;
assign cos[106] = -27;
assign cos[107] = -29;
assign cos[108] = -30;
assign cos[109] = -32;

assign cos[110] = -34;
assign cos[111] = -35;
assign cos[112] = -37;
assign cos[113] = -39;
assign cos[114] = -40;
assign cos[115] = -42;
assign cos[116] = -43;
assign cos[117] = -45;
assign cos[118] = -46;
assign cos[119] = -48;

assign cos[120] = -50;
assign cos[121] = -51;
assign cos[122] = -52;
assign cos[123] = -54;
assign cos[124] = -55;
assign cos[125] = -57;
assign cos[126] = -58;
assign cos[127] = -60;
assign cos[128] = -61;
assign cos[129] = -62;


assign cos[130] = -64;
assign cos[131] = -65;
assign cos[132] = -66;
assign cos[133] = -68;
assign cos[134] = -69;
assign cos[135] = -70;
assign cos[136] = -71;
assign cos[137] = -73;
assign cos[138] = -74;
assign cos[139] = -75;

assign cos[140] = -76;
assign cos[141] = -77;
assign cos[142] = -78;
assign cos[143] = -79;
assign cos[144] = -80;
assign cos[145] = -81;
assign cos[146] = -82;
assign cos[147] = -83;
assign cos[148] = -84;
assign cos[149] = -85;

assign cos[150] = -86;
assign cos[151] = -87;
assign cos[152] = -88;
assign cos[153] = -89;
assign cos[154] = -89;
assign cos[155] = -90;
assign cos[156] = -91;
assign cos[157] = -92;
assign cos[158] = -92;
assign cos[159] = -93;

assign cos[160] = -93;
assign cos[161] = -94;
assign cos[162] = -95;
assign cos[163] = -95;
assign cos[164] = -96;
assign cos[165] = -96;
assign cos[166] = -97;
assign cos[167] = -97;
assign cos[168] = -97;
assign cos[169] = -98;

assign cos[170] = -98;
assign cos[171] = -98;
assign cos[172] = -99;
assign cos[173] = -99;
assign cos[174] = -99;
assign cos[175] = -99;
assign cos[176] = -99;
assign cos[177] = -99;
assign cos[178] = -99;
assign cos[179] = -99;

assign cos[180] = -100;


assign cos[181] = -99;
assign cos[182] = -99;
assign cos[183] = -99;
assign cos[184] = -99;
assign cos[185] = -99;
assign cos[186] = -99;
assign cos[187] = -99;
assign cos[188] = -99;
assign cos[189] = -98;

assign cos[190] = -98;
assign cos[191] = -98;
assign cos[192] = -97;
assign cos[193] = -97;
assign cos[194] = -97;
assign cos[195] = -96;
assign cos[196] = -96;
assign cos[197] = -95;
assign cos[198] = -95;
assign cos[199] = -94;

assign cos[200] = -93;
assign cos[201] = -93;
assign cos[202] = -92;
assign cos[203] = -92;
assign cos[204] = -91;
assign cos[205] = -90;
assign cos[206] = -89;
assign cos[207] = -89;
assign cos[208] = -88;
assign cos[209] = -87;

assign cos[210] = -86;
assign cos[211] = -85;
assign cos[212] = -84;
assign cos[213] = -83;
assign cos[214] = -82;
assign cos[215] = -81;
assign cos[216] = -80;
assign cos[217] = -79;
assign cos[218] = -78;
assign cos[219] = -77;


assign cos[220] = -76;
assign cos[221] = -75;
assign cos[222] = -74;
assign cos[223] = -73;
assign cos[224] = -71;
assign cos[225] = -70;
assign cos[226] = -69;
assign cos[227] = -68;
assign cos[228] = -66;
assign cos[229] = -65;

assign cos[230] = -64;
assign cos[231] = -62;
assign cos[232] = -61;
assign cos[233] = -60;
assign cos[234] = -58;
assign cos[235] = -57;
assign cos[236] = -55;
assign cos[237] = -54;
assign cos[238] = -52;
assign cos[239] = -51;

assign cos[240] = -50;
assign cos[241] = -48;
assign cos[242] = -46;
assign cos[243] = -45;
assign cos[244] = -43;
assign cos[245] = -42;
assign cos[246] = -40;
assign cos[247] = -39;
assign cos[248] = -37;
assign cos[249] = -35;


assign cos[250] = -34;
assign cos[251] = -32;
assign cos[252] = -30;
assign cos[253] = -29;
assign cos[254] = -27;
assign cos[255] = -25;
assign cos[256] = -23;
assign cos[257] = -22;
assign cos[258] = -20;
assign cos[259] = -19;

assign cos[260] = -17;
assign cos[261] = -15;
assign cos[262] = -13;
assign cos[263] = -12;
assign cos[264] = -10;
assign cos[265] = -8;
assign cos[266] = -6;
assign cos[267] = -5;
assign cos[268] = -3;
assign cos[269] = -1;

assign cos[270] = 0;

assign cos[271] = 1;
assign cos[272] = 3;
assign cos[273] = 5;
assign cos[274] = 6;
assign cos[275] = 8;
assign cos[276] = 10;
assign cos[277] = 12;
assign cos[278] = 13;
assign cos[279] = 15;

assign cos[280] = 17;
assign cos[281] = 19;
assign cos[282] = 20;
assign cos[283] = 22;
assign cos[284] = 23;
assign cos[285] = 25;
assign cos[286] = 27;
assign cos[287] = 29;
assign cos[288] = 30;
assign cos[289] = 32;

assign cos[290] = 34;
assign cos[291] = 35;
assign cos[292] = 37;
assign cos[293] = 39;
assign cos[294] = 40;
assign cos[295] = 42;
assign cos[296] = 43;
assign cos[297] = 45;
assign cos[298] = 46;
assign cos[299] = 48;

assign cos[300] = 50;
assign cos[301] = 51;
assign cos[302] = 52;
assign cos[303] = 54;
assign cos[304] = 55;
assign cos[305] = 57;
assign cos[306] = 58;
assign cos[307] = 60;
assign cos[308] = 61;
assign cos[309] = 62;


assign cos[310] = 64;
assign cos[311] = 65;
assign cos[312] = 66;
assign cos[313] = 68;
assign cos[314] = 69;
assign cos[315] = 70;
assign cos[316] = 71;
assign cos[317] = 73;
assign cos[318] = 74;
assign cos[319] = 75;

assign cos[320] = 76;
assign cos[321] = 77;
assign cos[322] = 78;
assign cos[323] = 79;
assign cos[324] = 80;
assign cos[325] = 81;
assign cos[326] = 82;
assign cos[327] = 83;
assign cos[328] = 84;
assign cos[329] = 85;

assign cos[330] = 86;
assign cos[331] = 87;
assign cos[332] = 88;
assign cos[333] = 89;
assign cos[334] = 89;
assign cos[335] = 90;
assign cos[336] = 91;
assign cos[337] = 92;
assign cos[338] = 92;
assign cos[339] = 93;

assign cos[340] = 93;
assign cos[341] = 94;
assign cos[342] = 95;
assign cos[343] = 95;
assign cos[344] = 96;
assign cos[345] = 96;
assign cos[346] = 97;
assign cos[347] = 97;
assign cos[348] = 97;
assign cos[349] = 98;

assign cos[350] = 98;
assign cos[351] = 98;
assign cos[352] = 99;
assign cos[353] = 99;
assign cos[354] = 99;
assign cos[355] = 99;
assign cos[356] = 99;
assign cos[357] = 99;
assign cos[358] = 99;
assign cos[359] = 99;

assign cos[360] = 100;




//assignment of output based on variable input
assign outX = cos[degreesX];
assign outY = cos[degreesY];
assign outZ = cos[degreesZ];




endmodule
