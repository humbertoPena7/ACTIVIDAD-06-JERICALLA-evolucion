module Control (
    input wire [1:0] opcode,   // Código de operación
    input wire [4:0] rd, rs1, rs2, // Registros
    output reg [2:0] alu_sel,  // Selección de operación ALU
    output reg we_reg, we_mem, // Escritura en registros y memoria
    output reg sel_mem         // Selección de memoria
);

    always @(*) begin
        // Valores por defecto
        alu_sel = 3'b000;
        we_reg = 0;
        we_mem = 0;
        sel_mem = 0;

        case (opcode)
            2'b00: begin // Operación Aritmética
                we_reg = 1;
                case (rs1)
                    5'b00000: alu_sel = 3'b010; // Suma
                    5'b00001: alu_sel = 3'b011; // Resta
                    5'b00010: alu_sel = 3'b100; // SLT
                    default: alu_sel = 3'b000; 
                endcase
            end
            2'b01: begin // Operación Lógica
                we_reg = 1;
                case (rs1)
                    5'b00000: alu_sel = 3'b000; // AND
                    5'b00001: alu_sel = 3'b001; // OR
                    5'b00010: alu_sel = 3'b101; // NOR
                    default: alu_sel = 3'b000;
                endcase
            end
            2'b10: begin // Escritura en Memoria
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

