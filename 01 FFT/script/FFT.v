`timescale 1ns / 1ps

module complex_mul
#(parameter  INT=4,DEC=4)
(input signed  [INT-1:-DEC] a,aj,b,bj,
output signed  [INT-1:-DEC] c,cj);

wire signed [2*INT-1:-2*DEC] real =(a*b)-(aj*bj);
wire signed [2*INT-1:-2*DEC] img  =(aj*b)+(a*bj);

assign c  =real[INT-1:-DEC];
assign cj =img [INT-1:-DEC];
endmodule
module radix_2_fft #(parameter  INT=4,DEC=4,FACTOR=1,FACTOR_IMAG=0)
(input signed [INT-1:-DEC] X1_real,X1_imag,X2_real,X2_imag,
output signed [INT-1:-DEC] Y1_real,Y1_imag,Y2_real,Y2_imag );
wire signed [INT-1:-DEC] mul_real,mul_imag;
complex_mul #(.INT(INT),.DEC(DEC))
mul (.a(X2_real),.aj(X2_imag),.b(FACTOR),.bj(FACTOR_IMAG),.c(mul_real),.cj(mul_imag));
assign Y1_real = X1_real + mul_real;
assign Y1_imag = X1_imag + mul_imag;
assign Y2_real = X1_real - mul_real;
assign Y2_imag = X1_imag - mul_imag; 
endmodule


module FFT_32 #(parameter  INT=4,DEC=4)
(input[32*8-1:0] Xn_vect_real,Xn_vect_imag,
output[32*8-1:0] Xk_vect_real,Xk_vect_imag,
input clk);

wire signed [INT-1:-DEC] X0_r [0:31] ,X0_i  [0:31];
wire signed [INT-1:-DEC] X1_r [0:31] ,X1_i  [0:31];
wire signed [INT-1:-DEC] X2_r [0:31] ,X2_i  [0:31];
wire signed [INT-1:-DEC] X3_r [0:31] ,X3_i  [0:31];
wire signed [INT-1:-DEC] X4_r [0:31] ,X4_i  [0:31];
wire signed [INT-1:-DEC] X5_r [0:31] ,X5_i  [0:31];


assign X0_r[0] =  Xn_vect_real[7:0];
assign X0_i[0] =  Xn_vect_imag[7:0] ;
assign X0_r[1] =  Xn_vect_real[15:8];
assign X0_i[1] =  Xn_vect_imag[15:8] ;
assign X0_r[2] =  Xn_vect_real[23:16];
assign X0_i[2] =  Xn_vect_imag[23:16] ;
assign X0_r[3] =  Xn_vect_real[31:24];
assign X0_i[3] =  Xn_vect_imag[31:24] ;
assign X0_r[4] =  Xn_vect_real[39:32];
assign X0_i[4] =  Xn_vect_imag[39:32] ;
assign X0_r[5] =  Xn_vect_real[47:40];
assign X0_i[5] =  Xn_vect_imag[47:40] ;
assign X0_r[6] =  Xn_vect_real[55:48];
assign X0_i[6] =  Xn_vect_imag[55:48] ;
assign X0_r[7] =  Xn_vect_real[63:56];
assign X0_i[7] =  Xn_vect_imag[63:56] ;
assign X0_r[8] =  Xn_vect_real[71:64];
assign X0_i[8] =  Xn_vect_imag[71:64] ;
assign X0_r[9] =  Xn_vect_real[79:72];
assign X0_i[9] =  Xn_vect_imag[79:72] ;
assign X0_r[10] =  Xn_vect_real[87:80];
assign X0_i[10] =  Xn_vect_imag[87:80] ;
assign X0_r[11] =  Xn_vect_real[95:88];
assign X0_i[11] =  Xn_vect_imag[95:88] ;
assign X0_r[12] =  Xn_vect_real[103:96];
assign X0_i[12] =  Xn_vect_imag[103:96] ;
assign X0_r[13] =  Xn_vect_real[111:104];
assign X0_i[13] =  Xn_vect_imag[111:104] ;
assign X0_r[14] =  Xn_vect_real[119:112];
assign X0_i[14] =  Xn_vect_imag[119:112] ;
assign X0_r[15] =  Xn_vect_real[127:120];
assign X0_i[15] =  Xn_vect_imag[127:120] ;
assign X0_r[16] =  Xn_vect_real[135:128];
assign X0_i[16] =  Xn_vect_imag[135:128] ;
assign X0_r[17] =  Xn_vect_real[143:136];
assign X0_i[17] =  Xn_vect_imag[143:136] ;
assign X0_r[18] =  Xn_vect_real[151:144];
assign X0_i[18] =  Xn_vect_imag[151:144] ;
assign X0_r[19] =  Xn_vect_real[159:152];
assign X0_i[19] =  Xn_vect_imag[159:152] ;
assign X0_r[20] =  Xn_vect_real[167:160];
assign X0_i[20] =  Xn_vect_imag[167:160] ;
assign X0_r[21] =  Xn_vect_real[175:168];
assign X0_i[21] =  Xn_vect_imag[175:168] ;
assign X0_r[22] =  Xn_vect_real[183:176];
assign X0_i[22] =  Xn_vect_imag[183:176] ;
assign X0_r[23] =  Xn_vect_real[191:184];
assign X0_i[23] =  Xn_vect_imag[191:184] ;
assign X0_r[24] =  Xn_vect_real[199:192];
assign X0_i[24] =  Xn_vect_imag[199:192] ;
assign X0_r[25] =  Xn_vect_real[207:200];
assign X0_i[25] =  Xn_vect_imag[207:200] ;
assign X0_r[26] =  Xn_vect_real[215:208];
assign X0_i[26] =  Xn_vect_imag[215:208] ;
assign X0_r[27] =  Xn_vect_real[223:216];
assign X0_i[27] =  Xn_vect_imag[223:216] ;
assign X0_r[28] =  Xn_vect_real[231:224];
assign X0_i[28] =  Xn_vect_imag[231:224] ;
assign X0_r[29] =  Xn_vect_real[239:232];
assign X0_i[29] =  Xn_vect_imag[239:232] ;
assign X0_r[30] =  Xn_vect_real[247:240];
assign X0_i[30] =  Xn_vect_imag[247:240] ;
assign X0_r[31] =  Xn_vect_real[255:248];
assign X0_i[31] =  Xn_vect_imag[255:248] ;



//######################### Layer:0 #########################

//Block Number:0
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_0(.X1_real(X0_r[0]) , .X1_imag(X0_i[0]) , 
.X2_real(X0_r[16]), .X2_imag(X0_i[16]), 
.Y1_real(X1_r[0]) , .Y1_imag(X1_i[0]), 
.Y2_real(X1_r[1]) , .Y2_imag(X1_i[1]));

//Block Number:1
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_1(.X1_real(X0_r[8]) , .X1_imag(X0_i[8]) , 
.X2_real(X0_r[24]), .X2_imag(X0_i[24]), 
.Y1_real(X1_r[2]) , .Y1_imag(X1_i[2]), 
.Y2_real(X1_r[3]) , .Y2_imag(X1_i[3]));

//Block Number:2
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_2(.X1_real(X0_r[4]) , .X1_imag(X0_i[4]) , 
.X2_real(X0_r[20]), .X2_imag(X0_i[20]), 
.Y1_real(X1_r[4]) , .Y1_imag(X1_i[4]), 
.Y2_real(X1_r[5]) , .Y2_imag(X1_i[5]));

//Block Number:3
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_3(.X1_real(X0_r[12]) , .X1_imag(X0_i[12]) , 
.X2_real(X0_r[28]), .X2_imag(X0_i[28]), 
.Y1_real(X1_r[6]) , .Y1_imag(X1_i[6]), 
.Y2_real(X1_r[7]) , .Y2_imag(X1_i[7]));

//Block Number:4
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_4(.X1_real(X0_r[2]) , .X1_imag(X0_i[2]) , 
.X2_real(X0_r[18]), .X2_imag(X0_i[18]), 
.Y1_real(X1_r[8]) , .Y1_imag(X1_i[8]), 
.Y2_real(X1_r[9]) , .Y2_imag(X1_i[9]));

//Block Number:5
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_5(.X1_real(X0_r[10]) , .X1_imag(X0_i[10]) , 
.X2_real(X0_r[26]), .X2_imag(X0_i[26]), 
.Y1_real(X1_r[10]) , .Y1_imag(X1_i[10]), 
.Y2_real(X1_r[11]) , .Y2_imag(X1_i[11]));

//Block Number:6
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_6(.X1_real(X0_r[6]) , .X1_imag(X0_i[6]) , 
.X2_real(X0_r[22]), .X2_imag(X0_i[22]), 
.Y1_real(X1_r[12]) , .Y1_imag(X1_i[12]), 
.Y2_real(X1_r[13]) , .Y2_imag(X1_i[13]));

//Block Number:7
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_7(.X1_real(X0_r[14]) , .X1_imag(X0_i[14]) , 
.X2_real(X0_r[30]), .X2_imag(X0_i[30]), 
.Y1_real(X1_r[14]) , .Y1_imag(X1_i[14]), 
.Y2_real(X1_r[15]) , .Y2_imag(X1_i[15]));

//Block Number:8
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_8(.X1_real(X0_r[1]) , .X1_imag(X0_i[1]) , 
.X2_real(X0_r[17]), .X2_imag(X0_i[17]), 
.Y1_real(X1_r[16]) , .Y1_imag(X1_i[16]), 
.Y2_real(X1_r[17]) , .Y2_imag(X1_i[17]));

//Block Number:9
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_9(.X1_real(X0_r[9]) , .X1_imag(X0_i[9]) , 
.X2_real(X0_r[25]), .X2_imag(X0_i[25]), 
.Y1_real(X1_r[18]) , .Y1_imag(X1_i[18]), 
.Y2_real(X1_r[19]) , .Y2_imag(X1_i[19]));

//Block Number:10
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_10(.X1_real(X0_r[5]) , .X1_imag(X0_i[5]) , 
.X2_real(X0_r[21]), .X2_imag(X0_i[21]), 
.Y1_real(X1_r[20]) , .Y1_imag(X1_i[20]), 
.Y2_real(X1_r[21]) , .Y2_imag(X1_i[21]));

//Block Number:11
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_11(.X1_real(X0_r[13]) , .X1_imag(X0_i[13]) , 
.X2_real(X0_r[29]), .X2_imag(X0_i[29]), 
.Y1_real(X1_r[22]) , .Y1_imag(X1_i[22]), 
.Y2_real(X1_r[23]) , .Y2_imag(X1_i[23]));

//Block Number:12
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_12(.X1_real(X0_r[3]) , .X1_imag(X0_i[3]) , 
.X2_real(X0_r[19]), .X2_imag(X0_i[19]), 
.Y1_real(X1_r[24]) , .Y1_imag(X1_i[24]), 
.Y2_real(X1_r[25]) , .Y2_imag(X1_i[25]));

//Block Number:13
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_13(.X1_real(X0_r[11]) , .X1_imag(X0_i[11]) , 
.X2_real(X0_r[27]), .X2_imag(X0_i[27]), 
.Y1_real(X1_r[26]) , .Y1_imag(X1_i[26]), 
.Y2_real(X1_r[27]) , .Y2_imag(X1_i[27]));

//Block Number:14
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_14(.X1_real(X0_r[7]) , .X1_imag(X0_i[7]) , 
.X2_real(X0_r[23]), .X2_imag(X0_i[23]), 
.Y1_real(X1_r[28]) , .Y1_imag(X1_i[28]), 
.Y2_real(X1_r[29]) , .Y2_imag(X1_i[29]));

//Block Number:15
radix_2_fft
#(.INT(INT), .DEC(DEC), .FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_0_15(.X1_real(X0_r[15]) , .X1_imag(X0_i[15]) , 
.X2_real(X0_r[31]), .X2_imag(X0_i[31]), 
.Y1_real(X1_r[30]) , .Y1_imag(X1_i[30]), 
.Y2_real(X1_r[31]) , .Y2_imag(X1_i[31]));

//######################### Layer:1 #########################

//Block Number:1
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_1_1(.X1_real(X1_r[0]) , .X1_imag(X1_i[0]) ,
.X2_real(X1_r[2]), .X2_imag(X1_i[2]) ,
.Y1_real(X2_r[0]) , .Y1_imag(X2_i[0]),.Y2_real(X2_r[2]) , .Y2_imag(X2_i[2]));

//Block Number:2
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_1_2(.X1_real(X1_r[1]) , .X1_imag(X1_i[1]) ,
.X2_real(X1_r[3]), .X2_imag(X1_i[3]) ,
.Y1_real(X2_r[1]) , .Y1_imag(X2_i[1]),.Y2_real(X2_r[3]) , .Y2_imag(X2_i[3]));

//Block Number:3
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_1_3(.X1_real(X1_r[4]) , .X1_imag(X1_i[4]) ,
.X2_real(X1_r[6]), .X2_imag(X1_i[6]) ,
.Y1_real(X2_r[4]) , .Y1_imag(X2_i[4]),.Y2_real(X2_r[6]) , .Y2_imag(X2_i[6]));

//Block Number:4
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_1_4(.X1_real(X1_r[5]) , .X1_imag(X1_i[5]) ,
.X2_real(X1_r[7]), .X2_imag(X1_i[7]) ,
.Y1_real(X2_r[5]) , .Y1_imag(X2_i[5]),.Y2_real(X2_r[7]) , .Y2_imag(X2_i[7]));

//Block Number:5
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_1_5(.X1_real(X1_r[8]) , .X1_imag(X1_i[8]) ,
.X2_real(X1_r[10]), .X2_imag(X1_i[10]) ,
.Y1_real(X2_r[8]) , .Y1_imag(X2_i[8]),.Y2_real(X2_r[10]) , .Y2_imag(X2_i[10]));

//Block Number:6
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_1_6(.X1_real(X1_r[9]) , .X1_imag(X1_i[9]) ,
.X2_real(X1_r[11]), .X2_imag(X1_i[11]) ,
.Y1_real(X2_r[9]) , .Y1_imag(X2_i[9]),.Y2_real(X2_r[11]) , .Y2_imag(X2_i[11]));

//Block Number:7
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_1_7(.X1_real(X1_r[12]) , .X1_imag(X1_i[12]) ,
.X2_real(X1_r[14]), .X2_imag(X1_i[14]) ,
.Y1_real(X2_r[12]) , .Y1_imag(X2_i[12]),.Y2_real(X2_r[14]) , .Y2_imag(X2_i[14]));

//Block Number:8
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_1_8(.X1_real(X1_r[13]) , .X1_imag(X1_i[13]) ,
.X2_real(X1_r[15]), .X2_imag(X1_i[15]) ,
.Y1_real(X2_r[13]) , .Y1_imag(X2_i[13]),.Y2_real(X2_r[15]) , .Y2_imag(X2_i[15]));

//Block Number:9
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_1_9(.X1_real(X1_r[16]) , .X1_imag(X1_i[16]) ,
.X2_real(X1_r[18]), .X2_imag(X1_i[18]) ,
.Y1_real(X2_r[16]) , .Y1_imag(X2_i[16]),.Y2_real(X2_r[18]) , .Y2_imag(X2_i[18]));

//Block Number:10
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_1_10(.X1_real(X1_r[17]) , .X1_imag(X1_i[17]) ,
.X2_real(X1_r[19]), .X2_imag(X1_i[19]) ,
.Y1_real(X2_r[17]) , .Y1_imag(X2_i[17]),.Y2_real(X2_r[19]) , .Y2_imag(X2_i[19]));

//Block Number:11
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_1_11(.X1_real(X1_r[20]) , .X1_imag(X1_i[20]) ,
.X2_real(X1_r[22]), .X2_imag(X1_i[22]) ,
.Y1_real(X2_r[20]) , .Y1_imag(X2_i[20]),.Y2_real(X2_r[22]) , .Y2_imag(X2_i[22]));

//Block Number:12
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_1_12(.X1_real(X1_r[21]) , .X1_imag(X1_i[21]) ,
.X2_real(X1_r[23]), .X2_imag(X1_i[23]) ,
.Y1_real(X2_r[21]) , .Y1_imag(X2_i[21]),.Y2_real(X2_r[23]) , .Y2_imag(X2_i[23]));

//Block Number:13
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_1_13(.X1_real(X1_r[24]) , .X1_imag(X1_i[24]) ,
.X2_real(X1_r[26]), .X2_imag(X1_i[26]) ,
.Y1_real(X2_r[24]) , .Y1_imag(X2_i[24]),.Y2_real(X2_r[26]) , .Y2_imag(X2_i[26]));

//Block Number:14
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_1_14(.X1_real(X1_r[25]) , .X1_imag(X1_i[25]) ,
.X2_real(X1_r[27]), .X2_imag(X1_i[27]) ,
.Y1_real(X2_r[25]) , .Y1_imag(X2_i[25]),.Y2_real(X2_r[27]) , .Y2_imag(X2_i[27]));

//Block Number:15
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_1_15(.X1_real(X1_r[28]) , .X1_imag(X1_i[28]) ,
.X2_real(X1_r[30]), .X2_imag(X1_i[30]) ,
.Y1_real(X2_r[28]) , .Y1_imag(X2_i[28]),.Y2_real(X2_r[30]) , .Y2_imag(X2_i[30]));

//Block Number:16
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_1_16(.X1_real(X1_r[29]) , .X1_imag(X1_i[29]) ,
.X2_real(X1_r[31]), .X2_imag(X1_i[31]) ,
.Y1_real(X2_r[29]) , .Y1_imag(X2_i[29]),.Y2_real(X2_r[31]) , .Y2_imag(X2_i[31]));

//######################### Layer:2 #########################

//Block Number:1
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_2_1(.X1_real(X2_r[0]) , .X1_imag(X2_i[0]) ,
.X2_real(X2_r[4]), .X2_imag(X2_i[4]) ,
.Y1_real(X3_r[0]) , .Y1_imag(X3_i[0]),.Y2_real(X3_r[4]) , .Y2_imag(X3_i[4]));

//Block Number:2
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1011), .FACTOR_IMAG(8'b1111_0101))
UUT_2_2(.X1_real(X2_r[1]) , .X1_imag(X2_i[1]) ,
.X2_real(X2_r[5]), .X2_imag(X2_i[5]) ,
.Y1_real(X3_r[1]) , .Y1_imag(X3_i[1]),.Y2_real(X3_r[5]) , .Y2_imag(X3_i[5]));

//Block Number:3
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_2_3(.X1_real(X2_r[2]) , .X1_imag(X2_i[2]) ,
.X2_real(X2_r[6]), .X2_imag(X2_i[6]) ,
.Y1_real(X3_r[2]) , .Y1_imag(X3_i[2]),.Y2_real(X3_r[6]) , .Y2_imag(X3_i[6]));

//Block Number:4
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0101), .FACTOR_IMAG(8'b1111_0101))
UUT_2_4(.X1_real(X2_r[3]) , .X1_imag(X2_i[3]) ,
.X2_real(X2_r[7]), .X2_imag(X2_i[7]) ,
.Y1_real(X3_r[3]) , .Y1_imag(X3_i[3]),.Y2_real(X3_r[7]) , .Y2_imag(X3_i[7]));

//Block Number:5
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_2_5(.X1_real(X2_r[8]) , .X1_imag(X2_i[8]) ,
.X2_real(X2_r[12]), .X2_imag(X2_i[12]) ,
.Y1_real(X3_r[8]) , .Y1_imag(X3_i[8]),.Y2_real(X3_r[12]) , .Y2_imag(X3_i[12]));

//Block Number:6
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1011), .FACTOR_IMAG(8'b1111_0101))
UUT_2_6(.X1_real(X2_r[9]) , .X1_imag(X2_i[9]) ,
.X2_real(X2_r[13]), .X2_imag(X2_i[13]) ,
.Y1_real(X3_r[9]) , .Y1_imag(X3_i[9]),.Y2_real(X3_r[13]) , .Y2_imag(X3_i[13]));

//Block Number:7
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_2_7(.X1_real(X2_r[10]) , .X1_imag(X2_i[10]) ,
.X2_real(X2_r[14]), .X2_imag(X2_i[14]) ,
.Y1_real(X3_r[10]) , .Y1_imag(X3_i[10]),.Y2_real(X3_r[14]) , .Y2_imag(X3_i[14]));

//Block Number:8
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0101), .FACTOR_IMAG(8'b1111_0101))
UUT_2_8(.X1_real(X2_r[11]) , .X1_imag(X2_i[11]) ,
.X2_real(X2_r[15]), .X2_imag(X2_i[15]) ,
.Y1_real(X3_r[11]) , .Y1_imag(X3_i[11]),.Y2_real(X3_r[15]) , .Y2_imag(X3_i[15]));

//Block Number:9
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_2_9(.X1_real(X2_r[16]) , .X1_imag(X2_i[16]) ,
.X2_real(X2_r[20]), .X2_imag(X2_i[20]) ,
.Y1_real(X3_r[16]) , .Y1_imag(X3_i[16]),.Y2_real(X3_r[20]) , .Y2_imag(X3_i[20]));

//Block Number:10
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1011), .FACTOR_IMAG(8'b1111_0101))
UUT_2_10(.X1_real(X2_r[17]) , .X1_imag(X2_i[17]) ,
.X2_real(X2_r[21]), .X2_imag(X2_i[21]) ,
.Y1_real(X3_r[17]) , .Y1_imag(X3_i[17]),.Y2_real(X3_r[21]) , .Y2_imag(X3_i[21]));

//Block Number:11
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_2_11(.X1_real(X2_r[18]) , .X1_imag(X2_i[18]) ,
.X2_real(X2_r[22]), .X2_imag(X2_i[22]) ,
.Y1_real(X3_r[18]) , .Y1_imag(X3_i[18]),.Y2_real(X3_r[22]) , .Y2_imag(X3_i[22]));

//Block Number:12
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0101), .FACTOR_IMAG(8'b1111_0101))
UUT_2_12(.X1_real(X2_r[19]) , .X1_imag(X2_i[19]) ,
.X2_real(X2_r[23]), .X2_imag(X2_i[23]) ,
.Y1_real(X3_r[19]) , .Y1_imag(X3_i[19]),.Y2_real(X3_r[23]) , .Y2_imag(X3_i[23]));

//Block Number:13
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_2_13(.X1_real(X2_r[24]) , .X1_imag(X2_i[24]) ,
.X2_real(X2_r[28]), .X2_imag(X2_i[28]) ,
.Y1_real(X3_r[24]) , .Y1_imag(X3_i[24]),.Y2_real(X3_r[28]) , .Y2_imag(X3_i[28]));

//Block Number:14
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1011), .FACTOR_IMAG(8'b1111_0101))
UUT_2_14(.X1_real(X2_r[25]) , .X1_imag(X2_i[25]) ,
.X2_real(X2_r[29]), .X2_imag(X2_i[29]) ,
.Y1_real(X3_r[25]) , .Y1_imag(X3_i[25]),.Y2_real(X3_r[29]) , .Y2_imag(X3_i[29]));

//Block Number:15
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_2_15(.X1_real(X2_r[26]) , .X1_imag(X2_i[26]) ,
.X2_real(X2_r[30]), .X2_imag(X2_i[30]) ,
.Y1_real(X3_r[26]) , .Y1_imag(X3_i[26]),.Y2_real(X3_r[30]) , .Y2_imag(X3_i[30]));

//Block Number:16
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0101), .FACTOR_IMAG(8'b1111_0101))
UUT_2_16(.X1_real(X2_r[27]) , .X1_imag(X2_i[27]) ,
.X2_real(X2_r[31]), .X2_imag(X2_i[31]) ,
.Y1_real(X3_r[27]) , .Y1_imag(X3_i[27]),.Y2_real(X3_r[31]) , .Y2_imag(X3_i[31]));

//######################### Layer:3 #########################

//Block Number:1
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_3_1(.X1_real(X3_r[0]) , .X1_imag(X3_i[0]) ,
.X2_real(X3_r[8]), .X2_imag(X3_i[8]) ,
.Y1_real(X4_r[0]) , .Y1_imag(X4_i[0]),.Y2_real(X4_r[8]) , .Y2_imag(X4_i[8]));

//Block Number:2
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1110), .FACTOR_IMAG(8'b1111_1010))
UUT_3_2(.X1_real(X3_r[1]) , .X1_imag(X3_i[1]) ,
.X2_real(X3_r[9]), .X2_imag(X3_i[9]) ,
.Y1_real(X4_r[1]) , .Y1_imag(X4_i[1]),.Y2_real(X4_r[9]) , .Y2_imag(X4_i[9]));

//Block Number:3
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1011), .FACTOR_IMAG(8'b1111_0101))
UUT_3_3(.X1_real(X3_r[2]) , .X1_imag(X3_i[2]) ,
.X2_real(X3_r[10]), .X2_imag(X3_i[10]) ,
.Y1_real(X4_r[2]) , .Y1_imag(X4_i[2]),.Y2_real(X4_r[10]) , .Y2_imag(X4_i[10]));

//Block Number:4
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0110), .FACTOR_IMAG(8'b1111_0010))
UUT_3_4(.X1_real(X3_r[3]) , .X1_imag(X3_i[3]) ,
.X2_real(X3_r[11]), .X2_imag(X3_i[11]) ,
.Y1_real(X4_r[3]) , .Y1_imag(X4_i[3]),.Y2_real(X4_r[11]) , .Y2_imag(X4_i[11]));

//Block Number:5
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_3_5(.X1_real(X3_r[4]) , .X1_imag(X3_i[4]) ,
.X2_real(X3_r[12]), .X2_imag(X3_i[12]) ,
.Y1_real(X4_r[4]) , .Y1_imag(X4_i[4]),.Y2_real(X4_r[12]) , .Y2_imag(X4_i[12]));

//Block Number:6
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_1010), .FACTOR_IMAG(8'b1111_0010))
UUT_3_6(.X1_real(X3_r[5]) , .X1_imag(X3_i[5]) ,
.X2_real(X3_r[13]), .X2_imag(X3_i[13]) ,
.Y1_real(X4_r[5]) , .Y1_imag(X4_i[5]),.Y2_real(X4_r[13]) , .Y2_imag(X4_i[13]));

//Block Number:7
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0101), .FACTOR_IMAG(8'b1111_0101))
UUT_3_7(.X1_real(X3_r[6]) , .X1_imag(X3_i[6]) ,
.X2_real(X3_r[14]), .X2_imag(X3_i[14]) ,
.Y1_real(X4_r[6]) , .Y1_imag(X4_i[6]),.Y2_real(X4_r[14]) , .Y2_imag(X4_i[14]));

//Block Number:8
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0010), .FACTOR_IMAG(8'b1111_1010))
UUT_3_8(.X1_real(X3_r[7]) , .X1_imag(X3_i[7]) ,
.X2_real(X3_r[15]), .X2_imag(X3_i[15]) ,
.Y1_real(X4_r[7]) , .Y1_imag(X4_i[7]),.Y2_real(X4_r[15]) , .Y2_imag(X4_i[15]));

//Block Number:9
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_3_9(.X1_real(X3_r[16]) , .X1_imag(X3_i[16]) ,
.X2_real(X3_r[24]), .X2_imag(X3_i[24]) ,
.Y1_real(X4_r[16]) , .Y1_imag(X4_i[16]),.Y2_real(X4_r[24]) , .Y2_imag(X4_i[24]));

//Block Number:10
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1110), .FACTOR_IMAG(8'b1111_1010))
UUT_3_10(.X1_real(X3_r[17]) , .X1_imag(X3_i[17]) ,
.X2_real(X3_r[25]), .X2_imag(X3_i[25]) ,
.Y1_real(X4_r[17]) , .Y1_imag(X4_i[17]),.Y2_real(X4_r[25]) , .Y2_imag(X4_i[25]));

//Block Number:11
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1011), .FACTOR_IMAG(8'b1111_0101))
UUT_3_11(.X1_real(X3_r[18]) , .X1_imag(X3_i[18]) ,
.X2_real(X3_r[26]), .X2_imag(X3_i[26]) ,
.Y1_real(X4_r[18]) , .Y1_imag(X4_i[18]),.Y2_real(X4_r[26]) , .Y2_imag(X4_i[26]));

//Block Number:12
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0110), .FACTOR_IMAG(8'b1111_0010))
UUT_3_12(.X1_real(X3_r[19]) , .X1_imag(X3_i[19]) ,
.X2_real(X3_r[27]), .X2_imag(X3_i[27]) ,
.Y1_real(X4_r[19]) , .Y1_imag(X4_i[19]),.Y2_real(X4_r[27]) , .Y2_imag(X4_i[27]));

//Block Number:13
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_3_13(.X1_real(X3_r[20]) , .X1_imag(X3_i[20]) ,
.X2_real(X3_r[28]), .X2_imag(X3_i[28]) ,
.Y1_real(X4_r[20]) , .Y1_imag(X4_i[20]),.Y2_real(X4_r[28]) , .Y2_imag(X4_i[28]));

//Block Number:14
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_1010), .FACTOR_IMAG(8'b1111_0010))
UUT_3_14(.X1_real(X3_r[21]) , .X1_imag(X3_i[21]) ,
.X2_real(X3_r[29]), .X2_imag(X3_i[29]) ,
.Y1_real(X4_r[21]) , .Y1_imag(X4_i[21]),.Y2_real(X4_r[29]) , .Y2_imag(X4_i[29]));

//Block Number:15
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0101), .FACTOR_IMAG(8'b1111_0101))
UUT_3_15(.X1_real(X3_r[22]) , .X1_imag(X3_i[22]) ,
.X2_real(X3_r[30]), .X2_imag(X3_i[30]) ,
.Y1_real(X4_r[22]) , .Y1_imag(X4_i[22]),.Y2_real(X4_r[30]) , .Y2_imag(X4_i[30]));

//Block Number:16
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0010), .FACTOR_IMAG(8'b1111_1010))
UUT_3_16(.X1_real(X3_r[23]) , .X1_imag(X3_i[23]) ,
.X2_real(X3_r[31]), .X2_imag(X3_i[31]) ,
.Y1_real(X4_r[23]) , .Y1_imag(X4_i[23]),.Y2_real(X4_r[31]) , .Y2_imag(X4_i[31]));

//######################### Layer:4 #########################

//Block Number:1
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0001_0000), .FACTOR_IMAG(8'b0000_0000))
UUT_4_1(.X1_real(X4_r[0]) , .X1_imag(X4_i[0]) ,
.X2_real(X4_r[16]), .X2_imag(X4_i[16]) ,
.Y1_real(X5_r[0]) , .Y1_imag(X5_i[0]),.Y2_real(X5_r[16]) , .Y2_imag(X5_i[16]));

//Block Number:2
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1111), .FACTOR_IMAG(8'b1111_1101))
UUT_4_2(.X1_real(X4_r[1]) , .X1_imag(X4_i[1]) ,
.X2_real(X4_r[17]), .X2_imag(X4_i[17]) ,
.Y1_real(X5_r[1]) , .Y1_imag(X5_i[1]),.Y2_real(X5_r[17]) , .Y2_imag(X5_i[17]));

//Block Number:3
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1110), .FACTOR_IMAG(8'b1111_1010))
UUT_4_3(.X1_real(X4_r[2]) , .X1_imag(X4_i[2]) ,
.X2_real(X4_r[18]), .X2_imag(X4_i[18]) ,
.Y1_real(X5_r[2]) , .Y1_imag(X5_i[2]),.Y2_real(X5_r[18]) , .Y2_imag(X5_i[18]));

//Block Number:4
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1101), .FACTOR_IMAG(8'b1111_1000))
UUT_4_4(.X1_real(X4_r[3]) , .X1_imag(X4_i[3]) ,
.X2_real(X4_r[19]), .X2_imag(X4_i[19]) ,
.Y1_real(X5_r[3]) , .Y1_imag(X5_i[3]),.Y2_real(X5_r[19]) , .Y2_imag(X5_i[19]));

//Block Number:5
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1011), .FACTOR_IMAG(8'b1111_0101))
UUT_4_5(.X1_real(X4_r[4]) , .X1_imag(X4_i[4]) ,
.X2_real(X4_r[20]), .X2_imag(X4_i[20]) ,
.Y1_real(X5_r[4]) , .Y1_imag(X5_i[4]),.Y2_real(X5_r[20]) , .Y2_imag(X5_i[20]));

//Block Number:6
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_1000), .FACTOR_IMAG(8'b1111_0011))
UUT_4_6(.X1_real(X4_r[5]) , .X1_imag(X4_i[5]) ,
.X2_real(X4_r[21]), .X2_imag(X4_i[21]) ,
.Y1_real(X5_r[5]) , .Y1_imag(X5_i[5]),.Y2_real(X5_r[21]) , .Y2_imag(X5_i[21]));

//Block Number:7
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0110), .FACTOR_IMAG(8'b1111_0010))
UUT_4_7(.X1_real(X4_r[6]) , .X1_imag(X4_i[6]) ,
.X2_real(X4_r[22]), .X2_imag(X4_i[22]) ,
.Y1_real(X5_r[6]) , .Y1_imag(X5_i[6]),.Y2_real(X5_r[22]) , .Y2_imag(X5_i[22]));

//Block Number:8
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0011), .FACTOR_IMAG(8'b1111_0001))
UUT_4_8(.X1_real(X4_r[7]) , .X1_imag(X4_i[7]) ,
.X2_real(X4_r[23]), .X2_imag(X4_i[23]) ,
.Y1_real(X5_r[7]) , .Y1_imag(X5_i[7]),.Y2_real(X5_r[23]) , .Y2_imag(X5_i[23]));

//Block Number:9
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b0000_0000), .FACTOR_IMAG(8'b1111_0000))
UUT_4_9(.X1_real(X4_r[8]) , .X1_imag(X4_i[8]) ,
.X2_real(X4_r[24]), .X2_imag(X4_i[24]) ,
.Y1_real(X5_r[8]) , .Y1_imag(X5_i[8]),.Y2_real(X5_r[24]) , .Y2_imag(X5_i[24]));

//Block Number:10
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_1101), .FACTOR_IMAG(8'b1111_0001))
UUT_4_10(.X1_real(X4_r[9]) , .X1_imag(X4_i[9]) ,
.X2_real(X4_r[25]), .X2_imag(X4_i[25]) ,
.Y1_real(X5_r[9]) , .Y1_imag(X5_i[9]),.Y2_real(X5_r[25]) , .Y2_imag(X5_i[25]));

//Block Number:11
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_1010), .FACTOR_IMAG(8'b1111_0010))
UUT_4_11(.X1_real(X4_r[10]) , .X1_imag(X4_i[10]) ,
.X2_real(X4_r[26]), .X2_imag(X4_i[26]) ,
.Y1_real(X5_r[10]) , .Y1_imag(X5_i[10]),.Y2_real(X5_r[26]) , .Y2_imag(X5_i[26]));

//Block Number:12
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_1000), .FACTOR_IMAG(8'b1111_0011))
UUT_4_12(.X1_real(X4_r[11]) , .X1_imag(X4_i[11]) ,
.X2_real(X4_r[27]), .X2_imag(X4_i[27]) ,
.Y1_real(X5_r[11]) , .Y1_imag(X5_i[11]),.Y2_real(X5_r[27]) , .Y2_imag(X5_i[27]));

//Block Number:13
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0101), .FACTOR_IMAG(8'b1111_0101))
UUT_4_13(.X1_real(X4_r[12]) , .X1_imag(X4_i[12]) ,
.X2_real(X4_r[28]), .X2_imag(X4_i[28]) ,
.Y1_real(X5_r[12]) , .Y1_imag(X5_i[12]),.Y2_real(X5_r[28]) , .Y2_imag(X5_i[28]));

//Block Number:14
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0011), .FACTOR_IMAG(8'b1111_1000))
UUT_4_14(.X1_real(X4_r[13]) , .X1_imag(X4_i[13]) ,
.X2_real(X4_r[29]), .X2_imag(X4_i[29]) ,
.Y1_real(X5_r[13]) , .Y1_imag(X5_i[13]),.Y2_real(X5_r[29]) , .Y2_imag(X5_i[29]));

//Block Number:15
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0010), .FACTOR_IMAG(8'b1111_1010))
UUT_4_15(.X1_real(X4_r[14]) , .X1_imag(X4_i[14]) ,
.X2_real(X4_r[30]), .X2_imag(X4_i[30]) ,
.Y1_real(X5_r[14]) , .Y1_imag(X5_i[14]),.Y2_real(X5_r[30]) , .Y2_imag(X5_i[30]));

//Block Number:16
radix_2_fft
#(.INT(INT), .DEC(DEC),
.FACTOR(8'b1111_0001), .FACTOR_IMAG(8'b1111_1101))
UUT_4_16(.X1_real(X4_r[15]) , .X1_imag(X4_i[15]) ,
.X2_real(X4_r[31]), .X2_imag(X4_i[31]) ,
.Y1_real(X5_r[15]) , .Y1_imag(X5_i[15]),.Y2_real(X5_r[31]) , .Y2_imag(X5_i[31]));


assign Xk_vect_real[7:0] =  X5_r[0];
assign  Xk_vect_imag[7:0] = X5_i[0] ;
assign Xk_vect_real[15:8] =  X5_r[1];
assign  Xk_vect_imag[15:8] = X5_i[1] ;
assign Xk_vect_real[23:16] =  X5_r[2];
assign  Xk_vect_imag[23:16] = X5_i[2] ;
assign Xk_vect_real[31:24] =  X5_r[3];
assign  Xk_vect_imag[31:24] = X5_i[3] ;
assign Xk_vect_real[39:32] =  X5_r[4];
assign  Xk_vect_imag[39:32] = X5_i[4] ;
assign Xk_vect_real[47:40] =  X5_r[5];
assign  Xk_vect_imag[47:40] = X5_i[5] ;
assign Xk_vect_real[55:48] =  X5_r[6];
assign  Xk_vect_imag[55:48] = X5_i[6] ;
assign Xk_vect_real[63:56] =  X5_r[7];
assign  Xk_vect_imag[63:56] = X5_i[7] ;
assign Xk_vect_real[71:64] =  X5_r[8];
assign  Xk_vect_imag[71:64] = X5_i[8] ;
assign Xk_vect_real[79:72] =  X5_r[9];
assign  Xk_vect_imag[79:72] = X5_i[9] ;
assign Xk_vect_real[87:80] =  X5_r[10];
assign  Xk_vect_imag[87:80] = X5_i[10] ;
assign Xk_vect_real[95:88] =  X5_r[11];
assign  Xk_vect_imag[95:88] = X5_i[11] ;
assign Xk_vect_real[103:96] =  X5_r[12];
assign  Xk_vect_imag[103:96] = X5_i[12] ;
assign Xk_vect_real[111:104] =  X5_r[13];
assign  Xk_vect_imag[111:104] = X5_i[13] ;
assign Xk_vect_real[119:112] =  X5_r[14];
assign  Xk_vect_imag[119:112] = X5_i[14] ;
assign Xk_vect_real[127:120] =  X5_r[15];
assign  Xk_vect_imag[127:120] = X5_i[15] ;
assign Xk_vect_real[135:128] =  X5_r[16];
assign  Xk_vect_imag[135:128] = X5_i[16] ;
assign Xk_vect_real[143:136] =  X5_r[17];
assign  Xk_vect_imag[143:136] = X5_i[17] ;
assign Xk_vect_real[151:144] =  X5_r[18];
assign  Xk_vect_imag[151:144] = X5_i[18] ;
assign Xk_vect_real[159:152] =  X5_r[19];
assign  Xk_vect_imag[159:152] = X5_i[19] ;
assign Xk_vect_real[167:160] =  X5_r[20];
assign  Xk_vect_imag[167:160] = X5_i[20] ;
assign Xk_vect_real[175:168] =  X5_r[21];
assign  Xk_vect_imag[175:168] = X5_i[21] ;
assign Xk_vect_real[183:176] =  X5_r[22];
assign  Xk_vect_imag[183:176] = X5_i[22] ;
assign Xk_vect_real[191:184] =  X5_r[23];
assign  Xk_vect_imag[191:184] = X5_i[23] ;
assign Xk_vect_real[199:192] =  X5_r[24];
assign  Xk_vect_imag[199:192] = X5_i[24] ;
assign Xk_vect_real[207:200] =  X5_r[25];
assign  Xk_vect_imag[207:200] = X5_i[25] ;
assign Xk_vect_real[215:208] =  X5_r[26];
assign  Xk_vect_imag[215:208] = X5_i[26] ;
assign Xk_vect_real[223:216] =  X5_r[27];
assign  Xk_vect_imag[223:216] = X5_i[27] ;
assign Xk_vect_real[231:224] =  X5_r[28];
assign  Xk_vect_imag[231:224] = X5_i[28] ;
assign Xk_vect_real[239:232] =  X5_r[29];
assign  Xk_vect_imag[239:232] = X5_i[29] ;
assign Xk_vect_real[247:240] =  X5_r[30];
assign  Xk_vect_imag[247:240] = X5_i[30] ;
assign Xk_vect_real[255:248] =  X5_r[31];
assign  Xk_vect_imag[255:248] = X5_i[31] ;


endmodule