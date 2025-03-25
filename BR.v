module BR(

	input wire clk,
	input wire we,
	input wire [4:0] RA1,
	input wire [4:0] RA2,
	input wire [4:0] WA,
	input wire [31:0] DW,
	
	output wire [31:0] DR1,
	output wire [31:0] DR2
	);
	
	reg [31:0] registros [0:31];
	
	assign DR1 = registros[RA1];
	assign DR2 = registros[RA2];
	
	always @(posedge clk) 
	begin
		if (we)
			registros[WA] <= DW;
	end
endmodule
	
	
	

