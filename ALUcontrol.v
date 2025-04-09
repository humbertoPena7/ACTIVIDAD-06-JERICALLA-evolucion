module ALUControl (
    input [2:0] ALUop, 
    input [31:0] instruction,
    output reg [3:0] ALUctrl 
);

wire [5:0] function = inst[5:0];

always @(*) begin
    case (ALUop)
        3'b000: ALUctrl = 4'b0010;  // Suma
        3'b001: ALUctrl = 4'b0110;  // Resta
        3'b010: ALUctrl = 4'b0000;  // AND
        3'b011: ALUctrl = 4'b0001;  // OR
        3'b100: begin
            case (function)
                6'b100000: ALUctrl = 4'b0010; 
                6'b100010: ALUctrl = 4'b0110; 
                6'b100100: ALUctrl = 4'b0000; 
                6'b100101: ALUctrl = 4'b0001; 
                6'b101010: ALUctrl = 4'b0111; 
                default: ALUctrl = 4'bxxxx;   
            endcase
        end
        default: ALUctrl = 4'bxxxx;  
    endcase
end

endmodule
