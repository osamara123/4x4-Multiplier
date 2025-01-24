`timescale 1ns / 1ps
module bcd8 (
    input logic unsigned [7: 0] B,
    output logic unsigned [3: 0] U,  // units
    output logic unsigned [3: 0] T,  // tens
    output logic unsigned [3: 0] H   //Hundreds
);

// instantiate add3 block
// inputs of add3 blocks 
logic [3: 0] in1;
logic [3: 0] S1;    //output of c1
logic [3: 0] in2;
logic [3: 0] S2;
logic [3: 0] in3;   // input of C3
logic [3: 0] S3;
logic [3: 0] in4;
logic [3: 0] S4;
logic [3: 0] in5;
logic [3: 0] S5;
logic [3: 0] in6;
logic [3: 0] S6;
logic [3: 0] in7;
logic [3: 0] S7;

add3 uut1 (.A (in1), .S(S1));
add3 uut2 (.A (in2), .S(S2));
add3 uut3 (.A (in3), .S(S3));
add3 uut4 (.A (in4), .S(S4));
add3 uut5 (.A (in5), .S(S5));
add3 uut6 (.A (in6), .S(S6));
add3 uut7 (.A (in7), .S(S7));

always_comb begin
    in1 = {1'b0, B [7: 5]}; 
    in2 = {S1 [2: 0], B [4]}; 
    in3 = {S2 [2: 0], B [3]}; 
    in4 = {S3 [2: 0], B [2]}; 
    in5 = {S4 [2: 0], B [1]}; 
    in6 = {1'b0, S1 [3], S2 [3], S3 [3]}; 
    in7 = {S6 [2: 0], S4 [3]}; 

    U = {S5 [2: 0], B [0]}; 
    T = {S7 [2: 0], S5 [3]}; 
    H = {1'b0, 1'b0, S6 [3], S7 [3]}; 
end

endmodule