module ALU(
    input [31:0] A, B,      
    input [2:0] sel,    
    output reg [31:0] sal 
);

always @(*) begin
    case (sel)
        3'b000: sal	= A & B;  
        3'b001: sal = A | B;  
        3'b010: sal = A + B;  
        3'b011: sal = A - B;
		3'b101: sal = ~(A | B);			
        3'b100: sal = (A < B) ? 32'b1 : 32'b0; 
        
        default: sal = 32'b0;   
    endcase
end

endmodule

 