`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2025 11:52:44
// Design Name: 
// Module Name: Vending_machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//initialisation with module and port declarations
module ven_machine1(
    output reg newspaper, cadbury_bar, tropicana_juice,
    output reg [4:0] balance,
    input [4:0] money,
    input [1:0] select_product,
    input [4:0] extra_cash,
    input clock, reset);

//register for storing the present state and the next state
reg [2:0] ps, ns;


//The denomination inserted in the vending machine using Parameters
parameter [4:0] money_5 = 5'd5;
parameter [4:0] money_10 = 5'd10;
parameter [4:0] money_20 = 5'd20;

//The select product option in the vending machine using Parameters
parameter [1:0] select_news = 2'b01;
parameter [1:0] select_bar = 2'b10;
parameter [1:0] select_juice = 2'b11;

//Parameters for all the states in the machine
parameter [2:0] void = 3'b000;
parameter [2:0] five = 3'b001;
parameter [2:0] ten = 3'b010;
parameter [2:0] fifteen = 3'b011;

initial
begin
    ps <= void;
    ns <= void;
end


//Code for determining the next state in the vending machine
always @(posedge clock)
begin
    if (reset)
        ns <= void;
    else
        case (ps)
            void: if (money == money_5 && select_product == select_news)
                      ns <= five;
                  else if (money == money_5 && select_product == select_bar)
                      ns <= ten;
                  else if (money == money_5 && select_product == select_juice)
                      ns <= fifteen;
                  else if (money == money_10 && select_product == select_bar)
                      ns <= ten;
                  else if (money == money_10 && select_product == select_news)
                      ns <= five;
                  else if (money == money_10 && select_product == select_juice)
                      ns <= fifteen;
                  else if (money == money_20 && select_product == select_bar)
                      ns <= ten;
                  else if (money == money_20 && select_product == select_juice)
                      ns <= fifteen;
                  else if (money == money_20 && select_product == select_news)
                      ns <= five;


            five: if (money == money_5 && select_product == select_news)
                      ns <= five;
                  else if (money == money_5 && select_product == select_bar)
                      ns <= ten;
                  else if (money == money_5 && select_product == select_juice)
                      ns <= fifteen;
                  else if (money == money_10 && select_product == select_news)
                      ns <= five;
                  else if (money == money_10 && select_product == select_bar)
                      ns <= ten;
                  else if (money == money_10 && select_product == select_juice)
                      ns <= fifteen;
                  else if (money == money_20 && select_product == select_bar)
                      ns <= ten;
                  else if (money == money_20 && select_product == select_juice)
                      ns <= fifteen;
                  else if (money == money_20 && select_product == select_news)
                      ns <= five;
                      
            
            ten: if (money == money_5 && select_product == select_news)
                     ns <= five;
                 else if (money == money_5 && select_product == select_bar)
                     ns <= ten;
                 else if (money == money_5 && select_product == select_juice)
                     ns <= fifteen;
                 else if (money == money_10 && select_product == select_news)
                     ns <= five;
                 else if (money == money_10 && select_product == select_bar)
                     ns <= ten;
                 else if (money == money_10 && select_product == select_juice)
                     ns <= fifteen;
                 else if (money == money_20 && select_product == select_news)
                     ns <= five;
                 else if (money == money_20 && select_product == select_bar)
                     ns <= ten;
                 else if (money == money_20 && select_product == select_juice)
                     ns <= fifteen;
                     
         fifteen: if (money == money_5 && select_product == select_news)
                         ns <= five;
                     else if (money == money_5 && select_product == select_bar)
                         ns <= ten;
                     else if (money == money_5 && select_product == select_juice)
                         ns <= fifteen;
                     else if (money == money_10 && select_product == select_news)
                         ns <= five;
                     else if (money == money_10 && select_product == select_bar)
                         ns <= ten;
                     else if (money == money_10 && select_product == select_juice)
                         ns <= fifteen;
                     else if (money == money_20 && select_product == select_news)
                         ns <= five;
                     else if (money == money_20 && select_product == select_bar)
                         ns <= ten;
                     else if (money == money_20 && select_product == select_juice)
                         ns <= fifteen;
                         
            
    default: ns <= void; // By default, the next state is always the void state
        endcase
        ps <= ns;
    end
    
    // Code to generate the output from the vending machine
always @(posedge clock)
begin
    if (reset)
        ps <= void;
    else
    begin
        case (ps)
            void: begin
                newspaper       <= 1'b0;
                cadbury_bar     <= 1'b0;
                tropicana_juice <= 1'b0;
                balance = money;
                $display("You have canceled your order! Here is your balance %d", balance);
            end

five: begin
    if (money == money_5)
    begin
        newspaper       <= 1'b1;
        cadbury_bar     <= 1'b0;
        tropicana_juice <= 1'b0;
        balance = money - 5;
        $display("Your newspaper will be delivered soon! Thanks for purchasing with us. Your balance is %d - 5 = %d", money, balance);
    end

    else if (money == money_10)
    begin
        newspaper       <= 1'b1;
        cadbury_bar     <= 1'b0;
        tropicana_juice <= 1'b0;
        balance = money - 5;
        $display("Your newspaper will be delivered soon! Thanks for purchasing with us. Your balance is %d - 5 = %d", money, balance);
    end

    else if (money == money_20)
    begin
        newspaper       <= 1'b1;
        cadbury_bar     <= 1'b0;
        tropicana_juice <= 1'b0;
        balance = money - 5;
        $display("Your newspaper will be delivered soon! Thanks for purchasing with us. Your balance is %d -5= %d", money, balance);
    end
end

ten: begin
    if (money == money_5)
    begin
        newspaper       <= 1'b0;
        cadbury_bar     <= 1'b0;
        tropicana_juice <= 1'b0;
        $display("If you wish to buy a cadbury bar then Rs.5 is not sufficient! Please enter another Rs.5");

        if (extra_cash == money_5)
        begin
            newspaper       <= 1'b0;
            cadbury_bar     <= 1'b1;
            tropicana_juice <= 1'b0;
            $display("You have added extra Rs.5. Here is your cadbury bar. Enjoy!");
        end
        else
        begin
            balance = 5'd5;
            $display("Sorry you will not get a cadbury bar for Rs. 5");
        end
    end

    else if (money == money_10)
    begin
        newspaper       <= 1'b0;
        cadbury_bar     <= 1'b1;
        tropicana_juice <= 1'b0;
        balance = money - 10;
        $display("Your cadbury bar will be delivered soon! Thanks for purchasing with us. Your balance is %d - 10 = %d", money, balance);
    end

else if(money == money_20)
begin
    newspaper       <= 1'b0;
    cadbury_bar     <= 1'b1;
    tropicana_juice <= 1'b0;
    balance = money - 10;
    $display("Your cadbury bar will be delivered soon! Thanks for purchasing with us. Your balance is %d - 10 = %d", money, balance);
end
end

fifteen: begin
    if(money == money_5)
    begin
        newspaper <= 1'b0;
        cadbury_bar <= 1'b0;
        tropicana_juice <= 1'b0;
        $display("If you wish to buy tropicana juice then Rs.5 is not sufficient! Please enter another Rs.10");

        if(extra_cash == money_10)
        begin
            newspaper <= 1'b0;
            cadbury_bar <= 1'b0;
            tropicana_juice <= 1'b1;
            $display("You have added extra Rs.10. Here is your tropicana juice. Enjoy!");
        end
        else
            balance = 5'd5;
            $display("Sorry you will not get a cadbury bar for Rs. 5");
    end


else if (money == money_10)
begin
    newspaper <= 1'b0;
    cadbury_bar <= 1'b0;
    tropicana_juice <= 1'b0;
    $display("If you wish to buy tropicana juice then Rs.10 is not sufficient!");
    $display("Please enter another Rs.5");
 if (extra_cash == money_5)
    begin
        newspaper <= 1'b0;
        cadbury_bar <= 1'b0;
        tropicana_juice <= 1'b1;
        $display("You have added extra Rs.10. Here is your tropicana juice. Enjoy!");
    end
    else
    begin
        balance = 5'd10;
        $display("Sorry you will not get a cadbury bar for Rs. 10");
    end
end
else if (money == money_20)
begin
    newspaper <= 1'b0;
    cadbury_bar <= 1'b0;
    tropicana_juice <= 1'b1;
    balance = money - 15;
    $display("Your tropicana juice will be delivered soon!");
    $display("Thanks for purchasing with us. Your balance is %d - 15 = %d", money, balance);
    end
    end
    default: 
    begin
    newspaper <= 1'b0;
    cadbury_bar <= 1'b0;
    tropicana_juice <= 1'b0;
    balance = 5'd0;
end
endcase
end
end
endmodule









