`timescale 1ns/1ps

module traffic_light_gls_tb;

    reg clk;
    reg reset;

    wire red, green, yellow;
    wire [5:0] countdown;
    wire [6:0] seg_tens, seg_units;

    traffic_light uut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .green(green),
        .yellow(yellow),
        .countdown(countdown),
        .seg_tens(seg_tens),
        .seg_units(seg_units)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("traffic_light_gls.vcd");
        $dumpvars(0, traffic_light_gls_tb);

        $display("Starting SKY130 GLS");

        reset = 1;
        repeat (3) @(posedge clk);
        #1;

        $display("Lights=%b%b%b Countdown=%0d",
                 red, green, yellow, countdown);

        @(negedge clk);
        reset = 0;

        repeat (700) @(posedge clk);
        #1;

        $display("GLS simulation completed");
        $display("Lights=%b%b%b Countdown=%0d",
                 red, green, yellow, countdown);
        $display("Tens=%b Units=%b", seg_tens, seg_units);

        $finish;
    end

    initial begin
        #8000;
        $display("Simulation timeout");
        $finish;
    end

endmodule

