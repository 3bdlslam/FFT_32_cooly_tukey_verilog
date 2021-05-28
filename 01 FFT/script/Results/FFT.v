`timescale 1ns / 1ps

module FFT
(input [31:0] Xn_vect_real,Xn_vect_imag,
input clk1,clk2,rst,
output [31:0] Xk_vect_real,Xk_vect_imag);

wire signed [3:-4] X0 [0:3][0:1];
wire signed [3:-4] MAC_out [0:1][0:1][0:1];
reg  signed [3:-4] MAC_in  [0:1][0:2][0:1];
reg  signed [3:-4] X_reg [0:2][0:3][0:1];
reg  [0:0] Sel;
reg  signed [3:-4] MAC_out_reg [0:1][0:3][0:1];

assign X0[0][0]=Xn_vect_real[31:24];
assign X0[0][1]=Xn_vect_imag[31:24];
assign X0[1][0]=Xn_vect_real[15:8];
assign X0[1][1]=Xn_vect_imag[15:8];
assign X0[2][0]=Xn_vect_real[23:16];
assign X0[2][1]=Xn_vect_imag[23:16];
assign X0[3][0]=Xn_vect_real[7:0];
assign X0[3][1]=Xn_vect_imag[7:0];

radix_2_fft r2_0
(MAC_in[0][0][0],MAC_in [0][0][1],
MAC_in [0][1][0],MAC_in [0][1][1],
MAC_in [0][2][0],MAC_in [0][2][1],
MAC_out[0][0][0],MAC_out[0][0][1],
MAC_out[0][1][0],MAC_out[0][1][1]);
radix_2_fft r2_1
(MAC_in[1][0][0],MAC_in [1][0][1],
MAC_in [1][1][0],MAC_in [1][1][1],
MAC_in [1][2][0],MAC_in [1][2][1],
MAC_out[1][0][0],MAC_out[1][0][1],
MAC_out[1][1][0],MAC_out[1][1][1]);

always @(posedge clk1) begin
if(Sel==0) begin
MAC_in[0][0][0]<=X_reg[0][0][0];
MAC_in[0][0][1]<=X_reg[0][0][1];
MAC_in[0][1][0]<=X_reg[0][1][0];
MAC_in[0][1][1]<=X_reg[0][1][1];
MAC_in[1][0][0]<=X_reg[0][2][0];
MAC_in[1][0][1]<=X_reg[0][2][1];
MAC_in[1][1][0]<=X_reg[0][3][0];
MAC_in[1][1][1]<=X_reg[0][3][1];
end
else begin
MAC_in[0][0][0]<=X_reg[1][0][0];
MAC_in[0][0][1]<=X_reg[1][0][1];
MAC_in[0][1][0]<=X_reg[1][2][0];
MAC_in[0][1][1]<=X_reg[1][2][1];
MAC_in[1][0][0]<=X_reg[1][1][0];
MAC_in[1][0][1]<=X_reg[1][1][1];
MAC_in[1][1][0]<=X_reg[1][3][0];
MAC_in[1][1][1]<=X_reg[1][3][1];
end
end

always @(posedge clk1) begin
if(Sel==0) begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
MAC_in[1][2][0]<=8'b00010000;
MAC_in[1][2][1]<=8'b00000000;
end
else begin
MAC_in[0][2][0]<=8'b00010000;
MAC_in[0][2][1]<=8'b00000000;
MAC_in[1][2][0]<=8'b11110000;
MAC_in[1][2][1]<=8'b00000000;
end
end

always @(posedge clk1) begin
if(Sel==1) begin
MAC_out_reg[0][0][0]<=MAC_out[0][0][0];
MAC_out_reg[0][0][1]<=MAC_out[0][0][1];
MAC_out_reg[0][1][0]<=MAC_out[0][1][0];
MAC_out_reg[0][1][1]<=MAC_out[0][1][1];
MAC_out_reg[0][2][0]<=MAC_out[1][0][0];
MAC_out_reg[0][2][1]<=MAC_out[1][0][1];
MAC_out_reg[0][3][0]<=MAC_out[1][1][0];
MAC_out_reg[0][3][1]<=MAC_out[1][1][1];
end
else begin
MAC_out_reg[1][0][0]<=MAC_out[0][0][0];
MAC_out_reg[1][0][1]<=MAC_out[0][0][1];
MAC_out_reg[1][2][0]<=MAC_out[0][1][0];
MAC_out_reg[1][2][1]<=MAC_out[0][1][1];
MAC_out_reg[1][1][0]<=MAC_out[1][0][0];
MAC_out_reg[1][1][1]<=MAC_out[1][0][1];
MAC_out_reg[1][3][0]<=MAC_out[1][1][0];
MAC_out_reg[1][3][1]<=MAC_out[1][1][1];
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
X_reg[1][0][0]<=MAC_out_reg[0][0][0];
X_reg[1][0][1]<=MAC_out_reg[0][0][1];
X_reg[1][1][0]<=MAC_out_reg[0][1][0];
X_reg[1][1][1]<=MAC_out_reg[0][1][1];
X_reg[1][2][0]<=MAC_out_reg[0][2][0];
X_reg[1][2][1]<=MAC_out_reg[0][2][1];
X_reg[1][3][0]<=MAC_out_reg[0][3][0];
X_reg[1][3][1]<=MAC_out_reg[0][3][1];
X_reg[2][0][0]<=MAC_out_reg[1][0][0];
X_reg[2][0][1]<=MAC_out_reg[1][0][1];
X_reg[2][1][0]<=MAC_out_reg[1][1][0];
X_reg[2][1][1]<=MAC_out_reg[1][1][1];
X_reg[2][2][0]<=MAC_out_reg[1][2][0];
X_reg[2][2][1]<=MAC_out_reg[1][2][1];
X_reg[2][3][0]<=MAC_out_reg[1][3][0];
X_reg[2][3][1]<=MAC_out_reg[1][3][1];
end

always @(posedge clk2)begin
Sel<=0;
end
always @(posedge clk1)begin
Sel<=Sel+1;
end

assign Xk_vect_real[31:24]=X_reg[2][0][0];
assign Xk_vect_imag[31:24]=X_reg[2][0][1];
assign Xk_vect_real[23:16]=X_reg[2][1][0];
assign Xk_vect_imag[23:16]=X_reg[2][1][1];
assign Xk_vect_real[15:8]=X_reg[2][2][0];
assign Xk_vect_imag[15:8]=X_reg[2][2][1];
assign Xk_vect_real[7:0]=X_reg[2][3][0];
assign Xk_vect_imag[7:0]=X_reg[2][3][1];

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
