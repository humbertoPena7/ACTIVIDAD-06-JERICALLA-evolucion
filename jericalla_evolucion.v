module Jericalla_evolucion(
    input wire clk,
    input wire [4:0] rs1, rs2, rd,
    input wire [2:0] alu_sel,
    input wire we, mem_we, buf_we, demux_en,
    output wire [31:0] alu_out, mem_out, buf_out
);

    wire [31:0] reg_out1, reg_out2;
    
    BR banco_registros (
        .clk(clk),
        .we(we),
        .RA1(rs1),
        .RA2(rs2),
        .WA(rd),
        .DW(alu_out),
        .DR1(reg_out1),
        .DR2(reg_out2)
    );

    ALU alu_unit (
        .A(reg_out1),
        .B(reg_out2),
        .sel(alu_sel),
        .sal(alu_out)
    );

    MemD memoria_datos (
        .clk(clk),
        .we(mem_we),
        .ADDR(alu_out[4:0]),
        .DW(reg_out2),
        .RD(mem_out)
    );

    Buffer buffer_unit (
        .clk(clk),
        .enable(buf_we),
        .d_entrada(mem_out),
        .d_salida(buf_out)
    );

    Demux demux_unit (
        .data_in(buf_out),
        .sel(alu_sel[1:0]),
        .enable(demux_en),
        .out0(), .out1(), .out2(), .out3()
    );

endmodule