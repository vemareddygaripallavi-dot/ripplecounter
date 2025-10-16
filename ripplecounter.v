// 4-bit Ripple Counter (Asynchronous Counter)
module ripplecounter (
    input clk,       // Clock input
    input reset,     // Asynchronous reset
    output [3:0] q   // 4-bit counter output
);
    // Internal flip-flop connections
    T_FF tff0 (clk,    reset,  q[0]);
    T_FF tff1 (q[0],   reset,  q[1]);
    T_FF tff2 (q[1],   reset,  q[2]);
    T_FF tff3 (q[2],   reset,  q[3]);
endmodule

// T Flip-Flop definition
module T_FF (
    input clk,
    input reset,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= ~q;   // Toggle output on each clock edge
    end
endmodule
