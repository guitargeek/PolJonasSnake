`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:18 05/18/2014 
// Design Name: 
// Module Name:    ScoreCounter 
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
module ScoreCounter(
		input RESET,
		input GAMECLOCK,
		input REACHED_TARGET,
		output reg [3:0] CURRENT_SCORE
    );
	 
// the idea is that the score counter can only count once per gameclock
reg enable = 1;
	
always@(posedge REACHED_TARGET or posedge RESET) begin
	if(RESET) 
		CURRENT_SCORE <= 0;
	else if(enable) begin
		CURRENT_SCORE <= CURRENT_SCORE+1;
	end
end

always@(posedge GAMECLOCK or posedge REACHED_TARGET or posedge RESET) begin
	if(RESET)
		enable <= 1;
	else if(REACHED_TARGET)
		enable <= 0;
	else
		enable <= 1;
end

endmodule
