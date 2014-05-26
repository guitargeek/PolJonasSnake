`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:16:20 05/26/2014
// Design Name:   ScoreCounter
// Module Name:   C:/Users/Pol/ISE/PolJonasSnake/score_count_tb.v
// Project Name:  Snake
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ScoreCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module score_count_tb;

	// Inputs
	reg CLK;
	reg RESET;
	reg REACHED_TARGET;

	// Outputs
	wire [3:0] CURRENT_SCORE;

	// Instantiate the Unit Under Test (UUT)
	ScoreCounter uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.REACHED_TARGET(REACHED_TARGET), 
		.CURRENT_SCORE(CURRENT_SCORE)
	);
	
	

	initial begin
		// Initialize Inputs
		CLK = 0;
		RESET = 0;
		REACHED_TARGET = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		forever #50 CLK = ~CLK; 
	end
	
	initial begin
		#200 RESET = 1;
		#500 RESET = 0;
		
		#1000 REACHED_TARGET = 1;
		#1 REACHED_TARGET = 0;
	
		
		#1000 REACHED_TARGET = 1;
		#1 REACHED_TARGET = 0;
		
		#1000 REACHED_TARGET = 1;
		#1 REACHED_TARGET = 0;
		
		
		#200 RESET = 1;
		#500 RESET = 0;
	end
		
      
endmodule

