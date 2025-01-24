`timescale 1ns / 1ps
module mult4x4_top (
    input logic [3: 0] A,
    input logic [3: 0] B,

    output logic [6: 0] out1,
    output logic [6: 0] out2,
    output logic [6: 0] out3
);

logic [7: 0] Y;
// instantiate mult4x4
mult4x4 DUT1 (
    .A (A),
    .B (B),

    .Y (Y)
);

logic [3: 0] U;
logic [3: 0] T;
logic [3: 0] H;

//instantiate BCD Dencoder
bcd8 DUT2 (
    .B (Y),
    .U (U),  // units
    .T (T),  // tens
    .H (H)  //Hundreds
);

//instantiate 3 SSDs
ssd DUT3 (
    .in (U),
    .out (out1)
);

ssd DUT4 (
    .in (T),
    .out(out2)
);

ssd DUT5 (
    .in (H),
    .out (out3)
);

endmodule