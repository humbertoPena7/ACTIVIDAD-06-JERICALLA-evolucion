assign PC_F (
    input [7:0] A,   // Entrada A de 8 bits
    input [7:0] B,   // Entrada B de 8 bits
    output [15:0] P  // Salida de 16 bits para el producto
);

    // Realizamos la multiplicación entre A y B y asignamos el resultado a P
    assign P = A * B;

endmodule