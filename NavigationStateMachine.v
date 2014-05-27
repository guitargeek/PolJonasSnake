`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:17 05/16/2014 
// Design Name: 
// Module Name:    NavigationStateMachine 
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
module NavigationStateMachine(
    input RESET,
    input CLOCK,
    input [3:0] PUSH_BUTTONS,
	 // 0: rechts, 1: unten, 2: oben, 3: links
    output [1:0] STATE_OUT
    );

	 reg [1:0] CurrState;
	 reg [1:0] NextState;

	assign STATE_OUT = CurrState; 
	
// synchronous logic
always@(posedge CLOCK) begin
	if(RESET) begin
		CurrState <= 2'b00; // the right state
	end 
	else begin
		CurrState <= NextState;
	end
end

// asynchronous logic
always@(PUSH_BUTTONS or CurrState) begin
	case(CurrState)
		2'b00: begin // the right direction
			if(PUSH_BUTTONS[1])
				NextState <= 2'b01; // go down 
			else if(PUSH_BUTTONS[2])
				NextState <= 2'b10;  // go up		
			else
				NextState <= CurrState;			
		end
		3'b01: begin // the down state
			if(PUSH_BUTTONS[0])
				NextState <= 2'b00; // go right 
			else if(PUSH_BUTTONS[3])
				NextState <= 2'b11;  // go left	
			else
				NextState <= CurrState;	
		end
		2'b10: begin // the up direction
			if(PUSH_BUTTONS[0])
				NextState <= 2'b00; // go right 
			else if(PUSH_BUTTONS[3])
				NextState <= 2'b11;  // go left		
			else
				NextState <= CurrState;		
		end
		2'b11: begin // the left state
			if(PUSH_BUTTONS[1])
				NextState <= 2'b01; // go down 
			else if(PUSH_BUTTONS[2])
				NextState <= 2'b10;  // go up		
			else
				NextState <= CurrState;		
		end
	endcase
end

endmodule
