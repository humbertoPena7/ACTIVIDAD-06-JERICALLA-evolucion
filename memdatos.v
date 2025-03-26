module MemD (
    input wire clk,              
    input wire we,               
    input wire [4:0] ADDR,       
    input wire [31:0] DW,        
    output reg [31:0] RD         
);


reg [31:0] mem [0:31];


initial begin
    $readmemh("datos.txt", mem);  // Para datos en formato hexadecimal
end


always @(posedge clk) begin
    if (we) 
        mem[ADDR] <= DW;
end

always @(*) begin
    RD = mem[ADDR];
end

endmodule

