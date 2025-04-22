`timescale 1ns / 1ps

module test_ven_machine1;

    // Outputs from DUT
    wire newspaper;
    wire cadbury_bar;
    wire tropicana_juice;
    wire [4:0] balance;

    // Inputs to DUT
    reg clock;
    reg reset;
    reg [4:0] money;
    reg [1:0] select_product;
    reg [4:0] extra_cash;

    // Instantiate the DUT (Device Under Test)
    ven_machine1 v2 (
        .newspaper(newspaper),
        .cadbury_bar(cadbury_bar),
        .tropicana_juice(tropicana_juice),
        .balance(balance),
        .money(money),
        .select_product(select_product),
        .extra_cash(extra_cash),
        .clock(clock),
        .reset(reset)
    );

    // Generate clock (100 MHz)
    always #5 clock = ~clock;

    initial begin
        // Initial setup
        clock = 0;
        reset = 1;
        money = 0;
        select_product = 0;
        extra_cash = 0;

        // Apply reset
        #20 reset = 0;

        // Transaction 1: Insert Rs.10, no product selected yet
        #10 money = 5'd10;

        // Transaction 2: Buy Tropicana Juice (select_product = 2'b10)
        #20 select_product = 2'b10;

        // Transaction 3: Buy again with fresh Rs.10
        #30 money = 5'd10;
             select_product = 2'b10;

        // Transaction 4: Another purchase
        #30 money = 5'd10;
             select_product = 2'b10;

        // Transaction 5: Insert Rs.5, try purchase
        #30 money = 5'd5;
             select_product = 2'b10;

        // Transaction 6: Add extra cash
        #20 extra_cash = 5'd10;

        // Transaction 7: Purchase again
        #30 money = 5'd10;
             select_product = 2'b10;

        // Transaction 8: Final purchase
        #30 money = 5'd10;
             select_product = 2'b10;

        // End simulation
        #100 $finish;
    end
    // Optional: Monitor for simulation output
    initial begin
        $monitor("Time=%0t | Money=%d | Product=%b | Juice=%b | Cadbury=%b | Newspaper=%b | Balance=%d | Extra_cash=%d",
                 $time, money, select_product, tropicana_juice, cadbury_bar, newspaper, balance, extra_cash);
    end
endmodule
