`timescale 1ns / 1ps

module mult4x4_top_tb;

logic [3: 0] A;
logic [3: 0] B;

logic [6: 0] out1;
logic [6: 0] out2;
logic [6: 0] out3;

//instantiate top module 
mult4x4_top DUT (
    .A (A),
    .B (B),

    .out1 (out1),
    .out2 (out2),
    .out3 (out3)
);

logic [3: 0] expected_units;
logic [3: 0] expected_tens;
logic [3: 0] expected_hunds;

logic [3: 0] U;
logic [3: 0] T;
logic [3: 0] H;

logic [7: 0] S;

//test verifier
initial begin
    for (int i = 0; i <= 15; i = i+1) begin
        A = i; #10;
        for (int j = 0; j <= 15; j = j+1) begin
            B = j; #10;
            S = A * B; 
            expected_units = S % 10;
            expected_tens = (S/10) %10;
            expected_hunds = (S/100);
            U = get_seg (out1);
            T = get_seg (out2);
            H = get_seg (out3);

            assert (expected_units == U && expected_tens == T && expected_hunds == H) 
            else 
            $display("Test failed for A=%0d, B=%0d, Expected Units=%0d, Expected tens=%0d, Expected Hundredss=%0d, Got U=%0d Got T=%0d Got H=%0d", A, B, expected_units, expected_tens, expected_hunds, U, T, H);
        end
    end
end

function logic [3: 0] get_seg(input logic [6: 0] digit);
    case (digit)
        7'b1000000: get_seg = 4'b0000;
        7'b1111001: get_seg = 4'b0001;
        7'b0100100: get_seg = 4'b0010;
        7'b0110000: get_seg = 4'b0011;
        7'b0011001: get_seg = 4'b0100;
        7'b0010010: get_seg = 4'b0101;
        7'b0000010: get_seg = 4'b0110;
        7'b1111000: get_seg = 4'b0111;
        7'b0000000: get_seg = 4'b1000;
        7'b0010000: get_seg = 4'b1001;
        default: get_seg = 4'bxxxx;  // Error case
    endcase
endfunction

endmodule 