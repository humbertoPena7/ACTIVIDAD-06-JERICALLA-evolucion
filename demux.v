module Demux (
    input wire [31:0] data_in,
    input wire [1:0] sel,
    input wire enable,
    output reg [31:0] out0, out1, out2, out3
);

    always @(*) begin
        // Todas las salidas en 0 por defecto
        out0 = 32'b0;
        out1 = 32'b0;
        out2 = 32'b0;
        out3 = 32'b0;

        if (enable) begin
            case (sel)
                2'b00: out0 = data_in;
                2'b01: out1 = data_in;
                2'b10: out2 = data_in;
                2'b11: out3 = data_in;
                default: ;
            endcase
        end
    end
endmodule

