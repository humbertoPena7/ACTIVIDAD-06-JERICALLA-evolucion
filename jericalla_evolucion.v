module Jericalla_evolucion(
    input wire clk,
    input wire [4:0] rs1, rs2, rd,
    input wire [2:0] alu_sel,
    input wire we, mem_we, buf_we, demux_en,
    output wire [31:0] alu_out, mem_out, buf_out
);

    wire [31:0] reg_out1, reg_out2;
    
    // Instancia del Banco de Registros (BR)
    BR banco_registros (
        .RA1(rs1),
        .RA2(rs2),
        .WA(rd),
        .DW(alu_out),
        .WE(we),
        .clk(clk),
        .DR1(reg_out1),
        .DR2(reg_out2)
    );

    // Instancia de la ALU
    ALU alu_unit (
        .A(reg_out1),
        .B(reg_out2),
        .sel(alu_sel),
        .sal(alu_out)
    );

    // Instancia de la Memoria de Datos (MemD)
    MemD memoria_datos (
        .ADDR(alu_out[4:0]),
        .DW(reg_out2),
        .WE(mem_we),
        .clk(clk),
        .DR(mem_out)
    );

    // Instancia del Buffer
    Buffer buffer_unit (
        .d_entrada(mem_out),
        .enable(buf_we),
        .d_salida(buf_out)
    );

    // Instancia del Demux
    Demux demux_unit (
        .din(buf_out),
        .sel(alu_sel[1:0]),
        .enable(demux_en)
    );

endmodule
