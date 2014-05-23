`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:24 04/11/2014 
// Design Name: 
// Module Name:    Mux4Way 
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
module Mux4Way(
   input [4:0] CounterDeci,
    input [4:0] CounterUnit,
    input [4:0] CounterDec,
    input [4:0] CounterThousand,
    input [1:0] Select,
    output reg [4:0] Bin_Out
    );

always@(Select or CounterDeci or CounterUnit or CounterDec or CounterThousand ) begin

	case(Select)
		2'b00 : Bin_Out <= CounterDeci;
		2'b01 : Bin_Out <= CounterUnit;
		2'b10 : Bin_Out <= CounterDec;
		2'b11 : Bin_Out <= CounterThousand;
	default: Bin_Out <= 5'b00000;
	endcase
end




endmodule

