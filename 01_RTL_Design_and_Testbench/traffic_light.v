`timescale 1ns/1ps

module traffic_light #(
    parameter integer CLK_FREQ_HZ = 50000000,
    parameter integer RED_SECONDS = 30,
    parameter integer GREEN_SECONDS = 30,
    parameter integer YELLOW_SECONDS = 5
)(
    input wire clk,
    input wire reset,

    output reg red,
    output reg green,
    output reg yellow,

    output reg [5:0] countdown,

    // Active-low seven-segment outputs: a,b,c,d,e,f,g
    output reg [6:0] seg_tens,
    output reg [6:0] seg_units
);

    // FSM state encoding
    localparam [1:0] RED_STATE    = 2'b00;
    localparam [1:0] GREEN_STATE  = 2'b01;
    localparam [1:0] YELLOW_STATE = 2'b10;

    reg [1:0] state;
    reg [31:0] prescaler;

    reg [3:0] tens_digit;
    reg [3:0] units_digit;

    // FSM and countdown timer
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state     <= RED_STATE;
            prescaler <= 0;
            countdown <= RED_SECONDS;
        end
        else begin
            if (prescaler >= CLK_FREQ_HZ - 1) begin
                prescaler <= 0;

                if (countdown > 1) begin
                    countdown <= countdown - 1'b1;
                end
                else begin
                    case (state)

                        RED_STATE: begin
                            state     <= GREEN_STATE;
                            countdown <= GREEN_SECONDS;
                        end

                        GREEN_STATE: begin
                            state     <= YELLOW_STATE;
                            countdown <= YELLOW_SECONDS;
                        end

                        YELLOW_STATE: begin
                            state     <= RED_STATE;
                            countdown <= RED_SECONDS;
                        end

                        default: begin
                            state     <= RED_STATE;
                            countdown <= RED_SECONDS;
                        end

                    endcase
                end
            end
            else begin
                prescaler <= prescaler + 1'b1;
            end
        end
    end

    // Traffic light output decoder
    always @(*) begin
        red    = 1'b0;
        green  = 1'b0;
        yellow = 1'b0;

        case (state)
            RED_STATE:    red    = 1'b1;
            GREEN_STATE:  green  = 1'b1;
            YELLOW_STATE: yellow = 1'b1;
            default:      red    = 1'b1;
        endcase
    end

    // Convert countdown into decimal tens and units digits
    always @(*) begin
        if (countdown >= 50) begin
            tens_digit  = 5;
            units_digit = countdown - 50;
        end
        else if (countdown >= 40) begin
            tens_digit  = 4;
            units_digit = countdown - 40;
        end
        else if (countdown >= 30) begin
            tens_digit  = 3;
            units_digit = countdown - 30;
        end
        else if (countdown >= 20) begin
            tens_digit  = 2;
            units_digit = countdown - 20;
        end
        else if (countdown >= 10) begin
            tens_digit  = 1;
            units_digit = countdown - 10;
        end
        else begin
            tens_digit  = 0;
            units_digit = countdown;
        end
    end

    // Seven-segment decoder
    // Active-low outputs, ordered a,b,c,d,e,f,g
    function [6:0] seven_segment;
        input [3:0] digit;
        begin
            case (digit)
                4'd0: seven_segment = 7'b0000001;
                4'd1: seven_segment = 7'b1001111;
                4'd2: seven_segment = 7'b0010010;
                4'd3: seven_segment = 7'b0000110;
                4'd4: seven_segment = 7'b1001100;
                4'd5: seven_segment = 7'b0100100;
                4'd6: seven_segment = 7'b0100000;
                4'd7: seven_segment = 7'b0001111;
                4'd8: seven_segment = 7'b0000000;
                4'd9: seven_segment = 7'b0000100;
                default: seven_segment = 7'b1111111;
            endcase
        end
    endfunction

    // Drive both seven-segment digits
    always @(*) begin
        seg_tens  = seven_segment(tens_digit);
        seg_units = seven_segment(units_digit);
    end

endmodule

