module Control (
    input wire [1:0] opcode,
    input wire [4:0] rd, rs1, rs2,
    output reg [2:0] alu_sel,
    output reg we_reg, we_mem,
    output reg sel_mem
);

    always @(*) begin
        alu_sel = 3'b000;
        we_reg = 0;
        we_mem = 0;
        sel_mem = 0;

        case (opcode)
            2'b00: begin
                we_reg = 1;
                case (rs1)
                    5'b00000: alu_sel = 3'b010;
                    5'b00001: alu_sel = 3'b011;
                    5'b00010: alu_sel = 3'b100;
                    default: alu_sel = 3'b000;
                endcase
            end
            2'b01: begin
                we_reg = 1;
                case (rs1)
                    5'b00000: alu_sel = 3'b000;
                    5'b00001: alu_sel = 3'b001;
                    5'b00010: alu_sel = 3'b101;
                    default: alu_sel = 3'b000;
                endcase
            end
            2'b10: begin
                we_mem = 1;
                sel_mem = 1;
            end
            default: begin
                we_reg = 0;
                we_mem = 0;
            end
        endcase
    end
endmodule
