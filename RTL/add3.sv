`timescale 1ns / 1ps
module add3 (
    input logic [3: 0] A,
    output logic [3: 0] S
);

always_comb begin
    if (A < 5)
        S = A;
    else if (A < 10) 
        S = A + 3;
    else
        S = 4'b0000;
end

endmodule