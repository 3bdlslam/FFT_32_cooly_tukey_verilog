`timescale 1ns / 1ps



module TopLevel#(parameter INT=4,DEC=4)
(input rst,clk,output rnd_bit);
	 
wire [32*(INT+DEC)-1:0] Xn_vect_real,Xn_vect_imag;
wire [32*(INT+DEC)-1:0] Xk_vect_real,Xk_vect_imag;
reg [2:0]in_addr,out_addr;
reg [4:0] osama;
reg flag; 

wire [32*(INT+DEC)-1:0] real_input [0:7];
wire [32*(INT+DEC)-1:0] imag_input [0:7];

reg [32*(INT+DEC)-1:0] real_output[0:7];
reg [32*(INT+DEC)-1:0] imag_output[0:7];
	 
FFT_32 #(.INT(INT),.DEC(DEC))uut(
.Xn_vect_real(Xn_vect_real),
.Xn_vect_imag(Xn_vect_imag),
.Xk_vect_real(Xk_vect_real),
.Xk_vect_imag(Xk_vect_imag),
.clk(clk)
);

assign rnd_bit = (&Xk_vect_real) || (&Xk_vect_imag);


initial begin
	$readmemh("real_input_file.mem",real_input);
	$readmemh("imag_input_file.mem",imag_input);
end


always @(in_addr)
begin
	if (rst==1)begin
		flag<=0;
	end else begin
		if (flag ==0)begin
			if(in_addr==3'b101)
				flag<=1;
		end else
			if (out_addr < 3'b111)
				out_addr<=out_addr+1;
			else
				out_addr<=0;
	end
end

always @(posedge clk)
begin
	if (rst!=1)
		if (in_addr < 3'b111)
			in_addr<=in_addr+1;
		else
			in_addr<=0;
end

always @(posedge clk)
begin
	if (flag)begin
		real_output[out_addr]<=Xk_vect_real;
		imag_output[out_addr]<=Xk_vect_imag;
	end
end


/*assign rnd_bit = ((&imag_output[0])||(&imag_output[1])||(&imag_output[2])||(&imag_output[3])||
						(&imag_output[4])||(&imag_output[5])||(&imag_output[6])||(&imag_output[7])||
						(&real_output[0])||(&real_output[1])||(&real_output[2])||(&real_output[3])||
						(&real_output[4])||(&real_output[5])||(&real_output[6])||(&real_output[7]));
*/
assign Xn_vect_real = real_input[in_addr];
assign Xn_vect_imag = imag_input[in_addr];



endmodule

