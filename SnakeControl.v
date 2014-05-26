`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:10 05/16/2014 
// Design Name: 
// Module Name:    SnakeControl 
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
module SnakeControl(
	 input CLK,
	 input RESET,
	 input GAMECLOCK,
     input [9:0] ADDRH,
     input [8:0] ADDRV,
	 output reg [7:0] COLOUR,
	 output reg REACHED_TARGET,
	 input [1:0] MASTER_STATE,
	 input [1:0] NAVIGATION_STATE,
	 input [7:0] RAND_ADDRH,
	 input [6:0] RAND_ADDRV,
	 output [7:0] DEBUG_OUT,
	 input [7:0] DEBUG_IN
    );
	 
	 // initial position in horizontal and vertical
	 // first 7 bits Horizontal, then 6 bits Vertical
	 
	 reg [6:0] ApplePositionH;
	 reg [5:0] ApplePositionV;
	 
	 reg [12:0] SnakePosition = {7'b0000000, 6'b000000};
	 
	 //assign SnakePosition = {5'b00000, DEBUG_IN};
	 assign DEBUG_OUT = {2'b00, SnakePosition[12:7]};
	 
	 always@(posedge CLK) begin
		//check if the apple would be outside the screen 
		if({RAND_ADDRH[7:1], 3'b111} <= 640)
			ApplePositionH <= RAND_ADDRH[7:1];
		else 
			ApplePositionH <= 320;
		if({RAND_ADDRH[7:1], 3'b111} <= 480)
			ApplePositionV <= RAND_ADDRV[6:1];
		else 
			ApplePositionV <= 240;
		// drawing the apple
		if(ADDRH > {ApplePositionH, 3'b000} && ADDRV > {ApplePositionV, 3'b000}
			&& ADDRH <= {ApplePositionH, 3'b111} &&  ADDRV <= {ApplePositionV, 3'b111})
				COLOUR <= 8'b00000111;
		// or the snake
		else if (ADDRH > {SnakePosition[6:0], 3'b000} && ADDRV > {SnakePosition[12:7], 3'b000}
			&& ADDRH <= {SnakePosition[6:0], 3'b111} &&  ADDRV <= {SnakePosition[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else
			COLOUR <= 8'b01000000;
		//draw borders
		/*
		else if(ADDRH == 0 || ADDRV == 0 || ADDRH == 640 || ADDRV == 480)
			COLOUR <= 8'b00111000;
		else
			COLOUR <= 8'b00000000;
		*/	
end
		
always@(posedge GAMECLOCK) begin
		if(RESET)
			SnakePosition <= {7'b0000000, 6'b000000};
		else begin
			// moving the snake
			case(NAVIGATION_STATE)
			2'b00: begin // the right direction
				SnakePosition[6:0] <= SnakePosition[6:0] + 1; // Plus in H
			end
			3'b01: begin // the down state
				SnakePosition[12:7] <= SnakePosition[12:7] + 1; // Plus in V
			end
			2'b10: begin // the up direction
				if(SnakePosition[12:7] == 0)
					SnakePosition[12:7] <= 59;
				else
					SnakePosition[12:7] <= SnakePosition[12:7] - 1; // Minus in V
			end
			2'b11: begin // the left state
				if(SnakePosition[6:0] == 0)
					SnakePosition[6:0] <= 79;
				else
					SnakePosition[6:0] <= SnakePosition[6:0] - 1; // Minus in H
			end
			endcase
			// prevent the snake from leaving the screen
			if(SnakePosition[6:0] > 79)
				SnakePosition[6:0] <= SnakePosition[6:0] - 79;
			if(SnakePosition[12:7] > 59)
				SnakePosition[12:7] <= SnakePosition[12:7] - 59;
			// checking if we hit an apple
			if(SnakePosition[6:0] == ApplePositionH && SnakePosition[12:7] == ApplePositionV)
				REACHED_TARGET <= 1;
			else
				REACHED_TARGET <= 0;
		end
	 end
	 


endmodule
