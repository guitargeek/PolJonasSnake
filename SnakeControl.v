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
	 input [3:0] SCORE,
	 output [7:0] DEBUG_OUT,
	 input [7:0] DEBUG_IN
    );
	 
	 
	 // initial position in horizontal and vertical
	 // first 7 bits Horizontal, then 6 bits Vertical
	 
	 reg [6:0] ApplePositionH;
	 reg [5:0] ApplePositionV;
	 
	 reg [12:0] SnakePosition = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition1 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition2 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition3 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition4 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition5 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition6 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition7 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition8 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition9 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition10 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition11 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition12 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition13 = {7'b0000000, 6'b000000};
	 reg [12:0] SnakePosition14 = {7'b0000000, 6'b000000};

	 wire [3:0] SNAKE_LEN;
	 assign SNAKE_LEN = SCORE +3'd5;
	  
	 //assign SnakePosition = {5'b00000, DEBUG_IN};
	 //assign DEBUG_OUT = {2'b00, SnakePosition[12:7]};
	 assign DEBUG_OUT = {4'b0000, SNAKE_LEN};
		
		
	 always@(posedge CLK) begin
	 if (MASTER_STATE == 1) begin
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
		// draw the snake's head
		else if (ADDRH > {SnakePosition[6:0], 3'b000} && ADDRV > {SnakePosition[12:7], 3'b000}
			&& ADDRH <= {SnakePosition[6:0], 3'b111} &&  ADDRV <= {SnakePosition[12:7], 3'b111})
			COLOUR <= 8'b11111111;
			
		// and its tail
		else if (SNAKE_LEN >1 && ADDRH > {SnakePosition1[6:0], 3'b000} && ADDRV > {SnakePosition1[12:7], 3'b000}
			&& ADDRH <= {SnakePosition1[6:0], 3'b111} &&  ADDRV <= {SnakePosition1[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >2 && ADDRH > {SnakePosition2[6:0], 3'b000} && ADDRV > {SnakePosition2[12:7], 3'b000}
			&& ADDRH <= {SnakePosition2[6:0], 3'b111} &&  ADDRV <= {SnakePosition2[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >3 && ADDRH > {SnakePosition3[6:0], 3'b000} && ADDRV > {SnakePosition3[12:7], 3'b000}
			&& ADDRH <= {SnakePosition3[6:0], 3'b111} &&  ADDRV <= {SnakePosition3[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >4 && ADDRH > {SnakePosition4[6:0], 3'b000} && ADDRV > {SnakePosition4[12:7], 3'b000}
			&& ADDRH <= {SnakePosition4[6:0], 3'b111} &&  ADDRV <= {SnakePosition4[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >5 && ADDRH > {SnakePosition5[6:0], 3'b000} && ADDRV > {SnakePosition5[12:7], 3'b000}
			&& ADDRH <= {SnakePosition5[6:0], 3'b111} &&  ADDRV <= {SnakePosition5[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >7 && ADDRH > {SnakePosition6[6:0], 3'b000} && ADDRV > {SnakePosition6[12:7], 3'b000}
			&& ADDRH <= {SnakePosition6[6:0], 3'b111} &&  ADDRV <= {SnakePosition6[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >8 && ADDRH > {SnakePosition7[6:0], 3'b000} && ADDRV > {SnakePosition7[12:7], 3'b000}
			&& ADDRH <= {SnakePosition7[6:0], 3'b111} &&  ADDRV <= {SnakePosition7[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >9 && ADDRH > {SnakePosition8[6:0], 3'b000} && ADDRV > {SnakePosition8[12:7], 3'b000}
			&& ADDRH <= {SnakePosition8[6:0], 3'b111} &&  ADDRV <= {SnakePosition8[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >10 && ADDRH > {SnakePosition9[6:0], 3'b000} && ADDRV > {SnakePosition9[12:7], 3'b000}
			&& ADDRH <= {SnakePosition9[6:0], 3'b111} &&  ADDRV <= {SnakePosition9[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >11 && ADDRH > {SnakePosition10[6:0], 3'b000} && ADDRV > {SnakePosition10[12:7], 3'b000}
			&& ADDRH <= {SnakePosition10[6:0], 3'b111} &&  ADDRV <= {SnakePosition10[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >12 && ADDRH > {SnakePosition11[6:0], 3'b000} && ADDRV > {SnakePosition11[12:7], 3'b000}
			&& ADDRH <= {SnakePosition11[6:0], 3'b111} &&  ADDRV <= {SnakePosition11[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >13 && ADDRH > {SnakePosition12[6:0], 3'b000} && ADDRV > {SnakePosition12[12:7], 3'b000}
			&& ADDRH <= {SnakePosition12[6:0], 3'b111} &&  ADDRV <= {SnakePosition12[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >14 && ADDRH > {SnakePosition13[6:0], 3'b000} && ADDRV > {SnakePosition13[12:7], 3'b000}
			&& ADDRH <= {SnakePosition13[6:0], 3'b111} &&  ADDRV <= {SnakePosition13[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else if (SNAKE_LEN >15 && ADDRH > {SnakePosition14[6:0], 3'b000} && ADDRV > {SnakePosition14[12:7], 3'b000}
			&& ADDRH <= {SnakePosition14[6:0], 3'b111} &&  ADDRV <= {SnakePosition14[12:7], 3'b111})
			COLOUR <= 8'b11111111;
		else
			COLOUR <= 8'b01000000;
	end
	end
		
	always@(posedge GAMECLOCK) begin
		if(MASTER_STATE == 0) begin
			SnakePosition <= {7'b0000000, 6'b000000};
			SnakePosition1 <= {7'b0000000, 6'b000000};
			SnakePosition2 <= {7'b0000000, 6'b000000};
			SnakePosition3 <= {7'b0000000, 6'b000000};
			SnakePosition4 <= {7'b0000000, 6'b000000};
			SnakePosition5 <= {7'b0000000, 6'b000000};
			SnakePosition6 <= {7'b0000000, 6'b000000};
			SnakePosition7 <= {7'b0000000, 6'b000000};
			SnakePosition8 <= {7'b0000000, 6'b000000};
			SnakePosition9 <= {7'b0000000, 6'b000000};
			SnakePosition10 <= {7'b0000000, 6'b000000};
			SnakePosition11 <= {7'b0000000, 6'b000000};
			SnakePosition12 <= {7'b0000000, 6'b000000};
			SnakePosition13 <= {7'b0000000, 6'b000000};
			SnakePosition14 <= {7'b0000000, 6'b000000};
		end else if(MASTER_STATE == 1) begin
			//shift the snake register
			SnakePosition1 <= SnakePosition;
			SnakePosition2 <= SnakePosition1;
			SnakePosition3 <= SnakePosition2;
			SnakePosition4 <= SnakePosition3;
			SnakePosition5 <= SnakePosition4;
			SnakePosition6 <= SnakePosition5;
			SnakePosition7 <= SnakePosition6;
			SnakePosition8 <= SnakePosition7;
			SnakePosition9 <= SnakePosition8;
			SnakePosition10 <= SnakePosition9;
			SnakePosition11 <= SnakePosition10;
			SnakePosition12 <= SnakePosition11;
			SnakePosition13 <= SnakePosition12;
			SnakePosition14 <= SnakePosition13;
			
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
					SnakePosition[12:7] <= 58;
				else
					SnakePosition[12:7] <= SnakePosition[12:7] - 1; // Minus in V
			end
			2'b11: begin // the left state
				if(SnakePosition[6:0] == 0)
					SnakePosition[6:0] <= 78;
				else
					SnakePosition[6:0] <= SnakePosition[6:0] - 1; // Minus in H
			end
			endcase
			// prevent the snake from leaving the screen
			if(SnakePosition[6:0] > 78)
				SnakePosition[6:0] <= 0;
			if(SnakePosition[12:7] > 58)
				SnakePosition[12:7] <= 0;
			// checking if we hit an apple
			if(SnakePosition[6:0] == ApplePositionH && SnakePosition[12:7] == ApplePositionV)
				REACHED_TARGET <= 1;
			else
				REACHED_TARGET <= 0;
		end
	 end
	 


endmodule
