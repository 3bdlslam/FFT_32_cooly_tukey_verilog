`timescale 1ns / 1ps

module Test_FFT;

// Inputs
reg [255:0] Xn_vect_real;
reg [255:0] Xn_vect_imag;
reg clk1,clk2,rst;
// Outputs
wire [255:0] Xk_vect_real;
wire [255:0] Xk_vect_imag;

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
clk2<=1;
rst<=0;
#1 rst<=1;
#1 rst<=0;
end

always begin; #0.12195121951219512; clk1<=~clk1;
end
always begin; #5; clk2<=~clk2;
end

initial begin;

#10;
Xn_vect_real=  256'h01_03_FF_FF_FF_03_03_FF_01_FD_FD_01_03_03_03_03_03_FE_FF_FD_00_01_FD_01_03_01_00_01_FD_FE_FE_FE;
Xn_vect_imag=  256'h03_FF_FD_00_00_FE_FF_FD_01_FE_FF_FD_FD_FD_FD_00_FF_FD_02_03_FD_00_FD_00_01_FF_01_03_FE_FE_FD_FE;
#10;
Xn_vect_real=  256'h02_00_03_FF_01_03_01_FE_FD_00_03_FE_FF_FF_FE_FE_02_03_FF_03_02_01_FE_02_01_FD_FE_FE_01_FD_02_03;
Xn_vect_imag=  256'hFE_03_03_01_02_00_00_FD_00_FE_00_03_01_01_FE_03_FE_00_00_00_00_FD_FE_FF_FD_FD_FF_01_FF_FE_01_FF;
#10;
Xn_vect_real=  256'h00_FF_FE_02_FF_FF_01_FD_00_00_02_00_FF_03_01_02_FE_00_FF_00_FD_FE_03_00_FE_03_03_00_01_FE_FF_FD;
Xn_vect_imag=  256'h01_02_02_FF_01_02_02_FE_FD_01_02_02_03_FF_FD_01_02_FE_00_02_FF_02_03_FD_00_00_FF_FE_FE_01_FD_01;
end

always @(posedge clk2)
$monitor("real=%h  imag=%h\n\n",Xk_vect_real,Xk_vect_imag);
endmodule

/*
Expected Output:

real=06EB09F4151402FCFF00F21607FF03EE000400F80EFAF8F217FC0D10F9FAFB03  imag=E1FD00DF1205FF060200000012F6FF0801FFFD06110C04060C19060AFA13FB0B
real=06e707f2151302faff00f31507fe02ef000501f80ffbf8f217fc0d11f9fcfc05  imag=e1faffde1204ff07020000fe11f5fe080100fd06120c03070c1a080afb17fc0e

real=06130D110CFD0C09FAF803FBFF0AFA08080C09F5FCF7FDE50C0205FCF6000CF5  imag=F703FE07F20C05F7FB07F3040005EB0BFD0501FEF5FBF8E3FD07FFF0F6FC2002
real=06100c0d0cfb0b07faf904fafe0afb07080c0af7fcf9fde70c0306fef6020df7  imag=f702fc08f10a04f7fb08f3020004eb09fd0602fcf5fcf8e3fd08fff2f6fe2105

real=FC01010003F80213F90FFD05FFF8F208000AFD1004FA21FEEBFF0106FAF5EFF2  imag=06FF0EFFF5FB1500FDFB0DFEFBF0F8FD00FDFE0C0DF7020201F70E03001BF9FE


*/
