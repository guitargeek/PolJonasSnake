`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:07:22 05/28/2012 
// Design Name: 
// Module Name:    RandomWrapper 
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
module RandomWrapper(
		input CLK,
		input RESET,
		input NEXT,
		input [1:0] MASTER_STATE,
		output [7:0] HORIZONTAL,
		output [6:0] VERTICAL
    );
	 
wire [7:0] randhorz;
wire [6:0] randvert;
reg [7:0] horz;
reg [6:0] vert;
assign HORIZONTAL=horz;
assign VERTICAL=vert;

always @(posedge CLK, posedge RESET) begin
	if(RESET) begin
        horz <= 30;
        vert <= 20;
    end
    else begin
        if(NEXT | (MASTER_STATE==2'b00)) begin
				if(randhorz<160 & randvert<120) begin
					horz <= randhorz;
					vert <= randvert;
				end else begin
					horz <= 80;
					vert <= 60;
				end
			end
    end
end

PRandomHorz PRHorz(
    .CLK(CLK),
    .RESET(RESET),
	 .CE(1'b1),
    .OUT(randhorz)
);

PRandomVert PRVert(
    .CLK(CLK),
    .RESET(RESET),
	 .CE(1'b1),
    .OUT(randvert)
);

endmodule
