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
		input REACHED_TARGET,
		output reg [3:0] CURRENT_SCORE
    );
	
always@(posedge REACHED_TARGET or posedge RESET) begin
	if(RESET) 
		CURRENT_SCORE <= 0;
	else
		CURRENT_SCORE <= CURRENT_SCORE+1;
		
end

endmodule
