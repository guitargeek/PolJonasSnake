`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:46 05/16/2014 
// Design Name: 
// Module Name:    VGAWrapper 
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
module VGAWrapper(
    input CLK,
	 input [1:0] MASTER_STATE,
    output [9:0] ADDRH,
    output [8:0] ADDRV,
    input [7:0] CIN,
    output[7:0] COUT,
    output HS,
    output VS
    );
	 
	reg [7:0] Colour;
	
	//deviding the clock
	reg CLK25;
	always@(posedge CLK)
		CLK25 <= ~CLK25;
	 
	VGAControl VGACtl (
					.CLK(CLK),
//					.CLK(CLK25),
					.ADDRH(ADDRH),
					.ADDRV(ADDRV),
					.CIN(Colour),
					.COUT(COUT),
					.HS(HS),
					.VS(VS)
					);
					
	always@(posedge CLK) begin
		if(MASTER_STATE == 1) // if playing
			Colour = CIN;
		else if(MASTER_STATE == 2) // if won
			Colour = 8'b00100000;
		else // if idle (screen black)
			Colour = 0;
	end

endmodule
