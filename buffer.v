module Buffer (
    input wire clk,
    input wire enable,
    input wire [31:0] d_entrada, //dato de entrada
    output reg [31:0] d_salida //dato de salida
);

    always @(posedge clk) begin
        if (enable)
            d_salida <= d_entrada;
    end

endmodule

