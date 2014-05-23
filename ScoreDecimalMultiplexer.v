`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:59 05/18/2014 
// Design Name: 
// Module Name:    ScoreDecimalMultiplexer 
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
		input [3:0] CURRENT_SCORE,
		output reg STROBE_COUNTER,
		output [3:0] STROBED_SCORE
    );

always@(posedge CLK) begin
	STROBE_COUNTER = ~STROBE_COUNTER;
//	STROBED_SCORE <= CURRENT_SCORE[1] & CURRENT_SCORE[3]; 
end

//always@(STROBE_COUNTER) begin
//	if(STROBE_COUNTER)
//		STROBED_SCORE <= 1;
//	else
//		STROBED_SCORE <= 0;
//end

assign STROBED_SCORE = STROBE_COUNTER;

endmodule
