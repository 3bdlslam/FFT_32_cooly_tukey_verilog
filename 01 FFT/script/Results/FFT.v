`timescale 1ns / 1ps

module FFT
(input [255:0] Xn_vect_real,Xn_vect_imag,
input clk1,clk2,rst,
output [255:0] Xk_vect_real,Xk_vect_imag);

wire signed [3:-4] X0 [0:31][0:1];
wire signed [3:-4] MAC_out [0:0][0:1][0:1];
reg  signed [3:-4] MAC_in  [0:0][0:2][0:1];
reg  signed [3:-4] X_reg [0:5][0:31][0:1];
reg  [6:0] Sel;
reg  signed [3:-4] MAC_out_reg [0:4][0:31][0:1];

assign X0[0][0]=Xn_vect_real[255:248];
assign X0[0][1]=Xn_vect_imag[255:248];
assign X0[1][0]=Xn_vect_real[127:120];
assign X0[1][1]=Xn_vect_imag[127:120];
assign X0[2][0]=Xn_vect_real[191:184];
assign X0[2][1]=Xn_vect_imag[191:184];
assign X0[3][0]=Xn_vect_real[63:56];
assign X0[3][1]=Xn_vect_imag[63:56];
assign X0[4][0]=Xn_vect_real[223:216];
assign X0[4][1]=Xn_vect_imag[223:216];
assign X0[5][0]=Xn_vect_real[95:88];
assign X0[5][1]=Xn_vect_imag[95:88];
assign X0[6][0]=Xn_vect_real[159:152];
assign X0[6][1]=Xn_vect_imag[159:152];
assign X0[7][0]=Xn_vect_real[31:24];
assign X0[7][1]=Xn_vect_imag[31:24];
assign X0[8][0]=Xn_vect_real[239:232];
assign X0[8][1]=Xn_vect_imag[239:232];
assign X0[9][0]=Xn_vect_real[111:104];
assign X0[9][1]=Xn_vect_imag[111:104];
assign X0[10][0]=Xn_vect_real[175:168];
assign X0[10][1]=Xn_vect_imag[175:168];
assign X0[11][0]=Xn_vect_real[47:40];
assign X0[11][1]=Xn_vect_imag[47:40];
assign X0[12][0]=Xn_vect_real[207:200];
assign X0[12][1]=Xn_vect_imag[207:200];
assign X0[13][0]=Xn_vect_real[79:72];
assign X0[13][1]=Xn_vect_imag[79:72];
assign X0[14][0]=Xn_vect_real[143:136];
assign X0[14][1]=Xn_vect_imag[143:136];
assign X0[15][0]=Xn_vect_real[15:8];
assign X0[15][1]=Xn_vect_imag[15:8];
assign X0[16][0]=Xn_vect_real[247:240];
assign X0[16][1]=Xn_vect_imag[247:240];
assign X0[17][0]=Xn_vect_real[119:112];
assign X0[17][1]=Xn_vect_imag[119:112];
assign X0[18][0]=Xn_vect_real[183:176];
assign X0[18][1]=Xn_vect_imag[183:176];
assign X0[19][0]=Xn_vect_real[55:48];
assign X0[19][1]=Xn_vect_imag[55:48];
assign X0[20][0]=Xn_vect_real[215:208];
assign X0[20][1]=Xn_vect_imag[215:208];
assign X0[21][0]=Xn_vect_real[87:80];
assign X0[21][1]=Xn_vect_imag[87:80];
assign X0[22][0]=Xn_vect_real[151:144];
assign X0[22][1]=Xn_vect_imag[151:144];
assign X0[23][0]=Xn_vect_real[23:16];
assign X0[23][1]=Xn_vect_imag[23:16];
assign X0[24][0]=Xn_vect_real[231:224];
assign X0[24][1]=Xn_vect_imag[231:224];
assign X0[25][0]=Xn_vect_real[103:96];
assign X0[25][1]=Xn_vect_imag[103:96];
assign X0[26][0]=Xn_vect_real[167:160];
assign X0[26][1]=Xn_vect_imag[167:160];
assign X0[27][0]=Xn_vect_real[39:32];
assign X0[27][1]=Xn_vect_imag[39:32];
assign X0[28][0]=Xn_vect_real[199:192];
assign X0[28][1]=Xn_vect_imag[199:192];
assign X0[29][0]=Xn_vect_real[71:64];
assign X0[29][1]=Xn_vect_imag[71:64];
assign X0[30][0]=Xn_vect_real[135:128];
assign X0[30][1]=Xn_vect_imag[135:128];
assign X0[31][0]=Xn_vect_real[7:0];
assign X0[31][1]=Xn_vect_imag[7:0];

radix_2_fft r2_0
(MAC_in[0][0][0],MAC_in [0][0][1],
MAC_in [0][1][0],MAC_in [0][1][1],
MAC_in [0][2][0],MAC_in [0][2][1],
MAC_out[0][0][0],MAC_out[0][0][1],
MAC_out[0][1][0],MAC_out[0][1][1]);

always @(posedge clk1) begin
if(Sel==0) begin
MAC_in[0][0][0]<=X_reg[0][0][0];
MAC_in[0][0][1]<=X_reg[0][0][1];
MAC_in[0][1][0]<=X_reg[0][1][0];
MAC_in[0][1][1]<=X_reg[0][1][1];
end
else if(Sel==1) begin
MAC_in[0][0][0]<=X_reg[0][2][0];
MAC_in[0][0][1]<=X_reg[0][2][1];
MAC_in[0][1][0]<=X_reg[0][3][0];
MAC_in[0][1][1]<=X_reg[0][3][1];
end
else if(Sel==2) begin
MAC_in[0][0][0]<=X_reg[0][4][0];
MAC_in[0][0][1]<=X_reg[0][4][1];
MAC_in[0][1][0]<=X_reg[0][5][0];
MAC_in[0][1][1]<=X_reg[0][5][1];
end
else if(Sel==3) begin
MAC_in[0][0][0]<=X_reg[0][6][0];
MAC_in[0][0][1]<=X_reg[0][6][1];
MAC_in[0][1][0]<=X_reg[0][7][0];
MAC_in[0][1][1]<=X_reg[0][7][1];
end
else if(Sel==4) begin
MAC_in[0][0][0]<=X_reg[0][8][0];
MAC_in[0][0][1]<=X_reg[0][8][1];
MAC_in[0][1][0]<=X_reg[0][9][0];
MAC_in[0][1][1]<=X_reg[0][9][1];
end
else if(Sel==5) begin
MAC_in[0][0][0]<=X_reg[0][10][0];
MAC_in[0][0][1]<=X_reg[0][10][1];
MAC_in[0][1][0]<=X_reg[0][11][0];
MAC_in[0][1][1]<=X_reg[0][11][1];
end
else if(Sel==6) begin
MAC_in[0][0][0]<=X_reg[0][12][0];
MAC_in[0][0][1]<=X_reg[0][12][1];
MAC_in[0][1][0]<=X_reg[0][13][0];
MAC_in[0][1][1]<=X_reg[0][13][1];
end
else if(Sel==7) begin
MAC_in[0][0][0]<=X_reg[0][14][0];
MAC_in[0][0][1]<=X_reg[0][14][1];
MAC_in[0][1][0]<=X_reg[0][15][0];
MAC_in[0][1][1]<=X_reg[0][15][1];
end
else if(Sel==8) begin
MAC_in[0][0][0]<=X_reg[0][16][0];
MAC_in[0][0][1]<=X_reg[0][16][1];
MAC_in[0][1][0]<=X_reg[0][17][0];
MAC_in[0][1][1]<=X_reg[0][17][1];
end
else if(Sel==9) begin
MAC_in[0][0][0]<=X_reg[0][18][0];
MAC_in[0][0][1]<=X_reg[0][18][1];
MAC_in[0][1][0]<=X_reg[0][19][0];
MAC_in[0][1][1]<=X_reg[0][19][1];
end
else if(Sel==10) begin
MAC_in[0][0][0]<=X_reg[0][20][0];
MAC_in[0][0][1]<=X_reg[0][20][1];
MAC_in[0][1][0]<=X_reg[0][21][0];
MAC_in[0][1][1]<=X_reg[0][21][1];
end
else if(Sel==11) begin
MAC_in[0][0][0]<=X_reg[0][22][0];
MAC_in[0][0][1]<=X_reg[0][22][1];
MAC_in[0][1][0]<=X_reg[0][23][0];
MAC_in[0][1][1]<=X_reg[0][23][1];
end
else if(Sel==12) begin
MAC_in[0][0][0]<=X_reg[0][24][0];
MAC_in[0][0][1]<=X_reg[0][24][1];
MAC_in[0][1][0]<=X_reg[0][25][0];
MAC_in[0][1][1]<=X_reg[0][25][1];
end
else if(Sel==13) begin
MAC_in[0][0][0]<=X_reg[0][26][0];
MAC_in[0][0][1]<=X_reg[0][26][1];
MAC_in[0][1][0]<=X_reg[0][27][0];
MAC_in[0][1][1]<=X_reg[0][27][1];
end
else if(Sel==14) begin
MAC_in[0][0][0]<=X_reg[0][28][0];
MAC_in[0][0][1]<=X_reg[0][28][1];
MAC_in[0][1][0]<=X_reg[0][29][0];
MAC_in[0][1][1]<=X_reg[0][29][1];
end
else if(Sel==15) begin
MAC_in[0][0][0]<=X_reg[0][30][0];
MAC_in[0][0][1]<=X_reg[0][30][1];
MAC_in[0][1][0]<=X_reg[0][31][0];
MAC_in[0][1][1]<=X_reg[0][31][1];
end
else if(Sel==16) begin
MAC_in[0][0][0]<=X_reg[1][0][0];
MAC_in[0][0][1]<=X_reg[1][0][1];
MAC_in[0][1][0]<=X_reg[1][2][0];
MAC_in[0][1][1]<=X_reg[1][2][1];
end
else if(Sel==17) begin
MAC_in[0][0][0]<=X_reg[1][1][0];
MAC_in[0][0][1]<=X_reg[1][1][1];
MAC_in[0][1][0]<=X_reg[1][3][0];
MAC_in[0][1][1]<=X_reg[1][3][1];
end
else if(Sel==18) begin
MAC_in[0][0][0]<=X_reg[1][4][0];
MAC_in[0][0][1]<=X_reg[1][4][1];
MAC_in[0][1][0]<=X_reg[1][6][0];
MAC_in[0][1][1]<=X_reg[1][6][1];
end
else if(Sel==19) begin
MAC_in[0][0][0]<=X_reg[1][5][0];
MAC_in[0][0][1]<=X_reg[1][5][1];
MAC_in[0][1][0]<=X_reg[1][7][0];
MAC_in[0][1][1]<=X_reg[1][7][1];
end
else if(Sel==20) begin
MAC_in[0][0][0]<=X_reg[1][8][0];
MAC_in[0][0][1]<=X_reg[1][8][1];
MAC_in[0][1][0]<=X_reg[1][10][0];
MAC_in[0][1][1]<=X_reg[1][10][1];
end
else if(Sel==21) begin
MAC_in[0][0][0]<=X_reg[1][9][0];
MAC_in[0][0][1]<=X_reg[1][9][1];
MAC_in[0][1][0]<=X_reg[1][11][0];
MAC_in[0][1][1]<=X_reg[1][11][1];
end
else if(Sel==22) begin
MAC_in[0][0][0]<=X_reg[1][12][0];
MAC_in[0][0][1]<=X_reg[1][12][1];
MAC_in[0][1][0]<=X_reg[1][14][0];
MAC_in[0][1][1]<=X_reg[1][14][1];
end
else if(Sel==23) begin
MAC_in[0][0][0]<=X_reg[1][13][0];
MAC_in[0][0][1]<=X_reg[1][13][1];
MAC_in[0][1][0]<=X_reg[1][15][0];
MAC_in[0][1][1]<=X_reg[1][15][1];
end
else if(Sel==24) begin
MAC_in[0][0][0]<=X_reg[1][16][0];
MAC_in[0][0][1]<=X_reg[1][16][1];
MAC_in[0][1][0]<=X_reg[1][18][0];
MAC_in[0][1][1]<=X_reg[1][18][1];
end
else if(Sel==25) begin
MAC_in[0][0][0]<=X_reg[1][17][0];
MAC_in[0][0][1]<=X_reg[1][17][1];
MAC_in[0][1][0]<=X_reg[1][19][0];
MAC_in[0][1][1]<=X_reg[1][19][1];
end
else if(Sel==26) begin
MAC_in[0][0][0]<=X_reg[1][20][0];
MAC_in[0][0][1]<=X_reg[1][20][1];
MAC_in[0][1][0]<=X_reg[1][22][0];
MAC_in[0][1][1]<=X_reg[1][22][1];
end
else if(Sel==27) begin
MAC_in[0][0][0]<=X_reg[1][21][0];
MAC_in[0][0][1]<=X_reg[1][21][1];
MAC_in[0][1][0]<=X_reg[1][23][0];
MAC_in[0][1][1]<=X_reg[1][23][1];
end
else if(Sel==28) begin
MAC_in[0][0][0]<=X_reg[1][24][0];
MAC_in[0][0][1]<=X_reg[1][24][1];
MAC_in[0][1][0]<=X_reg[1][26][0];
MAC_in[0][1][1]<=X_reg[1][26][1];
end
else if(Sel==29) begin
MAC_in[0][0][0]<=X_reg[1][25][0];
MAC_in[0][0][1]<=X_reg[1][25][1];
MAC_in[0][1][0]<=X_reg[1][27][0];
MAC_in[0][1][1]<=X_reg[1][27][1];
end
else if(Sel==30) begin
MAC_in[0][0][0]<=X_reg[1][28][0];
MAC_in[0][0][1]<=X_reg[1][28][1];
MAC_in[0][1][0]<=X_reg[1][30][0];
MAC_in[0][1][1]<=X_reg[1][30][1];
end
else if(Sel==31) begin
MAC_in[0][0][0]<=X_reg[1][29][0];
MAC_in[0][0][1]<=X_reg[1][29][1];
MAC_in[0][1][0]<=X_reg[1][31][0];
MAC_in[0][1][1]<=X_reg[1][31][1];
end
else if(Sel==32) begin
MAC_in[0][0][0]<=X_reg[2][0][0];
MAC_in[0][0][1]<=X_reg[2][0][1];
MAC_in[0][1][0]<=X_reg[2][4][0];
MAC_in[0][1][1]<=X_reg[2][4][1];
end
else if(Sel==33) begin
MAC_in[0][0][0]<=X_reg[2][1][0];
MAC_in[0][0][1]<=X_reg[2][1][1];
MAC_in[0][1][0]<=X_reg[2][5][0];
MAC_in[0][1][1]<=X_reg[2][5][1];
end
else if(Sel==34) begin
MAC_in[0][0][0]<=X_reg[2][2][0];
MAC_in[0][0][1]<=X_reg[2][2][1];
MAC_in[0][1][0]<=X_reg[2][6][0];
MAC_in[0][1][1]<=X_reg[2][6][1];
end
else if(Sel==35) begin
MAC_in[0][0][0]<=X_reg[2][3][0];
MAC_in[0][0][1]<=X_reg[2][3][1];
MAC_in[0][1][0]<=X_reg[2][7][0];
MAC_in[0][1][1]<=X_reg[2][7][1];
end
else if(Sel==36) begin
MAC_in[0][0][0]<=X_reg[2][8][0];
MAC_in[0][0][1]<=X_reg[2][8][1];
MAC_in[0][1][0]<=X_reg[2][12][0];
MAC_in[0][1][1]<=X_reg[2][12][1];
end
else if(Sel==37) begin
MAC_in[0][0][0]<=X_reg[2][9][0];
MAC_in[0][0][1]<=X_reg[2][9][1];
MAC_in[0][1][0]<=X_reg[2][13][0];
MAC_in[0][1][1]<=X_reg[2][13][1];
end
else if(Sel==38) begin
MAC_in[0][0][0]<=X_reg[2][10][0];
MAC_in[0][0][1]<=X_reg[2][10][1];
MAC_in[0][1][0]<=X_reg[2][14][0];
MAC_in[0][1][1]<=X_reg[2][14][1];
end
else if(Sel==39) begin
MAC_in[0][0][0]<=X_reg[2][11][0];
MAC_in[0][0][1]<=X_reg[2][11][1];
MAC_in[0][1][0]<=X_reg[2][15][0];
MAC_in[0][1][1]<=X_reg[2][15][1];
end
else if(Sel==40) begin
MAC_in[0][0][0]<=X_reg[2][16][0];
MAC_in[0][0][1]<=X_reg[2][16][1];
MAC_in[0][1][0]<=X_reg[2][20][0];
MAC_in[0][1][1]<=X_reg[2][20][1];
end
else if(Sel==41) begin
MAC_in[0][0][0]<=X_reg[2][17][0];
MAC_in[0][0][1]<=X_reg[2][17][1];
MAC_in[0][1][0]<=X_reg[2][21][0];
MAC_in[0][1][1]<=X_reg[2][21][1];
end
else if(Sel==42) begin
MAC_in[0][0][0]<=X_reg[2][18][0];
MAC_in[0][0][1]<=X_reg[2][18][1];
MAC_in[0][1][0]<=X_reg[2][22][0];
MAC_in[0][1][1]<=X_reg[2][22][1];
end
else if(Sel==43) begin
MAC_in[0][0][0]<=X_reg[2][19][0];
MAC_in[0][0][1]<=X_reg[2][19][1];
MAC_in[0][1][0]<=X_reg[2][23][0];
MAC_in[0][1][1]<=X_reg[2][23][1];
end
else if(Sel==44) begin
MAC_in[0][0][0]<=X_reg[2][24][0];
MAC_in[0][0][1]<=X_reg[2][24][1];
MAC_in[0][1][0]<=X_reg[2][28][0];
MAC_in[0][1][1]<=X_reg[2][28][1];
end
else if(Sel==45) begin
MAC_in[0][0][0]<=X_reg[2][25][0];
MAC_in[0][0][1]<=X_reg[2][25][1];
MAC_in[0][1][0]<=X_reg[2][29][0];
MAC_in[0][1][1]<=X_reg[2][29][1];
end
else if(Sel==46) begin
MAC_in[0][0][0]<=X_reg[2][26][0];
MAC_in[0][0][1]<=X_reg[2][26][1];
MAC_in[0][1][0]<=X_reg[2][30][0];
MAC_in[0][1][1]<=X_reg[2][30][1];
end
else if(Sel==47) begin
MAC_in[0][0][0]<=X_reg[2][27][0];
MAC_in[0][0][1]<=X_reg[2][27][1];
MAC_in[0][1][0]<=X_reg[2][31][0];
MAC_in[0][1][1]<=X_reg[2][31][1];
end
else if(Sel==48) begin
MAC_in[0][0][0]<=X_reg[3][0][0];
MAC_in[0][0][1]<=X_reg[3][0][1];
MAC_in[0][1][0]<=X_reg[3][8][0];
MAC_in[0][1][1]<=X_reg[3][8][1];
end
else if(Sel==49) begin
MAC_in[0][0][0]<=X_reg[3][1][0];
MAC_in[0][0][1]<=X_reg[3][1][1];
MAC_in[0][1][0]<=X_reg[3][9][0];
MAC_in[0][1][1]<=X_reg[3][9][1];
end
else if(Sel==50) begin
MAC_in[0][0][0]<=X_reg[3][2][0];
MAC_in[0][0][1]<=X_reg[3][2][1];
MAC_in[0][1][0]<=X_reg[3][10][0];
MAC_in[0][1][1]<=X_reg[3][10][1];
end
else if(Sel==51) begin
MAC_in[0][0][0]<=X_reg[3][3][0];
MAC_in[0][0][1]<=X_reg[3][3][1];
MAC_in[0][1][0]<=X_reg[3][11][0];
MAC_in[0][1][1]<=X_reg[3][11][1];
end
else if(Sel==52) begin
MAC_in[0][0][0]<=X_reg[3][4][0];
MAC_in[0][0][1]<=X_reg[3][4][1];
MAC_in[0][1][0]<=X_reg[3][12][0];
MAC_in[0][1][1]<=X_reg[3][12][1];
end
else if(Sel==53) begin
MAC_in[0][0][0]<=X_reg[3][5][0];
MAC_in[0][0][1]<=X_reg[3][5][1];
MAC_in[0][1][0]<=X_reg[3][13][0];
MAC_in[0][1][1]<=X_reg[3][13][1];
end
else if(Sel==54) begin
MAC_in[0][0][0]<=X_reg[3][6][0];
MAC_in[0][0][1]<=X_reg[3][6][1];
MAC_in[0][1][0]<=X_reg[3][14][0];
MAC_in[0][1][1]<=X_reg[3][14][1];
end
else if(Sel==55) begin
MAC_in[0][0][0]<=X_reg[3][7][0];
MAC_in[0][0][1]<=X_reg[3][7][1];
MAC_in[0][1][0]<=X_reg[3][15][0];
MAC_in[0][1][1]<=X_reg[3][15][1];
end
else if(Sel==56) begin
MAC_in[0][0][0]<=X_reg[3][16][0];
MAC_in[0][0][1]<=X_reg[3][16][1];
MAC_in[0][1][0]<=X_reg[3][24][0];
MAC_in[0][1][1]<=X_reg[3][24][1];
end
else if(Sel==57) begin
MAC_in[0][0][0]<=X_reg[3][17][0];
MAC_in[0][0][1]<=X_reg[3][17][1];
MAC_in[0][1][0]<=X_reg[3][25][0];
MAC_in[0][1][1]<=X_reg[3][25][1];
end
else if(Sel==58) begin
MAC_in[0][0][0]<=X_reg[3][18][0];
MAC_in[0][0][1]<=X_reg[3][18][1];
MAC_in[0][1][0]<=X_reg[3][26][0];
MAC_in[0][1][1]<=X_reg[3][26][1];
end
else if(Sel==59) begin
MAC_in[0][0][0]<=X_reg[3][19][0];
MAC_in[0][0][1]<=X_reg[3][19][1];
MAC_in[0][1][0]<=X_reg[3][27][0];
MAC_in[0][1][1]<=X_reg[3][27][1];
end
else if(Sel==60) begin
MAC_in[0][0][0]<=X_reg[3][20][0];
MAC_in[0][0][1]<=X_reg[3][20][1];
MAC_in[0][1][0]<=X_reg[3][28][0];
MAC_in[0][1][1]<=X_reg[3][28][1];
end
else if(Sel==61) begin
MAC_in[0][0][0]<=X_reg[3][21][0];
MAC_in[0][0][1]<=X_reg[3][21][1];
MAC_in[0][1][0]<=X_reg[3][29][0];
MAC_in[0][1][1]<=X_reg[3][29][1];
end
else if(Sel==62) begin
MAC_in[0][0][0]<=X_reg[3][22][0];
MAC_in[0][0][1]<=X_reg[3][22][1];
MAC_in[0][1][0]<=X_reg[3][30][0];
MAC_in[0][1][1]<=X_reg[3][30][1];
end
else if(Sel==63) begin
MAC_in[0][0][0]<=X_reg[3][23][0];
MAC_in[0][0][1]<=X_reg[3][23][1];
MAC_in[0][1][0]<=X_reg[3][31][0];
MAC_in[0][1][1]<=X_reg[3][31][1];
end
else if(Sel==64) begin
MAC_in[0][0][0]<=X_reg[4][0][0];
MAC_in[0][0][1]<=X_reg[4][0][1];
MAC_in[0][1][0]<=X_reg[4][16][0];
MAC_in[0][1][1]<=X_reg[4][16][1];
end
else if(Sel==65) begin
MAC_in[0][0][0]<=X_reg[4][1][0];
MAC_in[0][0][1]<=X_reg[4][1][1];
MAC_in[0][1][0]<=X_reg[4][17][0];
MAC_in[0][1][1]<=X_reg[4][17][1];
end
else if(Sel==66) begin
MAC_in[0][0][0]<=X_reg[4][2][0];
MAC_in[0][0][1]<=X_reg[4][2][1];
MAC_in[0][1][0]<=X_reg[4][18][0];
MAC_in[0][1][1]<=X_reg[4][18][1];
end
else if(Sel==67) begin
MAC_in[0][0][0]<=X_reg[4][3][0];
MAC_in[0][0][1]<=X_reg[4][3][1];
MAC_in[0][1][0]<=X_reg[4][19][0];
MAC_in[0][1][1]<=X_reg[4][19][1];
end
else if(Sel==68) begin
MAC_in[0][0][0]<=X_reg[4][4][0];
MAC_in[0][0][1]<=X_reg[4][4][1];
MAC_in[0][1][0]<=X_reg[4][20][0];
MAC_in[0][1][1]<=X_reg[4][20][1];
end
else if(Sel==69) begin
MAC_in[0][0][0]<=X_reg[4][5][0];
MAC_in[0][0][1]<=X_reg[4][5][1];
MAC_in[0][1][0]<=X_reg[4][21][0];
MAC_in[0][1][1]<=X_reg[4][21][1];
end
else if(Sel==70) begin
MAC_in[0][0][0]<=X_reg[4][6][0];
MAC_in[0][0][1]<=X_reg[4][6][1];
MAC_in[0][1][0]<=X_reg[4][22][0];
MAC_in[0][1][1]<=X_reg[4][22][1];
end
else if(Sel==71) begin
MAC_in[0][0][0]<=X_reg[4][7][0];
MAC_in[0][0][1]<=X_reg[4][7][1];
MAC_in[0][1][0]<=X_reg[4][23][0];
MAC_in[0][1][1]<=X_reg[4][23][1];
end
else if(Sel==72) begin
MAC_in[0][0][0]<=X_reg[4][8][0];
MAC_in[0][0][1]<=X_reg[4][8][1];
MAC_in[0][1][0]<=X_reg[4][24][0];
MAC_in[0][1][1]<=X_reg[4][24][1];
end
else if(Sel==73) begin
MAC_in[0][0][0]<=X_reg[4][9][0];
MAC_in[0][0][1]<=X_reg[4][9][1];
MAC_in[0][1][0]<=X_reg[4][25][0];
MAC_in[0][1][1]<=X_reg[4][25][1];
end
else if(Sel==74) begin
MAC_in[0][0][0]<=X_reg[4][10][0];
MAC_in[0][0][1]<=X_reg[4][10][1];
MAC_in[0][1][0]<=X_reg[4][26][0];
MAC_in[0][1][1]<=X_reg[4][26][1];
end
else if(Sel==75) begin
MAC_in[0][0][0]<=X_reg[4][11][0];
MAC_in[0][0][1]<=X_reg[4][11][1];
MAC_in[0][1][0]<=X_reg[4][27][0];
MAC_in[0][1][1]<=X_reg[4][27][1];
end
else if(Sel==76) begin
MAC_in[0][0][0]<=X_reg[4][12][0];
MAC_in[0][0][1]<=X_reg[4][12][1];
MAC_in[0][1][0]<=X_reg[4][28][0];
MAC_in[0][1][1]<=X_reg[4][28][1];
end
else if(Sel==77) begin
MAC_in[0][0][0]<=X_reg[4][13][0];
MAC_in[0][0][1]<=X_reg[4][13][1];
MAC_in[0][1][0]<=X_reg[4][29][0];
MAC_in[0][1][1]<=X_reg[4][29][1];
end
else if(Sel==78) begin
MAC_in[0][0][0]<=X_reg[4][14][0];
MAC_in[0][0][1]<=X_reg[4][14][1];
MAC_in[0][1][0]<=X_reg[4][30][0];
MAC_in[0][1][1]<=X_reg[4][30][1];
end
else begin
MAC_in[0][0][0]<=X_reg[4][15][0];
MAC_in[0][0][1]<=X_reg[4][15][1];
MAC_in[0][1][0]<=X_reg[4][31][0];
MAC_in[0][1][1]<=X_reg[4][31][1];
end
end

always @(posedge clk1) begin
if(Sel==0) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==1) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==2) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==3) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==4) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==5) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==6) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==7) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==8) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==9) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==10) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==11) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==12) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==13) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==14) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==15) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==16) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==17) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==18) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==19) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==20) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==21) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==22) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==23) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==24) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==25) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==26) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==27) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==28) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==29) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==30) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==31) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==32) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==33) begin
MAC_in[0][2][0]<=8'b00001011;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==34) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==35) begin
MAC_in[0][2][0]<=8'b11110101;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==36) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==37) begin
MAC_in[0][2][0]<=8'b00001011;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==38) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==39) begin
MAC_in[0][2][0]<=8'b11110101;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==40) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==41) begin
MAC_in[0][2][0]<=8'b00001011;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==42) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==43) begin
MAC_in[0][2][0]<=8'b11110101;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==44) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==45) begin
MAC_in[0][2][0]<=8'b00001011;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==46) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==47) begin
MAC_in[0][2][0]<=8'b11110101;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==48) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==49) begin
MAC_in[0][2][0]<=8'b00001110;
MAC_in[0][2][1]<=8'b11111010;
end
else if(Sel==50) begin
MAC_in[0][2][0]<=8'b00001011;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==51) begin
MAC_in[0][2][0]<=8'b00000110;
MAC_in[0][2][1]<=8'b11110010;
end
else if(Sel==52) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==53) begin
MAC_in[0][2][0]<=8'b11111010;
MAC_in[0][2][1]<=8'b11110010;
end
else if(Sel==54) begin
MAC_in[0][2][0]<=8'b11110101;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==55) begin
MAC_in[0][2][0]<=8'b11110010;
MAC_in[0][2][1]<=8'b11111010;
end
else if(Sel==56) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==57) begin
MAC_in[0][2][0]<=8'b00001110;
MAC_in[0][2][1]<=8'b11111010;
end
else if(Sel==58) begin
MAC_in[0][2][0]<=8'b00001011;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==59) begin
MAC_in[0][2][0]<=8'b00000110;
MAC_in[0][2][1]<=8'b11110010;
end
else if(Sel==60) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==61) begin
MAC_in[0][2][0]<=8'b11111010;
MAC_in[0][2][1]<=8'b11110010;
end
else if(Sel==62) begin
MAC_in[0][2][0]<=8'b11110101;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==63) begin
MAC_in[0][2][0]<=8'b11110010;
MAC_in[0][2][1]<=8'b11111010;
end
else if(Sel==64) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
end
else if(Sel==65) begin
MAC_in[0][2][0]<=8'b00001111;
MAC_in[0][2][1]<=8'b11111101;
end
else if(Sel==66) begin
MAC_in[0][2][0]<=8'b00001110;
MAC_in[0][2][1]<=8'b11111010;
end
else if(Sel==67) begin
MAC_in[0][2][0]<=8'b00001101;
MAC_in[0][2][1]<=8'b11111000;
end
else if(Sel==68) begin
MAC_in[0][2][0]<=8'b00001011;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==69) begin
MAC_in[0][2][0]<=8'b00001000;
MAC_in[0][2][1]<=8'b11110011;
end
else if(Sel==70) begin
MAC_in[0][2][0]<=8'b00000110;
MAC_in[0][2][1]<=8'b11110010;
end
else if(Sel==71) begin
MAC_in[0][2][0]<=8'b00000011;
MAC_in[0][2][1]<=8'b11110001;
end
else if(Sel==72) begin
MAC_in[0][2][0]<=8'b00000000;
MAC_in[0][2][1]<=8'b11110000;
end
else if(Sel==73) begin
MAC_in[0][2][0]<=8'b11111101;
MAC_in[0][2][1]<=8'b11110001;
end
else if(Sel==74) begin
MAC_in[0][2][0]<=8'b11111010;
MAC_in[0][2][1]<=8'b11110010;
end
else if(Sel==75) begin
MAC_in[0][2][0]<=8'b11111000;
MAC_in[0][2][1]<=8'b11110011;
end
else if(Sel==76) begin
MAC_in[0][2][0]<=8'b11110101;
MAC_in[0][2][1]<=8'b11110101;
end
else if(Sel==77) begin
MAC_in[0][2][0]<=8'b11110011;
MAC_in[0][2][1]<=8'b11111000;
end
else if(Sel==78) begin
MAC_in[0][2][0]<=8'b11110010;
MAC_in[0][2][1]<=8'b11111010;
end
else begin
MAC_in[0][2][0]<=8'b11110001;
MAC_in[0][2][1]<=8'b11111101;
end
end

always @(posedge clk1) begin
if(Sel==1) begin
MAC_out_reg[0][0][0]<=MAC_out[0][0][0];
MAC_out_reg[0][0][1]<=MAC_out[0][0][1];
MAC_out_reg[0][1][0]<=MAC_out[0][1][0];
MAC_out_reg[0][1][1]<=MAC_out[0][1][1];
end
else if(Sel==2) begin
MAC_out_reg[0][2][0]<=MAC_out[0][0][0];
MAC_out_reg[0][2][1]<=MAC_out[0][0][1];
MAC_out_reg[0][3][0]<=MAC_out[0][1][0];
MAC_out_reg[0][3][1]<=MAC_out[0][1][1];
end
else if(Sel==3) begin
MAC_out_reg[0][4][0]<=MAC_out[0][0][0];
MAC_out_reg[0][4][1]<=MAC_out[0][0][1];
MAC_out_reg[0][5][0]<=MAC_out[0][1][0];
MAC_out_reg[0][5][1]<=MAC_out[0][1][1];
end
else if(Sel==4) begin
MAC_out_reg[0][6][0]<=MAC_out[0][0][0];
MAC_out_reg[0][6][1]<=MAC_out[0][0][1];
MAC_out_reg[0][7][0]<=MAC_out[0][1][0];
MAC_out_reg[0][7][1]<=MAC_out[0][1][1];
end
else if(Sel==5) begin
MAC_out_reg[0][8][0]<=MAC_out[0][0][0];
MAC_out_reg[0][8][1]<=MAC_out[0][0][1];
MAC_out_reg[0][9][0]<=MAC_out[0][1][0];
MAC_out_reg[0][9][1]<=MAC_out[0][1][1];
end
else if(Sel==6) begin
MAC_out_reg[0][10][0]<=MAC_out[0][0][0];
MAC_out_reg[0][10][1]<=MAC_out[0][0][1];
MAC_out_reg[0][11][0]<=MAC_out[0][1][0];
MAC_out_reg[0][11][1]<=MAC_out[0][1][1];
end
else if(Sel==7) begin
MAC_out_reg[0][12][0]<=MAC_out[0][0][0];
MAC_out_reg[0][12][1]<=MAC_out[0][0][1];
MAC_out_reg[0][13][0]<=MAC_out[0][1][0];
MAC_out_reg[0][13][1]<=MAC_out[0][1][1];
end
else if(Sel==8) begin
MAC_out_reg[0][14][0]<=MAC_out[0][0][0];
MAC_out_reg[0][14][1]<=MAC_out[0][0][1];
MAC_out_reg[0][15][0]<=MAC_out[0][1][0];
MAC_out_reg[0][15][1]<=MAC_out[0][1][1];
end
else if(Sel==9) begin
MAC_out_reg[0][16][0]<=MAC_out[0][0][0];
MAC_out_reg[0][16][1]<=MAC_out[0][0][1];
MAC_out_reg[0][17][0]<=MAC_out[0][1][0];
MAC_out_reg[0][17][1]<=MAC_out[0][1][1];
end
else if(Sel==10) begin
MAC_out_reg[0][18][0]<=MAC_out[0][0][0];
MAC_out_reg[0][18][1]<=MAC_out[0][0][1];
MAC_out_reg[0][19][0]<=MAC_out[0][1][0];
MAC_out_reg[0][19][1]<=MAC_out[0][1][1];
end
else if(Sel==11) begin
MAC_out_reg[0][20][0]<=MAC_out[0][0][0];
MAC_out_reg[0][20][1]<=MAC_out[0][0][1];
MAC_out_reg[0][21][0]<=MAC_out[0][1][0];
MAC_out_reg[0][21][1]<=MAC_out[0][1][1];
end
else if(Sel==12) begin
MAC_out_reg[0][22][0]<=MAC_out[0][0][0];
MAC_out_reg[0][22][1]<=MAC_out[0][0][1];
MAC_out_reg[0][23][0]<=MAC_out[0][1][0];
MAC_out_reg[0][23][1]<=MAC_out[0][1][1];
end
else if(Sel==13) begin
MAC_out_reg[0][24][0]<=MAC_out[0][0][0];
MAC_out_reg[0][24][1]<=MAC_out[0][0][1];
MAC_out_reg[0][25][0]<=MAC_out[0][1][0];
MAC_out_reg[0][25][1]<=MAC_out[0][1][1];
end
else if(Sel==14) begin
MAC_out_reg[0][26][0]<=MAC_out[0][0][0];
MAC_out_reg[0][26][1]<=MAC_out[0][0][1];
MAC_out_reg[0][27][0]<=MAC_out[0][1][0];
MAC_out_reg[0][27][1]<=MAC_out[0][1][1];
end
else if(Sel==15) begin
MAC_out_reg[0][28][0]<=MAC_out[0][0][0];
MAC_out_reg[0][28][1]<=MAC_out[0][0][1];
MAC_out_reg[0][29][0]<=MAC_out[0][1][0];
MAC_out_reg[0][29][1]<=MAC_out[0][1][1];
end
else if(Sel==16) begin
MAC_out_reg[0][30][0]<=MAC_out[0][0][0];
MAC_out_reg[0][30][1]<=MAC_out[0][0][1];
MAC_out_reg[0][31][0]<=MAC_out[0][1][0];
MAC_out_reg[0][31][1]<=MAC_out[0][1][1];
end
else if(Sel==17) begin
MAC_out_reg[1][0][0]<=MAC_out[0][0][0];
MAC_out_reg[1][0][1]<=MAC_out[0][0][1];
MAC_out_reg[1][2][0]<=MAC_out[0][1][0];
MAC_out_reg[1][2][1]<=MAC_out[0][1][1];
end
else if(Sel==18) begin
MAC_out_reg[1][1][0]<=MAC_out[0][0][0];
MAC_out_reg[1][1][1]<=MAC_out[0][0][1];
MAC_out_reg[1][3][0]<=MAC_out[0][1][0];
MAC_out_reg[1][3][1]<=MAC_out[0][1][1];
end
else if(Sel==19) begin
MAC_out_reg[1][4][0]<=MAC_out[0][0][0];
MAC_out_reg[1][4][1]<=MAC_out[0][0][1];
MAC_out_reg[1][6][0]<=MAC_out[0][1][0];
MAC_out_reg[1][6][1]<=MAC_out[0][1][1];
end
else if(Sel==20) begin
MAC_out_reg[1][5][0]<=MAC_out[0][0][0];
MAC_out_reg[1][5][1]<=MAC_out[0][0][1];
MAC_out_reg[1][7][0]<=MAC_out[0][1][0];
MAC_out_reg[1][7][1]<=MAC_out[0][1][1];
end
else if(Sel==21) begin
MAC_out_reg[1][8][0]<=MAC_out[0][0][0];
MAC_out_reg[1][8][1]<=MAC_out[0][0][1];
MAC_out_reg[1][10][0]<=MAC_out[0][1][0];
MAC_out_reg[1][10][1]<=MAC_out[0][1][1];
end
else if(Sel==22) begin
MAC_out_reg[1][9][0]<=MAC_out[0][0][0];
MAC_out_reg[1][9][1]<=MAC_out[0][0][1];
MAC_out_reg[1][11][0]<=MAC_out[0][1][0];
MAC_out_reg[1][11][1]<=MAC_out[0][1][1];
end
else if(Sel==23) begin
MAC_out_reg[1][12][0]<=MAC_out[0][0][0];
MAC_out_reg[1][12][1]<=MAC_out[0][0][1];
MAC_out_reg[1][14][0]<=MAC_out[0][1][0];
MAC_out_reg[1][14][1]<=MAC_out[0][1][1];
end
else if(Sel==24) begin
MAC_out_reg[1][13][0]<=MAC_out[0][0][0];
MAC_out_reg[1][13][1]<=MAC_out[0][0][1];
MAC_out_reg[1][15][0]<=MAC_out[0][1][0];
MAC_out_reg[1][15][1]<=MAC_out[0][1][1];
end
else if(Sel==25) begin
MAC_out_reg[1][16][0]<=MAC_out[0][0][0];
MAC_out_reg[1][16][1]<=MAC_out[0][0][1];
MAC_out_reg[1][18][0]<=MAC_out[0][1][0];
MAC_out_reg[1][18][1]<=MAC_out[0][1][1];
end
else if(Sel==26) begin
MAC_out_reg[1][17][0]<=MAC_out[0][0][0];
MAC_out_reg[1][17][1]<=MAC_out[0][0][1];
MAC_out_reg[1][19][0]<=MAC_out[0][1][0];
MAC_out_reg[1][19][1]<=MAC_out[0][1][1];
end
else if(Sel==27) begin
MAC_out_reg[1][20][0]<=MAC_out[0][0][0];
MAC_out_reg[1][20][1]<=MAC_out[0][0][1];
MAC_out_reg[1][22][0]<=MAC_out[0][1][0];
MAC_out_reg[1][22][1]<=MAC_out[0][1][1];
end
else if(Sel==28) begin
MAC_out_reg[1][21][0]<=MAC_out[0][0][0];
MAC_out_reg[1][21][1]<=MAC_out[0][0][1];
MAC_out_reg[1][23][0]<=MAC_out[0][1][0];
MAC_out_reg[1][23][1]<=MAC_out[0][1][1];
end
else if(Sel==29) begin
MAC_out_reg[1][24][0]<=MAC_out[0][0][0];
MAC_out_reg[1][24][1]<=MAC_out[0][0][1];
MAC_out_reg[1][26][0]<=MAC_out[0][1][0];
MAC_out_reg[1][26][1]<=MAC_out[0][1][1];
end
else if(Sel==30) begin
MAC_out_reg[1][25][0]<=MAC_out[0][0][0];
MAC_out_reg[1][25][1]<=MAC_out[0][0][1];
MAC_out_reg[1][27][0]<=MAC_out[0][1][0];
MAC_out_reg[1][27][1]<=MAC_out[0][1][1];
end
else if(Sel==31) begin
MAC_out_reg[1][28][0]<=MAC_out[0][0][0];
MAC_out_reg[1][28][1]<=MAC_out[0][0][1];
MAC_out_reg[1][30][0]<=MAC_out[0][1][0];
MAC_out_reg[1][30][1]<=MAC_out[0][1][1];
end
else if(Sel==32) begin
MAC_out_reg[1][29][0]<=MAC_out[0][0][0];
MAC_out_reg[1][29][1]<=MAC_out[0][0][1];
MAC_out_reg[1][31][0]<=MAC_out[0][1][0];
MAC_out_reg[1][31][1]<=MAC_out[0][1][1];
end
else if(Sel==33) begin
MAC_out_reg[2][0][0]<=MAC_out[0][0][0];
MAC_out_reg[2][0][1]<=MAC_out[0][0][1];
MAC_out_reg[2][4][0]<=MAC_out[0][1][0];
MAC_out_reg[2][4][1]<=MAC_out[0][1][1];
end
else if(Sel==34) begin
MAC_out_reg[2][1][0]<=MAC_out[0][0][0];
MAC_out_reg[2][1][1]<=MAC_out[0][0][1];
MAC_out_reg[2][5][0]<=MAC_out[0][1][0];
MAC_out_reg[2][5][1]<=MAC_out[0][1][1];
end
else if(Sel==35) begin
MAC_out_reg[2][2][0]<=MAC_out[0][0][0];
MAC_out_reg[2][2][1]<=MAC_out[0][0][1];
MAC_out_reg[2][6][0]<=MAC_out[0][1][0];
MAC_out_reg[2][6][1]<=MAC_out[0][1][1];
end
else if(Sel==36) begin
MAC_out_reg[2][3][0]<=MAC_out[0][0][0];
MAC_out_reg[2][3][1]<=MAC_out[0][0][1];
MAC_out_reg[2][7][0]<=MAC_out[0][1][0];
MAC_out_reg[2][7][1]<=MAC_out[0][1][1];
end
else if(Sel==37) begin
MAC_out_reg[2][8][0]<=MAC_out[0][0][0];
MAC_out_reg[2][8][1]<=MAC_out[0][0][1];
MAC_out_reg[2][12][0]<=MAC_out[0][1][0];
MAC_out_reg[2][12][1]<=MAC_out[0][1][1];
end
else if(Sel==38) begin
MAC_out_reg[2][9][0]<=MAC_out[0][0][0];
MAC_out_reg[2][9][1]<=MAC_out[0][0][1];
MAC_out_reg[2][13][0]<=MAC_out[0][1][0];
MAC_out_reg[2][13][1]<=MAC_out[0][1][1];
end
else if(Sel==39) begin
MAC_out_reg[2][10][0]<=MAC_out[0][0][0];
MAC_out_reg[2][10][1]<=MAC_out[0][0][1];
MAC_out_reg[2][14][0]<=MAC_out[0][1][0];
MAC_out_reg[2][14][1]<=MAC_out[0][1][1];
end
else if(Sel==40) begin
MAC_out_reg[2][11][0]<=MAC_out[0][0][0];
MAC_out_reg[2][11][1]<=MAC_out[0][0][1];
MAC_out_reg[2][15][0]<=MAC_out[0][1][0];
MAC_out_reg[2][15][1]<=MAC_out[0][1][1];
end
else if(Sel==41) begin
MAC_out_reg[2][16][0]<=MAC_out[0][0][0];
MAC_out_reg[2][16][1]<=MAC_out[0][0][1];
MAC_out_reg[2][20][0]<=MAC_out[0][1][0];
MAC_out_reg[2][20][1]<=MAC_out[0][1][1];
end
else if(Sel==42) begin
MAC_out_reg[2][17][0]<=MAC_out[0][0][0];
MAC_out_reg[2][17][1]<=MAC_out[0][0][1];
MAC_out_reg[2][21][0]<=MAC_out[0][1][0];
MAC_out_reg[2][21][1]<=MAC_out[0][1][1];
end
else if(Sel==43) begin
MAC_out_reg[2][18][0]<=MAC_out[0][0][0];
MAC_out_reg[2][18][1]<=MAC_out[0][0][1];
MAC_out_reg[2][22][0]<=MAC_out[0][1][0];
MAC_out_reg[2][22][1]<=MAC_out[0][1][1];
end
else if(Sel==44) begin
MAC_out_reg[2][19][0]<=MAC_out[0][0][0];
MAC_out_reg[2][19][1]<=MAC_out[0][0][1];
MAC_out_reg[2][23][0]<=MAC_out[0][1][0];
MAC_out_reg[2][23][1]<=MAC_out[0][1][1];
end
else if(Sel==45) begin
MAC_out_reg[2][24][0]<=MAC_out[0][0][0];
MAC_out_reg[2][24][1]<=MAC_out[0][0][1];
MAC_out_reg[2][28][0]<=MAC_out[0][1][0];
MAC_out_reg[2][28][1]<=MAC_out[0][1][1];
end
else if(Sel==46) begin
MAC_out_reg[2][25][0]<=MAC_out[0][0][0];
MAC_out_reg[2][25][1]<=MAC_out[0][0][1];
MAC_out_reg[2][29][0]<=MAC_out[0][1][0];
MAC_out_reg[2][29][1]<=MAC_out[0][1][1];
end
else if(Sel==47) begin
MAC_out_reg[2][26][0]<=MAC_out[0][0][0];
MAC_out_reg[2][26][1]<=MAC_out[0][0][1];
MAC_out_reg[2][30][0]<=MAC_out[0][1][0];
MAC_out_reg[2][30][1]<=MAC_out[0][1][1];
end
else if(Sel==48) begin
MAC_out_reg[2][27][0]<=MAC_out[0][0][0];
MAC_out_reg[2][27][1]<=MAC_out[0][0][1];
MAC_out_reg[2][31][0]<=MAC_out[0][1][0];
MAC_out_reg[2][31][1]<=MAC_out[0][1][1];
end
else if(Sel==49) begin
MAC_out_reg[3][0][0]<=MAC_out[0][0][0];
MAC_out_reg[3][0][1]<=MAC_out[0][0][1];
MAC_out_reg[3][8][0]<=MAC_out[0][1][0];
MAC_out_reg[3][8][1]<=MAC_out[0][1][1];
end
else if(Sel==50) begin
MAC_out_reg[3][1][0]<=MAC_out[0][0][0];
MAC_out_reg[3][1][1]<=MAC_out[0][0][1];
MAC_out_reg[3][9][0]<=MAC_out[0][1][0];
MAC_out_reg[3][9][1]<=MAC_out[0][1][1];
end
else if(Sel==51) begin
MAC_out_reg[3][2][0]<=MAC_out[0][0][0];
MAC_out_reg[3][2][1]<=MAC_out[0][0][1];
MAC_out_reg[3][10][0]<=MAC_out[0][1][0];
MAC_out_reg[3][10][1]<=MAC_out[0][1][1];
end
else if(Sel==52) begin
MAC_out_reg[3][3][0]<=MAC_out[0][0][0];
MAC_out_reg[3][3][1]<=MAC_out[0][0][1];
MAC_out_reg[3][11][0]<=MAC_out[0][1][0];
MAC_out_reg[3][11][1]<=MAC_out[0][1][1];
end
else if(Sel==53) begin
MAC_out_reg[3][4][0]<=MAC_out[0][0][0];
MAC_out_reg[3][4][1]<=MAC_out[0][0][1];
MAC_out_reg[3][12][0]<=MAC_out[0][1][0];
MAC_out_reg[3][12][1]<=MAC_out[0][1][1];
end
else if(Sel==54) begin
MAC_out_reg[3][5][0]<=MAC_out[0][0][0];
MAC_out_reg[3][5][1]<=MAC_out[0][0][1];
MAC_out_reg[3][13][0]<=MAC_out[0][1][0];
MAC_out_reg[3][13][1]<=MAC_out[0][1][1];
end
else if(Sel==55) begin
MAC_out_reg[3][6][0]<=MAC_out[0][0][0];
MAC_out_reg[3][6][1]<=MAC_out[0][0][1];
MAC_out_reg[3][14][0]<=MAC_out[0][1][0];
MAC_out_reg[3][14][1]<=MAC_out[0][1][1];
end
else if(Sel==56) begin
MAC_out_reg[3][7][0]<=MAC_out[0][0][0];
MAC_out_reg[3][7][1]<=MAC_out[0][0][1];
MAC_out_reg[3][15][0]<=MAC_out[0][1][0];
MAC_out_reg[3][15][1]<=MAC_out[0][1][1];
end
else if(Sel==57) begin
MAC_out_reg[3][16][0]<=MAC_out[0][0][0];
MAC_out_reg[3][16][1]<=MAC_out[0][0][1];
MAC_out_reg[3][24][0]<=MAC_out[0][1][0];
MAC_out_reg[3][24][1]<=MAC_out[0][1][1];
end
else if(Sel==58) begin
MAC_out_reg[3][17][0]<=MAC_out[0][0][0];
MAC_out_reg[3][17][1]<=MAC_out[0][0][1];
MAC_out_reg[3][25][0]<=MAC_out[0][1][0];
MAC_out_reg[3][25][1]<=MAC_out[0][1][1];
end
else if(Sel==59) begin
MAC_out_reg[3][18][0]<=MAC_out[0][0][0];
MAC_out_reg[3][18][1]<=MAC_out[0][0][1];
MAC_out_reg[3][26][0]<=MAC_out[0][1][0];
MAC_out_reg[3][26][1]<=MAC_out[0][1][1];
end
else if(Sel==60) begin
MAC_out_reg[3][19][0]<=MAC_out[0][0][0];
MAC_out_reg[3][19][1]<=MAC_out[0][0][1];
MAC_out_reg[3][27][0]<=MAC_out[0][1][0];
MAC_out_reg[3][27][1]<=MAC_out[0][1][1];
end
else if(Sel==61) begin
MAC_out_reg[3][20][0]<=MAC_out[0][0][0];
MAC_out_reg[3][20][1]<=MAC_out[0][0][1];
MAC_out_reg[3][28][0]<=MAC_out[0][1][0];
MAC_out_reg[3][28][1]<=MAC_out[0][1][1];
end
else if(Sel==62) begin
MAC_out_reg[3][21][0]<=MAC_out[0][0][0];
MAC_out_reg[3][21][1]<=MAC_out[0][0][1];
MAC_out_reg[3][29][0]<=MAC_out[0][1][0];
MAC_out_reg[3][29][1]<=MAC_out[0][1][1];
end
else if(Sel==63) begin
MAC_out_reg[3][22][0]<=MAC_out[0][0][0];
MAC_out_reg[3][22][1]<=MAC_out[0][0][1];
MAC_out_reg[3][30][0]<=MAC_out[0][1][0];
MAC_out_reg[3][30][1]<=MAC_out[0][1][1];
end
else if(Sel==64) begin
MAC_out_reg[3][23][0]<=MAC_out[0][0][0];
MAC_out_reg[3][23][1]<=MAC_out[0][0][1];
MAC_out_reg[3][31][0]<=MAC_out[0][1][0];
MAC_out_reg[3][31][1]<=MAC_out[0][1][1];
end
else if(Sel==65) begin
MAC_out_reg[4][0][0]<=MAC_out[0][0][0];
MAC_out_reg[4][0][1]<=MAC_out[0][0][1];
MAC_out_reg[4][16][0]<=MAC_out[0][1][0];
MAC_out_reg[4][16][1]<=MAC_out[0][1][1];
end
else if(Sel==66) begin
MAC_out_reg[4][1][0]<=MAC_out[0][0][0];
MAC_out_reg[4][1][1]<=MAC_out[0][0][1];
MAC_out_reg[4][17][0]<=MAC_out[0][1][0];
MAC_out_reg[4][17][1]<=MAC_out[0][1][1];
end
else if(Sel==67) begin
MAC_out_reg[4][2][0]<=MAC_out[0][0][0];
MAC_out_reg[4][2][1]<=MAC_out[0][0][1];
MAC_out_reg[4][18][0]<=MAC_out[0][1][0];
MAC_out_reg[4][18][1]<=MAC_out[0][1][1];
end
else if(Sel==68) begin
MAC_out_reg[4][3][0]<=MAC_out[0][0][0];
MAC_out_reg[4][3][1]<=MAC_out[0][0][1];
MAC_out_reg[4][19][0]<=MAC_out[0][1][0];
MAC_out_reg[4][19][1]<=MAC_out[0][1][1];
end
else if(Sel==69) begin
MAC_out_reg[4][4][0]<=MAC_out[0][0][0];
MAC_out_reg[4][4][1]<=MAC_out[0][0][1];
MAC_out_reg[4][20][0]<=MAC_out[0][1][0];
MAC_out_reg[4][20][1]<=MAC_out[0][1][1];
end
else if(Sel==70) begin
MAC_out_reg[4][5][0]<=MAC_out[0][0][0];
MAC_out_reg[4][5][1]<=MAC_out[0][0][1];
MAC_out_reg[4][21][0]<=MAC_out[0][1][0];
MAC_out_reg[4][21][1]<=MAC_out[0][1][1];
end
else if(Sel==71) begin
MAC_out_reg[4][6][0]<=MAC_out[0][0][0];
MAC_out_reg[4][6][1]<=MAC_out[0][0][1];
MAC_out_reg[4][22][0]<=MAC_out[0][1][0];
MAC_out_reg[4][22][1]<=MAC_out[0][1][1];
end
else if(Sel==72) begin
MAC_out_reg[4][7][0]<=MAC_out[0][0][0];
MAC_out_reg[4][7][1]<=MAC_out[0][0][1];
MAC_out_reg[4][23][0]<=MAC_out[0][1][0];
MAC_out_reg[4][23][1]<=MAC_out[0][1][1];
end
else if(Sel==73) begin
MAC_out_reg[4][8][0]<=MAC_out[0][0][0];
MAC_out_reg[4][8][1]<=MAC_out[0][0][1];
MAC_out_reg[4][24][0]<=MAC_out[0][1][0];
MAC_out_reg[4][24][1]<=MAC_out[0][1][1];
end
else if(Sel==74) begin
MAC_out_reg[4][9][0]<=MAC_out[0][0][0];
MAC_out_reg[4][9][1]<=MAC_out[0][0][1];
MAC_out_reg[4][25][0]<=MAC_out[0][1][0];
MAC_out_reg[4][25][1]<=MAC_out[0][1][1];
end
else if(Sel==75) begin
MAC_out_reg[4][10][0]<=MAC_out[0][0][0];
MAC_out_reg[4][10][1]<=MAC_out[0][0][1];
MAC_out_reg[4][26][0]<=MAC_out[0][1][0];
MAC_out_reg[4][26][1]<=MAC_out[0][1][1];
end
else if(Sel==76) begin
MAC_out_reg[4][11][0]<=MAC_out[0][0][0];
MAC_out_reg[4][11][1]<=MAC_out[0][0][1];
MAC_out_reg[4][27][0]<=MAC_out[0][1][0];
MAC_out_reg[4][27][1]<=MAC_out[0][1][1];
end
else if(Sel==77) begin
MAC_out_reg[4][12][0]<=MAC_out[0][0][0];
MAC_out_reg[4][12][1]<=MAC_out[0][0][1];
MAC_out_reg[4][28][0]<=MAC_out[0][1][0];
MAC_out_reg[4][28][1]<=MAC_out[0][1][1];
end
else if(Sel==78) begin
MAC_out_reg[4][13][0]<=MAC_out[0][0][0];
MAC_out_reg[4][13][1]<=MAC_out[0][0][1];
MAC_out_reg[4][29][0]<=MAC_out[0][1][0];
MAC_out_reg[4][29][1]<=MAC_out[0][1][1];
end
else if(Sel==79) begin
MAC_out_reg[4][14][0]<=MAC_out[0][0][0];
MAC_out_reg[4][14][1]<=MAC_out[0][0][1];
MAC_out_reg[4][30][0]<=MAC_out[0][1][0];
MAC_out_reg[4][30][1]<=MAC_out[0][1][1];
end
else begin
MAC_out_reg[4][15][0]<=MAC_out[0][0][0];
MAC_out_reg[4][15][1]<=MAC_out[0][0][1];
MAC_out_reg[4][31][0]<=MAC_out[0][1][0];
MAC_out_reg[4][31][1]<=MAC_out[0][1][1];
end
end

always @(posedge clk2) begin
X_reg[0][0][0]<=X0[0][0];
X_reg[0][0][1]<=X0[0][1];
X_reg[0][1][0]<=X0[1][0];
X_reg[0][1][1]<=X0[1][1];
X_reg[0][2][0]<=X0[2][0];
X_reg[0][2][1]<=X0[2][1];
X_reg[0][3][0]<=X0[3][0];
X_reg[0][3][1]<=X0[3][1];
X_reg[0][4][0]<=X0[4][0];
X_reg[0][4][1]<=X0[4][1];
X_reg[0][5][0]<=X0[5][0];
X_reg[0][5][1]<=X0[5][1];
X_reg[0][6][0]<=X0[6][0];
X_reg[0][6][1]<=X0[6][1];
X_reg[0][7][0]<=X0[7][0];
X_reg[0][7][1]<=X0[7][1];
X_reg[0][8][0]<=X0[8][0];
X_reg[0][8][1]<=X0[8][1];
X_reg[0][9][0]<=X0[9][0];
X_reg[0][9][1]<=X0[9][1];
X_reg[0][10][0]<=X0[10][0];
X_reg[0][10][1]<=X0[10][1];
X_reg[0][11][0]<=X0[11][0];
X_reg[0][11][1]<=X0[11][1];
X_reg[0][12][0]<=X0[12][0];
X_reg[0][12][1]<=X0[12][1];
X_reg[0][13][0]<=X0[13][0];
X_reg[0][13][1]<=X0[13][1];
X_reg[0][14][0]<=X0[14][0];
X_reg[0][14][1]<=X0[14][1];
X_reg[0][15][0]<=X0[15][0];
X_reg[0][15][1]<=X0[15][1];
X_reg[0][16][0]<=X0[16][0];
X_reg[0][16][1]<=X0[16][1];
X_reg[0][17][0]<=X0[17][0];
X_reg[0][17][1]<=X0[17][1];
X_reg[0][18][0]<=X0[18][0];
X_reg[0][18][1]<=X0[18][1];
X_reg[0][19][0]<=X0[19][0];
X_reg[0][19][1]<=X0[19][1];
X_reg[0][20][0]<=X0[20][0];
X_reg[0][20][1]<=X0[20][1];
X_reg[0][21][0]<=X0[21][0];
X_reg[0][21][1]<=X0[21][1];
X_reg[0][22][0]<=X0[22][0];
X_reg[0][22][1]<=X0[22][1];
X_reg[0][23][0]<=X0[23][0];
X_reg[0][23][1]<=X0[23][1];
X_reg[0][24][0]<=X0[24][0];
X_reg[0][24][1]<=X0[24][1];
X_reg[0][25][0]<=X0[25][0];
X_reg[0][25][1]<=X0[25][1];
X_reg[0][26][0]<=X0[26][0];
X_reg[0][26][1]<=X0[26][1];
X_reg[0][27][0]<=X0[27][0];
X_reg[0][27][1]<=X0[27][1];
X_reg[0][28][0]<=X0[28][0];
X_reg[0][28][1]<=X0[28][1];
X_reg[0][29][0]<=X0[29][0];
X_reg[0][29][1]<=X0[29][1];
X_reg[0][30][0]<=X0[30][0];
X_reg[0][30][1]<=X0[30][1];
X_reg[0][31][0]<=X0[31][0];
X_reg[0][31][1]<=X0[31][1];
X_reg[1][0][0]<=MAC_out_reg[0][0][0];
X_reg[1][0][1]<=MAC_out_reg[0][0][1];
X_reg[1][1][0]<=MAC_out_reg[0][1][0];
X_reg[1][1][1]<=MAC_out_reg[0][1][1];
X_reg[1][2][0]<=MAC_out_reg[0][2][0];
X_reg[1][2][1]<=MAC_out_reg[0][2][1];
X_reg[1][3][0]<=MAC_out_reg[0][3][0];
X_reg[1][3][1]<=MAC_out_reg[0][3][1];
X_reg[1][4][0]<=MAC_out_reg[0][4][0];
X_reg[1][4][1]<=MAC_out_reg[0][4][1];
X_reg[1][5][0]<=MAC_out_reg[0][5][0];
X_reg[1][5][1]<=MAC_out_reg[0][5][1];
X_reg[1][6][0]<=MAC_out_reg[0][6][0];
X_reg[1][6][1]<=MAC_out_reg[0][6][1];
X_reg[1][7][0]<=MAC_out_reg[0][7][0];
X_reg[1][7][1]<=MAC_out_reg[0][7][1];
X_reg[1][8][0]<=MAC_out_reg[0][8][0];
X_reg[1][8][1]<=MAC_out_reg[0][8][1];
X_reg[1][9][0]<=MAC_out_reg[0][9][0];
X_reg[1][9][1]<=MAC_out_reg[0][9][1];
X_reg[1][10][0]<=MAC_out_reg[0][10][0];
X_reg[1][10][1]<=MAC_out_reg[0][10][1];
X_reg[1][11][0]<=MAC_out_reg[0][11][0];
X_reg[1][11][1]<=MAC_out_reg[0][11][1];
X_reg[1][12][0]<=MAC_out_reg[0][12][0];
X_reg[1][12][1]<=MAC_out_reg[0][12][1];
X_reg[1][13][0]<=MAC_out_reg[0][13][0];
X_reg[1][13][1]<=MAC_out_reg[0][13][1];
X_reg[1][14][0]<=MAC_out_reg[0][14][0];
X_reg[1][14][1]<=MAC_out_reg[0][14][1];
X_reg[1][15][0]<=MAC_out_reg[0][15][0];
X_reg[1][15][1]<=MAC_out_reg[0][15][1];
X_reg[1][16][0]<=MAC_out_reg[0][16][0];
X_reg[1][16][1]<=MAC_out_reg[0][16][1];
X_reg[1][17][0]<=MAC_out_reg[0][17][0];
X_reg[1][17][1]<=MAC_out_reg[0][17][1];
X_reg[1][18][0]<=MAC_out_reg[0][18][0];
X_reg[1][18][1]<=MAC_out_reg[0][18][1];
X_reg[1][19][0]<=MAC_out_reg[0][19][0];
X_reg[1][19][1]<=MAC_out_reg[0][19][1];
X_reg[1][20][0]<=MAC_out_reg[0][20][0];
X_reg[1][20][1]<=MAC_out_reg[0][20][1];
X_reg[1][21][0]<=MAC_out_reg[0][21][0];
X_reg[1][21][1]<=MAC_out_reg[0][21][1];
X_reg[1][22][0]<=MAC_out_reg[0][22][0];
X_reg[1][22][1]<=MAC_out_reg[0][22][1];
X_reg[1][23][0]<=MAC_out_reg[0][23][0];
X_reg[1][23][1]<=MAC_out_reg[0][23][1];
X_reg[1][24][0]<=MAC_out_reg[0][24][0];
X_reg[1][24][1]<=MAC_out_reg[0][24][1];
X_reg[1][25][0]<=MAC_out_reg[0][25][0];
X_reg[1][25][1]<=MAC_out_reg[0][25][1];
X_reg[1][26][0]<=MAC_out_reg[0][26][0];
X_reg[1][26][1]<=MAC_out_reg[0][26][1];
X_reg[1][27][0]<=MAC_out_reg[0][27][0];
X_reg[1][27][1]<=MAC_out_reg[0][27][1];
X_reg[1][28][0]<=MAC_out_reg[0][28][0];
X_reg[1][28][1]<=MAC_out_reg[0][28][1];
X_reg[1][29][0]<=MAC_out_reg[0][29][0];
X_reg[1][29][1]<=MAC_out_reg[0][29][1];
X_reg[1][30][0]<=MAC_out_reg[0][30][0];
X_reg[1][30][1]<=MAC_out_reg[0][30][1];
X_reg[1][31][0]<=MAC_out_reg[0][31][0];
X_reg[1][31][1]<=MAC_out_reg[0][31][1];
X_reg[2][0][0]<=MAC_out_reg[1][0][0];
X_reg[2][0][1]<=MAC_out_reg[1][0][1];
X_reg[2][1][0]<=MAC_out_reg[1][1][0];
X_reg[2][1][1]<=MAC_out_reg[1][1][1];
X_reg[2][2][0]<=MAC_out_reg[1][2][0];
X_reg[2][2][1]<=MAC_out_reg[1][2][1];
X_reg[2][3][0]<=MAC_out_reg[1][3][0];
X_reg[2][3][1]<=MAC_out_reg[1][3][1];
X_reg[2][4][0]<=MAC_out_reg[1][4][0];
X_reg[2][4][1]<=MAC_out_reg[1][4][1];
X_reg[2][5][0]<=MAC_out_reg[1][5][0];
X_reg[2][5][1]<=MAC_out_reg[1][5][1];
X_reg[2][6][0]<=MAC_out_reg[1][6][0];
X_reg[2][6][1]<=MAC_out_reg[1][6][1];
X_reg[2][7][0]<=MAC_out_reg[1][7][0];
X_reg[2][7][1]<=MAC_out_reg[1][7][1];
X_reg[2][8][0]<=MAC_out_reg[1][8][0];
X_reg[2][8][1]<=MAC_out_reg[1][8][1];
X_reg[2][9][0]<=MAC_out_reg[1][9][0];
X_reg[2][9][1]<=MAC_out_reg[1][9][1];
X_reg[2][10][0]<=MAC_out_reg[1][10][0];
X_reg[2][10][1]<=MAC_out_reg[1][10][1];
X_reg[2][11][0]<=MAC_out_reg[1][11][0];
X_reg[2][11][1]<=MAC_out_reg[1][11][1];
X_reg[2][12][0]<=MAC_out_reg[1][12][0];
X_reg[2][12][1]<=MAC_out_reg[1][12][1];
X_reg[2][13][0]<=MAC_out_reg[1][13][0];
X_reg[2][13][1]<=MAC_out_reg[1][13][1];
X_reg[2][14][0]<=MAC_out_reg[1][14][0];
X_reg[2][14][1]<=MAC_out_reg[1][14][1];
X_reg[2][15][0]<=MAC_out_reg[1][15][0];
X_reg[2][15][1]<=MAC_out_reg[1][15][1];
X_reg[2][16][0]<=MAC_out_reg[1][16][0];
X_reg[2][16][1]<=MAC_out_reg[1][16][1];
X_reg[2][17][0]<=MAC_out_reg[1][17][0];
X_reg[2][17][1]<=MAC_out_reg[1][17][1];
X_reg[2][18][0]<=MAC_out_reg[1][18][0];
X_reg[2][18][1]<=MAC_out_reg[1][18][1];
X_reg[2][19][0]<=MAC_out_reg[1][19][0];
X_reg[2][19][1]<=MAC_out_reg[1][19][1];
X_reg[2][20][0]<=MAC_out_reg[1][20][0];
X_reg[2][20][1]<=MAC_out_reg[1][20][1];
X_reg[2][21][0]<=MAC_out_reg[1][21][0];
X_reg[2][21][1]<=MAC_out_reg[1][21][1];
X_reg[2][22][0]<=MAC_out_reg[1][22][0];
X_reg[2][22][1]<=MAC_out_reg[1][22][1];
X_reg[2][23][0]<=MAC_out_reg[1][23][0];
X_reg[2][23][1]<=MAC_out_reg[1][23][1];
X_reg[2][24][0]<=MAC_out_reg[1][24][0];
X_reg[2][24][1]<=MAC_out_reg[1][24][1];
X_reg[2][25][0]<=MAC_out_reg[1][25][0];
X_reg[2][25][1]<=MAC_out_reg[1][25][1];
X_reg[2][26][0]<=MAC_out_reg[1][26][0];
X_reg[2][26][1]<=MAC_out_reg[1][26][1];
X_reg[2][27][0]<=MAC_out_reg[1][27][0];
X_reg[2][27][1]<=MAC_out_reg[1][27][1];
X_reg[2][28][0]<=MAC_out_reg[1][28][0];
X_reg[2][28][1]<=MAC_out_reg[1][28][1];
X_reg[2][29][0]<=MAC_out_reg[1][29][0];
X_reg[2][29][1]<=MAC_out_reg[1][29][1];
X_reg[2][30][0]<=MAC_out_reg[1][30][0];
X_reg[2][30][1]<=MAC_out_reg[1][30][1];
X_reg[2][31][0]<=MAC_out_reg[1][31][0];
X_reg[2][31][1]<=MAC_out_reg[1][31][1];
X_reg[3][0][0]<=MAC_out_reg[2][0][0];
X_reg[3][0][1]<=MAC_out_reg[2][0][1];
X_reg[3][1][0]<=MAC_out_reg[2][1][0];
X_reg[3][1][1]<=MAC_out_reg[2][1][1];
X_reg[3][2][0]<=MAC_out_reg[2][2][0];
X_reg[3][2][1]<=MAC_out_reg[2][2][1];
X_reg[3][3][0]<=MAC_out_reg[2][3][0];
X_reg[3][3][1]<=MAC_out_reg[2][3][1];
X_reg[3][4][0]<=MAC_out_reg[2][4][0];
X_reg[3][4][1]<=MAC_out_reg[2][4][1];
X_reg[3][5][0]<=MAC_out_reg[2][5][0];
X_reg[3][5][1]<=MAC_out_reg[2][5][1];
X_reg[3][6][0]<=MAC_out_reg[2][6][0];
X_reg[3][6][1]<=MAC_out_reg[2][6][1];
X_reg[3][7][0]<=MAC_out_reg[2][7][0];
X_reg[3][7][1]<=MAC_out_reg[2][7][1];
X_reg[3][8][0]<=MAC_out_reg[2][8][0];
X_reg[3][8][1]<=MAC_out_reg[2][8][1];
X_reg[3][9][0]<=MAC_out_reg[2][9][0];
X_reg[3][9][1]<=MAC_out_reg[2][9][1];
X_reg[3][10][0]<=MAC_out_reg[2][10][0];
X_reg[3][10][1]<=MAC_out_reg[2][10][1];
X_reg[3][11][0]<=MAC_out_reg[2][11][0];
X_reg[3][11][1]<=MAC_out_reg[2][11][1];
X_reg[3][12][0]<=MAC_out_reg[2][12][0];
X_reg[3][12][1]<=MAC_out_reg[2][12][1];
X_reg[3][13][0]<=MAC_out_reg[2][13][0];
X_reg[3][13][1]<=MAC_out_reg[2][13][1];
X_reg[3][14][0]<=MAC_out_reg[2][14][0];
X_reg[3][14][1]<=MAC_out_reg[2][14][1];
X_reg[3][15][0]<=MAC_out_reg[2][15][0];
X_reg[3][15][1]<=MAC_out_reg[2][15][1];
X_reg[3][16][0]<=MAC_out_reg[2][16][0];
X_reg[3][16][1]<=MAC_out_reg[2][16][1];
X_reg[3][17][0]<=MAC_out_reg[2][17][0];
X_reg[3][17][1]<=MAC_out_reg[2][17][1];
X_reg[3][18][0]<=MAC_out_reg[2][18][0];
X_reg[3][18][1]<=MAC_out_reg[2][18][1];
X_reg[3][19][0]<=MAC_out_reg[2][19][0];
X_reg[3][19][1]<=MAC_out_reg[2][19][1];
X_reg[3][20][0]<=MAC_out_reg[2][20][0];
X_reg[3][20][1]<=MAC_out_reg[2][20][1];
X_reg[3][21][0]<=MAC_out_reg[2][21][0];
X_reg[3][21][1]<=MAC_out_reg[2][21][1];
X_reg[3][22][0]<=MAC_out_reg[2][22][0];
X_reg[3][22][1]<=MAC_out_reg[2][22][1];
X_reg[3][23][0]<=MAC_out_reg[2][23][0];
X_reg[3][23][1]<=MAC_out_reg[2][23][1];
X_reg[3][24][0]<=MAC_out_reg[2][24][0];
X_reg[3][24][1]<=MAC_out_reg[2][24][1];
X_reg[3][25][0]<=MAC_out_reg[2][25][0];
X_reg[3][25][1]<=MAC_out_reg[2][25][1];
X_reg[3][26][0]<=MAC_out_reg[2][26][0];
X_reg[3][26][1]<=MAC_out_reg[2][26][1];
X_reg[3][27][0]<=MAC_out_reg[2][27][0];
X_reg[3][27][1]<=MAC_out_reg[2][27][1];
X_reg[3][28][0]<=MAC_out_reg[2][28][0];
X_reg[3][28][1]<=MAC_out_reg[2][28][1];
X_reg[3][29][0]<=MAC_out_reg[2][29][0];
X_reg[3][29][1]<=MAC_out_reg[2][29][1];
X_reg[3][30][0]<=MAC_out_reg[2][30][0];
X_reg[3][30][1]<=MAC_out_reg[2][30][1];
X_reg[3][31][0]<=MAC_out_reg[2][31][0];
X_reg[3][31][1]<=MAC_out_reg[2][31][1];
X_reg[4][0][0]<=MAC_out_reg[3][0][0];
X_reg[4][0][1]<=MAC_out_reg[3][0][1];
X_reg[4][1][0]<=MAC_out_reg[3][1][0];
X_reg[4][1][1]<=MAC_out_reg[3][1][1];
X_reg[4][2][0]<=MAC_out_reg[3][2][0];
X_reg[4][2][1]<=MAC_out_reg[3][2][1];
X_reg[4][3][0]<=MAC_out_reg[3][3][0];
X_reg[4][3][1]<=MAC_out_reg[3][3][1];
X_reg[4][4][0]<=MAC_out_reg[3][4][0];
X_reg[4][4][1]<=MAC_out_reg[3][4][1];
X_reg[4][5][0]<=MAC_out_reg[3][5][0];
X_reg[4][5][1]<=MAC_out_reg[3][5][1];
X_reg[4][6][0]<=MAC_out_reg[3][6][0];
X_reg[4][6][1]<=MAC_out_reg[3][6][1];
X_reg[4][7][0]<=MAC_out_reg[3][7][0];
X_reg[4][7][1]<=MAC_out_reg[3][7][1];
X_reg[4][8][0]<=MAC_out_reg[3][8][0];
X_reg[4][8][1]<=MAC_out_reg[3][8][1];
X_reg[4][9][0]<=MAC_out_reg[3][9][0];
X_reg[4][9][1]<=MAC_out_reg[3][9][1];
X_reg[4][10][0]<=MAC_out_reg[3][10][0];
X_reg[4][10][1]<=MAC_out_reg[3][10][1];
X_reg[4][11][0]<=MAC_out_reg[3][11][0];
X_reg[4][11][1]<=MAC_out_reg[3][11][1];
X_reg[4][12][0]<=MAC_out_reg[3][12][0];
X_reg[4][12][1]<=MAC_out_reg[3][12][1];
X_reg[4][13][0]<=MAC_out_reg[3][13][0];
X_reg[4][13][1]<=MAC_out_reg[3][13][1];
X_reg[4][14][0]<=MAC_out_reg[3][14][0];
X_reg[4][14][1]<=MAC_out_reg[3][14][1];
X_reg[4][15][0]<=MAC_out_reg[3][15][0];
X_reg[4][15][1]<=MAC_out_reg[3][15][1];
X_reg[4][16][0]<=MAC_out_reg[3][16][0];
X_reg[4][16][1]<=MAC_out_reg[3][16][1];
X_reg[4][17][0]<=MAC_out_reg[3][17][0];
X_reg[4][17][1]<=MAC_out_reg[3][17][1];
X_reg[4][18][0]<=MAC_out_reg[3][18][0];
X_reg[4][18][1]<=MAC_out_reg[3][18][1];
X_reg[4][19][0]<=MAC_out_reg[3][19][0];
X_reg[4][19][1]<=MAC_out_reg[3][19][1];
X_reg[4][20][0]<=MAC_out_reg[3][20][0];
X_reg[4][20][1]<=MAC_out_reg[3][20][1];
X_reg[4][21][0]<=MAC_out_reg[3][21][0];
X_reg[4][21][1]<=MAC_out_reg[3][21][1];
X_reg[4][22][0]<=MAC_out_reg[3][22][0];
X_reg[4][22][1]<=MAC_out_reg[3][22][1];
X_reg[4][23][0]<=MAC_out_reg[3][23][0];
X_reg[4][23][1]<=MAC_out_reg[3][23][1];
X_reg[4][24][0]<=MAC_out_reg[3][24][0];
X_reg[4][24][1]<=MAC_out_reg[3][24][1];
X_reg[4][25][0]<=MAC_out_reg[3][25][0];
X_reg[4][25][1]<=MAC_out_reg[3][25][1];
X_reg[4][26][0]<=MAC_out_reg[3][26][0];
X_reg[4][26][1]<=MAC_out_reg[3][26][1];
X_reg[4][27][0]<=MAC_out_reg[3][27][0];
X_reg[4][27][1]<=MAC_out_reg[3][27][1];
X_reg[4][28][0]<=MAC_out_reg[3][28][0];
X_reg[4][28][1]<=MAC_out_reg[3][28][1];
X_reg[4][29][0]<=MAC_out_reg[3][29][0];
X_reg[4][29][1]<=MAC_out_reg[3][29][1];
X_reg[4][30][0]<=MAC_out_reg[3][30][0];
X_reg[4][30][1]<=MAC_out_reg[3][30][1];
X_reg[4][31][0]<=MAC_out_reg[3][31][0];
X_reg[4][31][1]<=MAC_out_reg[3][31][1];
X_reg[5][0][0]<=MAC_out_reg[4][0][0];
X_reg[5][0][1]<=MAC_out_reg[4][0][1];
X_reg[5][1][0]<=MAC_out_reg[4][1][0];
X_reg[5][1][1]<=MAC_out_reg[4][1][1];
X_reg[5][2][0]<=MAC_out_reg[4][2][0];
X_reg[5][2][1]<=MAC_out_reg[4][2][1];
X_reg[5][3][0]<=MAC_out_reg[4][3][0];
X_reg[5][3][1]<=MAC_out_reg[4][3][1];
X_reg[5][4][0]<=MAC_out_reg[4][4][0];
X_reg[5][4][1]<=MAC_out_reg[4][4][1];
X_reg[5][5][0]<=MAC_out_reg[4][5][0];
X_reg[5][5][1]<=MAC_out_reg[4][5][1];
X_reg[5][6][0]<=MAC_out_reg[4][6][0];
X_reg[5][6][1]<=MAC_out_reg[4][6][1];
X_reg[5][7][0]<=MAC_out_reg[4][7][0];
X_reg[5][7][1]<=MAC_out_reg[4][7][1];
X_reg[5][8][0]<=MAC_out_reg[4][8][0];
X_reg[5][8][1]<=MAC_out_reg[4][8][1];
X_reg[5][9][0]<=MAC_out_reg[4][9][0];
X_reg[5][9][1]<=MAC_out_reg[4][9][1];
X_reg[5][10][0]<=MAC_out_reg[4][10][0];
X_reg[5][10][1]<=MAC_out_reg[4][10][1];
X_reg[5][11][0]<=MAC_out_reg[4][11][0];
X_reg[5][11][1]<=MAC_out_reg[4][11][1];
X_reg[5][12][0]<=MAC_out_reg[4][12][0];
X_reg[5][12][1]<=MAC_out_reg[4][12][1];
X_reg[5][13][0]<=MAC_out_reg[4][13][0];
X_reg[5][13][1]<=MAC_out_reg[4][13][1];
X_reg[5][14][0]<=MAC_out_reg[4][14][0];
X_reg[5][14][1]<=MAC_out_reg[4][14][1];
X_reg[5][15][0]<=MAC_out_reg[4][15][0];
X_reg[5][15][1]<=MAC_out_reg[4][15][1];
X_reg[5][16][0]<=MAC_out_reg[4][16][0];
X_reg[5][16][1]<=MAC_out_reg[4][16][1];
X_reg[5][17][0]<=MAC_out_reg[4][17][0];
X_reg[5][17][1]<=MAC_out_reg[4][17][1];
X_reg[5][18][0]<=MAC_out_reg[4][18][0];
X_reg[5][18][1]<=MAC_out_reg[4][18][1];
X_reg[5][19][0]<=MAC_out_reg[4][19][0];
X_reg[5][19][1]<=MAC_out_reg[4][19][1];
X_reg[5][20][0]<=MAC_out_reg[4][20][0];
X_reg[5][20][1]<=MAC_out_reg[4][20][1];
X_reg[5][21][0]<=MAC_out_reg[4][21][0];
X_reg[5][21][1]<=MAC_out_reg[4][21][1];
X_reg[5][22][0]<=MAC_out_reg[4][22][0];
X_reg[5][22][1]<=MAC_out_reg[4][22][1];
X_reg[5][23][0]<=MAC_out_reg[4][23][0];
X_reg[5][23][1]<=MAC_out_reg[4][23][1];
X_reg[5][24][0]<=MAC_out_reg[4][24][0];
X_reg[5][24][1]<=MAC_out_reg[4][24][1];
X_reg[5][25][0]<=MAC_out_reg[4][25][0];
X_reg[5][25][1]<=MAC_out_reg[4][25][1];
X_reg[5][26][0]<=MAC_out_reg[4][26][0];
X_reg[5][26][1]<=MAC_out_reg[4][26][1];
X_reg[5][27][0]<=MAC_out_reg[4][27][0];
X_reg[5][27][1]<=MAC_out_reg[4][27][1];
X_reg[5][28][0]<=MAC_out_reg[4][28][0];
X_reg[5][28][1]<=MAC_out_reg[4][28][1];
X_reg[5][29][0]<=MAC_out_reg[4][29][0];
X_reg[5][29][1]<=MAC_out_reg[4][29][1];
X_reg[5][30][0]<=MAC_out_reg[4][30][0];
X_reg[5][30][1]<=MAC_out_reg[4][30][1];
X_reg[5][31][0]<=MAC_out_reg[4][31][0];
X_reg[5][31][1]<=MAC_out_reg[4][31][1];
end


always @(posedge clk1,posedge rst)
if(rst||Sel==79)
Sel<=0;
else
Sel<=Sel+1;

assign Xk_vect_real[255:248]=X_reg[5][0][0];
assign Xk_vect_imag[255:248]=X_reg[5][0][1];
assign Xk_vect_real[247:240]=X_reg[5][1][0];
assign Xk_vect_imag[247:240]=X_reg[5][1][1];
assign Xk_vect_real[239:232]=X_reg[5][2][0];
assign Xk_vect_imag[239:232]=X_reg[5][2][1];
assign Xk_vect_real[231:224]=X_reg[5][3][0];
assign Xk_vect_imag[231:224]=X_reg[5][3][1];
assign Xk_vect_real[223:216]=X_reg[5][4][0];
assign Xk_vect_imag[223:216]=X_reg[5][4][1];
assign Xk_vect_real[215:208]=X_reg[5][5][0];
assign Xk_vect_imag[215:208]=X_reg[5][5][1];
assign Xk_vect_real[207:200]=X_reg[5][6][0];
assign Xk_vect_imag[207:200]=X_reg[5][6][1];
assign Xk_vect_real[199:192]=X_reg[5][7][0];
assign Xk_vect_imag[199:192]=X_reg[5][7][1];
assign Xk_vect_real[191:184]=X_reg[5][8][0];
assign Xk_vect_imag[191:184]=X_reg[5][8][1];
assign Xk_vect_real[183:176]=X_reg[5][9][0];
assign Xk_vect_imag[183:176]=X_reg[5][9][1];
assign Xk_vect_real[175:168]=X_reg[5][10][0];
assign Xk_vect_imag[175:168]=X_reg[5][10][1];
assign Xk_vect_real[167:160]=X_reg[5][11][0];
assign Xk_vect_imag[167:160]=X_reg[5][11][1];
assign Xk_vect_real[159:152]=X_reg[5][12][0];
assign Xk_vect_imag[159:152]=X_reg[5][12][1];
assign Xk_vect_real[151:144]=X_reg[5][13][0];
assign Xk_vect_imag[151:144]=X_reg[5][13][1];
assign Xk_vect_real[143:136]=X_reg[5][14][0];
assign Xk_vect_imag[143:136]=X_reg[5][14][1];
assign Xk_vect_real[135:128]=X_reg[5][15][0];
assign Xk_vect_imag[135:128]=X_reg[5][15][1];
assign Xk_vect_real[127:120]=X_reg[5][16][0];
assign Xk_vect_imag[127:120]=X_reg[5][16][1];
assign Xk_vect_real[119:112]=X_reg[5][17][0];
assign Xk_vect_imag[119:112]=X_reg[5][17][1];
assign Xk_vect_real[111:104]=X_reg[5][18][0];
assign Xk_vect_imag[111:104]=X_reg[5][18][1];
assign Xk_vect_real[103:96]=X_reg[5][19][0];
assign Xk_vect_imag[103:96]=X_reg[5][19][1];
assign Xk_vect_real[95:88]=X_reg[5][20][0];
assign Xk_vect_imag[95:88]=X_reg[5][20][1];
assign Xk_vect_real[87:80]=X_reg[5][21][0];
assign Xk_vect_imag[87:80]=X_reg[5][21][1];
assign Xk_vect_real[79:72]=X_reg[5][22][0];
assign Xk_vect_imag[79:72]=X_reg[5][22][1];
assign Xk_vect_real[71:64]=X_reg[5][23][0];
assign Xk_vect_imag[71:64]=X_reg[5][23][1];
assign Xk_vect_real[63:56]=X_reg[5][24][0];
assign Xk_vect_imag[63:56]=X_reg[5][24][1];
assign Xk_vect_real[55:48]=X_reg[5][25][0];
assign Xk_vect_imag[55:48]=X_reg[5][25][1];
assign Xk_vect_real[47:40]=X_reg[5][26][0];
assign Xk_vect_imag[47:40]=X_reg[5][26][1];
assign Xk_vect_real[39:32]=X_reg[5][27][0];
assign Xk_vect_imag[39:32]=X_reg[5][27][1];
assign Xk_vect_real[31:24]=X_reg[5][28][0];
assign Xk_vect_imag[31:24]=X_reg[5][28][1];
assign Xk_vect_real[23:16]=X_reg[5][29][0];
assign Xk_vect_imag[23:16]=X_reg[5][29][1];
assign Xk_vect_real[15:8]=X_reg[5][30][0];
assign Xk_vect_imag[15:8]=X_reg[5][30][1];
assign Xk_vect_real[7:0]=X_reg[5][31][0];
assign Xk_vect_imag[7:0]=X_reg[5][31][1];

endmodule
`timescale 1ns / 1ps

module complex_mul
(input signed  [3:-4] in1r,in1j,in2r,in2j,
output signed  [3:-4] outr,outj);

wire signed [7:-8] real_ =(in1r*in2r)-(in1j*in2j);
wire signed [7:-8] img_  =(in1j*in2r)+(in1r*in2j);

assign outr  =real_[3:-4];
assign outj  =img_ [3:-4];

endmodule
`timescale 1ns / 1ps

module radix_2_fft
(input signed [3:-4] X1_real,X1_imag,X2_real,X2_imag,const_real,const_imag,
output signed [3:-4] Y1_real,Y1_imag,Y2_real,Y2_imag);

wire signed   [3:-4] mul_real,mul_imag;

complex_mul mul(X2_real,X2_imag,const_real,const_imag,mul_real,mul_imag);

assign Y1_real = X1_real + mul_real;
assign Y1_imag = X1_imag + mul_imag;
assign Y2_real = X1_real - mul_real;
assign Y2_imag = X1_imag - mul_imag;

endmodule
