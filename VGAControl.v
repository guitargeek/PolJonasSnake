`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:51:26 04/27/2014 
// Design Name: 
// Module Name:    VGAControl 
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
module VGAControl(
    input CLK,
    output reg [9:0] ADDRH,
    output reg [8:0] ADDRV,
    input [7:0] CIN,
    output reg [7:0] COUT,
    output HS,
    output VS
    );
	
	parameter VertTimeToPulseWidthEnd 	= 10'd2;
	parameter VertTimeToBackPorchEnd	= 10'd31;
	parameter VertTimeToDisplayTimeEnd	= 10'd511;
	parameter VertTimeTofrontPorch		= 10'd521;
	
	parameter HorzTimeToPulseWidthEnd	= 10'd96;
	parameter HorzTimeToBackPorchEnd	= 10'd144;
	parameter HorzTimeToDisplayTimeEnd	= 10'd784;
	parameter HorzTimeToFrontPorchEnd	= 10'd800;
	
	
	
	wire [9:0] HorCount;
	GenericCounter #(.COUNTER_WIDTH(10),
					 .COUNTER_MAX(HorzTimeToFrontPorchEnd)
					)	CountHor (
					.CLK(CLK),
					.RESET(1'b0),
					.ENABLE_IN(1'b1),
					.COUNT(HorCount),
					.TRIGG_OUT(HorTrigOut) );
	
	
	wire [8:0] VerCount;
	GenericCounter #(.COUNTER_WIDTH(9),
					 .COUNTER_MAX(VertTimeTofrontPorch)
					)	CountVer (
					.CLK(CLK),
					.RESET(1'b0),
					.ENABLE_IN(HorTrigOut),
					.COUNT(VerCount)
				   );
					
	assign HS = (HorCount < HorzTimeToPulseWidthEnd) ? 0 : 1;
	assign VS = (VerCount < VertTimeToPulseWidthEnd) ? 0 : 1;
	
	always@(posedge CLK) begin
		if (HorzTimeToBackPorchEnd <= HorCount && HorCount < HorzTimeToDisplayTimeEnd &&
			VertTimeToBackPorchEnd <= VerCount && VerCount < VertTimeToDisplayTimeEnd) begin
				ADDRH <= HorCount - HorzTimeToBackPorchEnd;
				ADDRV <= VerCount - VertTimeToBackPorchEnd;
		 end else begin
				ADDRH <= 10'd0;
				ADDRV <= 9'd0;
		end
	end
	
	
	always@(posedge CLK) begin
		if (HorzTimeToBackPorchEnd <= HorCount && HorCount < HorzTimeToDisplayTimeEnd &&
			VertTimeToBackPorchEnd <= VerCount && VerCount < VertTimeToDisplayTimeEnd)
				COUT <= CIN;
		else
				COUT <= 8'd0;
	end
	
	


endmodule
