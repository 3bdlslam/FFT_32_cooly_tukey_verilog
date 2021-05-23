`timescale 1ns / 1ps

module Test_TopLevel;

	// Inputs
	reg clk,rst;

	// Instantiate the Unit Under Test (UUT)
	TopLevel uut (.rst(rst),
		.clk(clk)
	);

	initial begin
	
		// Initialize Inputs
		#10 clk<= 0;
		#10 clk<= 1;
		#10 clk<= 0;
		#10 clk<= 1;
		rst<=1;
		#10 clk<= 0;
		#10 clk<= 1;
		#10 clk<= 0;
		#10 clk<= 1;
		rst<=0;
		#10 clk<= 0;
		#10 clk<= 1;
		#10 clk<= 0;
		#10 clk<= 1;
		#10 clk<= 0;
		#10 clk<= 1;
		#10 clk<= 0;
		#10 clk<= 1;
		#10 clk<= 0;
		#10 clk<= 1;
		
		#10 clk<= 0;
		#10 clk<= 1;
		rst<=1;
		#10 clk<= 0;
		#10 clk<= 1;
		
		#10 clk<= 0;
		#10 clk<= 1;
		
				

	end
	
	always begin #10 clk=~clk; end
   always@(posedge clk)
		$monitor("clk:%b flag:%b \ninput:\n %h \n %h \n output:\n %h \n %h",clk,uut.flag,uut.real_input[0],uut.imag_input[0],uut.real_output[0],uut.imag_output[0]);
endmodule

