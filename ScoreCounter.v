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
		input CLK,
		input RESET,
		input REACHED_TARGET,
//		output reg [1:0] STROBE_COUNTER,
		output reg [3:0] CURRENT_SCORE
    );

/*reg [3:0] NextScore = 0;

always@(posedge CLK) begin
	if(RESET)
		CURRENT_SCORE <= 0;
	else 
		CURRENT_SCORE <= NextScore;
end

always@(posedge REACHED_TARGET) begin
	if(CURRENT_SCORE != 10)
		NextScore <= CURRENT_SCORE + 1;
	else
	  NextScore <= CURRENT_SCORE;
end*/

	
always@(posedge REACHED_TARGET or posedge RESET) begin
	if(RESET) 
		CURRENT_SCORE <= 0;
	else
		CURRENT_SCORE <= CURRENT_SCORE+1;
		
end

endmodule
