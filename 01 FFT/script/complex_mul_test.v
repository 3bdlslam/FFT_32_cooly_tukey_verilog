`timescale 1ns / 1ps

module complex_mul_test;
// Inputs
reg [3:-4] a;
reg [3:-4] aj;
reg [3:-4] b;
reg [3:-4] bj;

// Outputs
wire [3:-4] c;
wire [3:-4] cj;

// Instantiate the Unit Under Test (UUT)
complex_mul uut (
.a(a),
.aj(aj),
.b(b),
.bj(bj),
.c(c),
.cj(cj)
);
initial begin
// Initialize Inputs

//-0.875+j-0.875
a=0'hF2;
aj=0'hF2;
//0.875+j-1.0
b=0'h0E;
bj=0'hF0;
#100;

//-0.5+j0.6875
a=0'hF8;
aj=0'h0B;
//0.5+j0.125
b=0'h08;
bj=0'h02;
#100;

//0.4375+j-0.0625
a=0'h07;
aj=0'hFF;
//-0.5+j-0.75
b=0'hF8;
bj=0'hF4;
#100;

//-0.25+j-0.5
a=0'hFC;
aj=0'hF8;
//-0.875+j-0.6875
b=0'hF2;
bj=0'hF5;
#100;

//-0.875+j0.75
a=0'hF2;
aj=0'h0C;
//0.5625+j-0.5625
b=0'h09;
bj=0'hF7;
#100;

//-0.375+j0.25
a=0'hFA;
aj=0'h04;
//0.6875+j-0.125
b=0'h0B;
bj=0'hFE;
#100;

//1.0+j-0.625
a=0'h10;
aj=0'hF6;
//1.0+j0.75
b=0'h10;
bj=0'h0C;
#100;

//-0.3125+j0.1875
a=0'hFB;
aj=0'h03;
//0.625+j0.75
b=0'h0A;
bj=0'h0C;
#100;

//0.875+j0.75
a=0'h0E;
aj=0'h0C;
//0.1875+j-0.5625
b=0'h03;
bj=0'hF7;
#100;

//-0.6875+j-0.125
a=0'hF5;
aj=0'hFE;
//0.5625+j0.9375
b=0'h09;
bj=0'h0F;
#100;
end

always @(a,aj,b,bj)
$monitor("['%h','%h'],\n",c,cj);

/*Expected output:
[
(-1.640625+0.109375j)
['0'hE6','0'h01'],
(-0.3359375+0.28125j)
['0'hFB','0'h04'],
(-0.265625-0.296875j)
['0'hFC','0'hFC'],
(-0.125+0.609375j)
['0'hFE','0'h09'],
(-0.0703125+0.9140625j)
['0'hFF','0'h0E'],
(-0.2265625+0.21875j)
['0'hFD','0'h03'],
(1.46875+0.125j)
['0'h17','0'h02'],
(-0.3359375-0.1171875j)
['0'hFB','0'hFF'],
(0.5859375-0.3515625j)
['0'h09','0'hFB'],
(-0.26953125-0.71484375j)
['0'hFC','0'hF5'],
]*/

endmodule