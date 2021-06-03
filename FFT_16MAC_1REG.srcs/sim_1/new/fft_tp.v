`timescale 1ns / 1ps

module Test_FFT;

// Inputs
reg [255:0] Xn_vect_real;
reg [255:0] Xn_vect_imag;
reg clk,rst;
// Outputs
wire [255:0] Xk_vect_real;
wire [255:0] Xk_vect_imag;
wire ready;

integer InFile,OutFile;


// Instantiate the Unit Under Test (UUT)
FFT uut (
.Xn_vect_real(Xn_vect_real),
.Xn_vect_imag(Xn_vect_imag),
.Xk_vect_real(Xk_vect_real),
.Xk_vect_imag(Xk_vect_imag),
.clk1(clk),.rst(rst)
);

initial begin;
    clk<=0;
    rst<=0;
    #10 rst<=1;
    #10 rst<=0;
//    $fclose("input.txt");
//    $fclose("output.txt");
//    InFile=$fopen("input.txt","r");
//    OutFile=$fopen("output.txt","w");
//    $fscanf(InFile,"%h\n",Xn_vect_real);
//    $fscanf(InFile,"%h\n",Xn_vect_imag);
    Xn_vect_real<=256'h0500FF02FEFAFB00FE030401FB040006020600FCFBFF000007060004FF000007;
    Xn_vect_imag<=256'h000005FAFB04FCFE03FEFC0705FD040005FEFC04040100FAFCFB0604FA04FCFB;
    #100;
    Xn_vect_real<=256'hFAFFFF01010502010604F9FE02FA02FD02FD05FCFCFE0707FE000407FE0504FF;
    Xn_vect_imag<=256'hFF06FE060004050503FF06000204070502FCFD0700FC00FC0300FE030105FA05;
    #100;
    Xn_vect_real<=256'hFDFC050106F9FE03FFF907060005FC0006030005FA06FCFB00030202030003FC;
    Xn_vect_imag<=256'h0100F90205FDF9060000FF040305030000050500FA05050705FAFC0401010703;
    #100;
    Xn_vect_real<=256'h0706FCFBFAFD070401FB01FE0306000603FD020504FEFAFA070303F9040003FB;
    Xn_vect_imag<=256'h0001FF01FF05F903FA01FFFA0504FC06FAFBFB0704FEFE02FBFBFDFEF905FC04;
    #100;
    Xn_vect_real<=256'hFFF906FCFBFA040005FA02F9FEFFFC0403FFFCFBF9FBFBFA050601FF04FBFCFD;
    Xn_vect_imag<=256'h07FEFFFC0201FFFF07FE00FB0300050504030007FF03FE00FD00FE030407FFFC;
    #100;
end

always #10 clk<=~clk;

//always @*
//#1000
//if(! $feof(InFile)) begin
//$fscanf(InFile,"%h\n",Xn_vect_real);
//$fscanf(InFile,"%h\n",Xn_vect_imag);
//end


always @* begin
#100
//$fdisplay(OutFile,"real=%h  imag=%h",Xk_vect_real,Xk_vect_imag);
$display("real=%h  imag=%h",Xk_vect_real,Xk_vect_imag);

end
endmodule
