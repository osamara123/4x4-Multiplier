`timescale 1ns / 1ps
module mult4x4 (
    input logic [3: 0] A,
    input logic [3: 0] B,

    output logic [7: 0] Y
);

assign Y = A * B;

endmodule