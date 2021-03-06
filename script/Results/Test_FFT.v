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

always begin; #0.8333333333333334; clk1<=~clk1;
end
always begin; #5; clk2<=~clk2;
end

initial begin;

#10;
Xn_vect_real=  256'h01_01_01_00_00_00_00_00_FF_00_00_00_01_00_00_FF_00_FF_01_00_00_00_00_FF_00_00_00_01_00_00_00_FF;
Xn_vect_imag=  256'h01_00_01_00_01_FF_00_00_00_00_01_00_01_00_00_00_00_00_00_00_00_00_FF_FF_FF_00_00_00_00_00_00_01;
#10;
Xn_vect_real=  256'h00_00_00_FF_00_00_01_00_FF_00_00_01_00_00_FF_00_00_00_FF_01_01_00_01_00_00_FF_FF_01_00_00_00_FF;
Xn_vect_imag=  256'h01_01_01_00_00_01_00_00_FF_00_00_FF_01_01_FF_01_00_00_01_00_00_FF_00_00_00_01_00_01_00_00_FF_00;
#10;
Xn_vect_real=  256'h01_00_00_00_00_FF_01_00_00_01_00_00_01_00_01_00_00_00_FF_01_00_00_00_00_00_00_FF_01_01_01_FF_01;
Xn_vect_imag=  256'h00_00_FF_00_00_00_01_FF_01_00_00_00_00_00_00_01_FF_01_FF_00_00_FF_00_01_00_FF_FF_FF_FF_01_00_00;
#10;
Xn_vect_real=  256'hFF_00_01_00_00_FF_01_00_00_00_01_01_01_00_00_01_00_FF_00_00_00_00_01_00_00_FF_00_01_01_FF_01_FF;
Xn_vect_imag=  256'hFF_00_00_FF_00_00_FF_FF_01_FF_00_01_00_FF_00_00_01_00_FF_00_01_00_FF_00_FF_00_00_FF_00_00_00_01;
#10;
Xn_vect_real=  256'h01_01_FF_FF_00_00_00_00_00_00_00_00_00_01_00_00_00_00_00_00_FF_00_00_00_01_01_FF_FF_FF_FF_00_01;
Xn_vect_imag=  256'hFF_FF_00_00_00_00_00_00_00_00_00_01_01_FF_FF_00_01_00_01_00_00_00_00_01_00_00_FF_00_00_00_00_01;
#10;
Xn_vect_real=  256'hFF_00_00_00_FF_00_00_01_00_00_00_01_00_00_00_00_00_FF_00_00_FF_FF_FF_00_FF_FF_00_00_FF_00_00_01;
Xn_vect_imag=  256'h01_00_00_00_01_00_01_00_00_00_00_FF_00_01_01_00_00_01_00_01_00_00_00_00_FF_01_00_00_00_00_00_00;
#10;
Xn_vect_real=  256'h00_FF_00_00_FF_FF_00_00_00_00_00_01_FF_01_FF_01_00_00_00_00_00_00_00_FF_01_FF_FF_00_00_FF_00_00;
Xn_vect_imag=  256'h01_00_00_00_00_01_00_FF_00_FF_00_00_FF_FF_01_00_00_FF_FF_00_01_01_00_FF_FF_00_FF_FF_FF_00_01_00;
#10;
Xn_vect_real=  256'h00_00_01_00_00_00_00_00_00_01_00_00_01_00_00_01_00_00_00_00_00_00_00_FF_00_00_00_00_FF_00_00_FF;
Xn_vect_imag=  256'hFF_FF_01_00_00_00_00_01_01_01_00_00_FF_00_00_00_00_00_00_FF_01_01_00_00_00_00_00_00_00_FF_FF_01;
#10;
Xn_vect_real=  256'h00_01_01_FF_00_00_FF_01_00_00_00_FF_FF_00_01_01_01_00_00_01_FF_FF_00_00_FF_00_01_00_00_01_00_00;
Xn_vect_imag=  256'h00_00_FF_01_00_00_00_00_FF_00_00_00_00_00_00_01_00_00_01_00_00_00_00_00_00_00_01_01_00_01_00_00;
#10;
Xn_vect_real=  256'h00_00_00_FF_00_01_FF_FF_FF_00_00_FF_00_00_FF_00_FF_00_00_00_01_01_00_00_00_FF_01_01_00_01_00_FF;
Xn_vect_imag=  256'hFF_FF_00_FF_FF_01_FF_00_00_00_FF_01_00_00_00_00_FF_01_01_00_01_00_00_FF_01_FF_00_01_00_FF_00_FF;
end

always @(posedge clk2)
$monitor("real=%h  imag=%h\n\n",Xk_vect_real,Xk_vect_imag);
endmodule

/*
Expected Output:

real=010700000004FFFFFEFF0000000003F90502050304FF000100020303F90204FF  imag=02020500FA00FEFDFF0002FBFD010100040200FFFF0400020300040303040402


real=FFFEFF070000080103FDFD01FD03FD03FF03020104FC05FBFFFF0100F8FEFEFF  imag=050201000103FEFF03FE01FEFA0804FEFD00FD03020004FEFF080504FFFC0501


real=06040101FAFE0005040205000100FEFCFE0201FEFD0301FF04000004040200FE  imag=FDFE040304FAFD0003010407FC07FA06FDFEF8FD0405FEFBFF0400000000FD00


real=04FEFD00FCFDFE00FB0000F6FD0100000806FFFF0005FCFAFDFD05FEFC0300FE  imag=FBFC050000FBFFF90AFEFFFAFCFB00FE01FFFFFF0002FBFFFEFE050200030000


real=FFFF010107FF0201FD02FCFCFF00FEFFFD0200FF02FD03010703FF0B07060000  imag=01FC00FE020001FEFFFFFFFEFDFE02FEFFFD02000002FDFE05FE00F7FD04FFFF


real=FA0102000002FEFDFFFD00FF03FD00F8FA0100FEFF00FFFFF90000010200FF00  imag=06FA06FF0004FF03050004000001000200040000FCFF0502F902000300FC0005


real=FBFD0501FD00F802030100FC0702FF03FF07FCFF0101FEFFFFFB07FE0702FDFB  imag=FB010505FF0002FD030600FE030006FB0304FF030302FCFDFBFF0301FF020303


real=010004FF0005FDFAFEF9FEFFFC03FE020100030304050003000002FB0001FEFC  imag=01FBFCFF00FD01FEFEFEFFFCFE000200FF0000FCFF02FA0202FFFF010401FB02


real=02FE03FC0500FD01FA000300FF000001FEFE010000F802FFFE01000003FC0704  imag=040003FEFDFB01FFFEFC00050304FFFEFCFE00FDFD020408FE030104FFFC0000


real=FDFF00FEFC00040200FB00020002FE08FFFB00050004FEFD00030000F8030003  imag=FC00FE00FC000000FBFDF4FF0606000000030002FD04F90005010004FEFDFFF4


*/
