`timescale 1ns/1ps

module traffic_light_tb;

    reg clk;
    reg reset;

    wire red;
    wire green;
    wire yellow;
    wire [5:0] countdown;
    wire [6:0] seg_tens;
    wire [6:0] seg_units;

    integer errors;
    integer i;

    // Use a small clock frequency for faster simulation.
    // The displayed countdown remains 30, 30, and 5 seconds.
    localparam CLK_FREQ_HZ = 10;

    traffic_light #(
        .CLK_FREQ_HZ(CLK_FREQ_HZ),
        .RED_SECONDS(30),
        .GREEN_SECONDS(30),
        .YELLOW_SECONDS(5)
    ) uut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .green(green),
        .yellow(yellow),
        .countdown(countdown),
        .seg_tens(seg_tens),
        .seg_units(seg_units)
    );

    // Clock: 10 ns period
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // Save signals for GTKWave
    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_tb);
    end

    // Expected active-low seven-segment encoding: a,b,c,d,e,f,g
    function [6:0] expected_segment;
        input [3:0] digit;
        begin
            case (digit)
                0: expected_segment = 7'b0000001;
                1: expected_segment = 7'b1001111;
                2: expected_segment = 7'b0010010;
                3: expected_segment = 7'b0000110;
                4: expected_segment = 7'b1001100;
                5: expected_segment = 7'b0100100;
                6: expected_segment = 7'b0100000;
                7: expected_segment = 7'b0001111;
                8: expected_segment = 7'b0000000;
                9: expected_segment = 7'b0000100;
                default: expected_segment = 7'b1111111;
            endcase
        end
    endfunction

    // Check traffic lights, countdown, and both display digits
    task check_status;
        input expected_red;
        input expected_green;
        input expected_yellow;
        input [5:0] expected_count;

        reg [3:0] tens;
        reg [3:0] units;

        begin
            tens  = expected_count / 10;
            units = expected_count % 10;

            if ({red, green, yellow} !==
                {expected_red, expected_green, expected_yellow} ||
                countdown !== expected_count ||
                seg_tens !== expected_segment(tens) ||
                seg_units !== expected_segment(units)) begin

                $display("FAIL at time %0t", $time);
                $display("Expected lights=%b%b%b countdown=%0d",
                         expected_red, expected_green,
                         expected_yellow, expected_count);
                $display("Actual   lights=%b%b%b countdown=%0d",
                         red, green, yellow, countdown);
                $display("Seven-segment tens=%b units=%b",
                         seg_tens, seg_units);

                errors = errors + 1;
            end
            else begin
                $display("PASS time=%0t lights=%b%b%b countdown=%02d",
                         $time, red, green, yellow, countdown);
            end
        end
    endtask

    // Wait for one simulated second
    task wait_one_second;
        begin
            repeat (CLK_FREQ_HZ) @(posedge clk);
            #1;
        end
    endtask

    initial begin
        errors = 0;
        reset = 1'b1;

        // Check reset: RED, countdown 30
        #1;
        check_status(1, 0, 0, 30);

        @(negedge clk);
        reset = 1'b0;

        // RED: 29 down to 1
        for (i = 29; i >= 1; i = i - 1) begin
            wait_one_second;
            check_status(1, 0, 0, i);
        end

        // RED -> GREEN
        wait_one_second;
        check_status(0, 1, 0, 30);

        // GREEN: 29 down to 1
        for (i = 29; i >= 1; i = i - 1) begin
            wait_one_second;
            check_status(0, 1, 0, i);
        end

        // GREEN -> YELLOW
        wait_one_second;
        check_status(0, 0, 1, 5);

        // YELLOW: 4 down to 1
        for (i = 4; i >= 1; i = i - 1) begin
            wait_one_second;
            check_status(0, 0, 1, i);
        end

        // YELLOW -> RED
        wait_one_second;
        check_status(1, 0, 0, 30);

        // Check reset again
        @(negedge clk);
        reset = 1'b1;
        #1;
        check_status(1, 0, 0, 30);

        // Final test result
        if (errors == 0) begin
            $display("------------------------------------");
            $display("ALL RTL AND DISPLAY TESTS PASSED");
            $display("------------------------------------");
            $finish;
        end
        else begin
            $fatal(1, "TEST FAILED: %0d errors", errors);
        end
    end

    // Stop simulation if it gets stuck
    initial begin
        #100000;
        $fatal(1, "ERROR: Simulation timeout");
    end

endmodule

