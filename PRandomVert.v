`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:59:45 05/28/2012 
// Design Name: 
// Module Name:    PRandomVert 
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
module PRandomVert(
        input CLK,
        input RESET,
        input CE,
//        output reg LFSR_DONE,
		  output [6:0] OUT);

reg [6:0] lfsr;
wire d0,lfsr_equal;
assign OUT=lfsr;

xnor(d0,lfsr[6],lfsr[5]);
assign lfsr_equal = (lfsr == 7'h6A);

always @(posedge CLK,posedge RESET) begin
    if(RESET) begin
        lfsr <= 0;
//        LFSR_DONE <= 0;
    end
    else begin
        if(CE)
            lfsr <= lfsr_equal ? 7'h0 : {lfsr[5:0],d0};
 //       LFSR_DONE <= lfsr_equal;
    end
end
endmodule
