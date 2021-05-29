`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:13:35 05/29/2021 
// Design Name: 
// Module Name:    Register_with_asynchronus_rest 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Register_with_asynchronus_rest(
	input in,clk,rst,en,
	output reg out
    );
	 
always @(posedge clk,posedge rst)
	if(rst)
		out<=0;
	else if(en) 
		out<=in;
endmodule

