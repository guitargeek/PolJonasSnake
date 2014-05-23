`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:24 05/18/2014 
// Design Name: 
// Module Name:    ScoreBinaryMultiplexer 
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
module ScoreDecimalMultiplexer(
		input CLK,
		input RESET,
		input REACHED_TARGET,
//		output reg [1:0] STROBE_COUNTER,
		output reg [3:0] CURRENT_SCORE
    );

always@(posedge CLK) begin
	if(RESET)
		CURRENT_SCORE = 0;
	else if(REACHED_TARGET && CURRENT_SCORE != 10)
		CURRENT_SCORE = CURRENT_SCORE + 1;
//	STROBE_COUNTER[0] = ~STROBE_COUNTER[0];
end


endmodule
