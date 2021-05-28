`timescale 1ns / 1ps

module Test_FFT;

// Inputs
reg [31:0] Xn_vect_real;
reg [31:0] Xn_vect_imag;
reg clk1,clk2,rst;
// Outputs
wire [31:0] Xk_vect_real;
wire [31:0] Xk_vect_imag;

// Instantiate the Unit Under Test (UUT)
FFT uut (
.Xn_vect_real(Xn_vect_real),
.Xn_vect_imag(Xn_vect_imag),
.Xk_vect_real(Xk_vect_real),
.Xk_vect_imag(Xk_vect_imag),
.clk1(clk1),.clk2(clk2),.rst(rst)
);

initial begin;
clk1<=0;
clk2<=0;
end

always begin; #5; clk1<=~clk1;
end
always begin; #10; clk2<=~clk2;
end

initial begin;
//Inputs+Expected Outputs
/*
[ 0.0625+0.25j   -0.25  +0.0625j  0.3125+0.375j   0.125 -0.375j ]
*/
#20;
Xn_vect_real=  32'h01_FC_05_02;
Xn_vect_imag=  32'h04_01_06_FA;/*
[-0.375 +0.j      0.    +0.125j  -0.1875-0.3125j  0.0625-0.4375j]
*/
#20;
Xn_vect_real=  32'hFA_00_FD_01;
Xn_vect_imag=  32'h00_02_FB_F9;/*
[ 0.1875-0.3125j -0.125 +0.0625j  0.    +0.5j     0.3125+0.125j ]
*/
#20;
Xn_vect_real=  32'h03_FE_00_05;
Xn_vect_imag=  32'hFB_01_08_02;/*
[ 0.25  -0.25j   -0.0625+0.125j  -0.0625+0.0625j  0.25  +0.3125j]
*/
#20;
Xn_vect_real=  32'h04_FF_FF_04;
Xn_vect_imag=  32'hFC_02_01_05;/*
[-0.25  -0.125j   0.    -0.4375j  0.0625+0.0625j -0.0625+0.0625j]
*/
#20;
Xn_vect_real=  32'hFC_00_01_FF;
Xn_vect_imag=  32'hFE_F9_01_01;
end

/*
Expected Output:

real=040308F5  imag=05040FF8
real=F806F6F4  imag=F6060004
real=06020004  imag=06FA00EC
real=06020008  imag=0400F6F6
real=FCF3FE03  imag=F9FC05FE
*/

always @(posedge clk2)
$monitor("real=%h  imag=%h",Xk_vect_real,Xk_vect_imag);
endmodule
