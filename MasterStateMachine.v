`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:06 05/16/2014 
// Design Name: 
// Module Name:    MasterStateMachine 
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
module MasterStateMachine(
    input RESET,
    input CLOCK,
    input [3:0] PUSH_BUTTONS,
    input [3:0] SCORE_IN, // only 6 because we dont need the dot i think
    output [1:0] STATE_OUT
    );

	 reg [1:0] CurrState;
	 reg [1:0] NextState;

	assign STATE_OUT = CurrState; 
	
// synchronous logic
always@(posedge CLOCK) begin
	if(RESET) begin
		CurrState <= 2'b00; // the idle state
	end 
	else begin
		CurrState <= NextState;
	end
end

// asynchronous logic
always@(PUSH_BUTTONS or SCORE_IN) begin
	case(CurrState)
		2'b00: begin // in idle state
			if(PUSH_BUTTONS)
				NextState <= 2'b01; // the play state				
			else
				NextState <= CurrState;			
		end
		2'b01: begin
			if(SCORE_IN == 10)
				NextState <= 2'b10;						
			else
				NextState <= CurrState;	
		end
		2'b10: begin
			NextState <= CurrState;		
		end
		default:
			NextState <= CurrState;
	endcase
end

endmodule
