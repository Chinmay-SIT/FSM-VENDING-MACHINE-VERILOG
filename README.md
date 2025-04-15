# FSM VENDING MACHINE USING VERILOG HDL

This project involves the **design, simulation, and verification** of a Finite State Machine (FSM)-based vending machine using **Verilog Hardware Description Language (HDL)**. The system accepts predefined denominations and allows the user to select one of three products. It includes real-time balance calculation and handles extra cash scenarios efficiently. The design is simulated and validated using **Xilinx Vivado**.


## Project Description

A vending machine is an embedded automation system designed to dispense products upon valid payment and user selection. In this project, an FSM-based vending machine is implemented to accept inputs such as money, product selection, and additional cash if needed. Based on these inputs, the machine transitions between states to either complete the transaction or wait for extra funds.

The products supported by the system include:
- **Tropicana Juice**
- **Cadbury Bar**
- **Newspaper**

Money denominations supported: **₹5, ₹10, ₹20**

The system is modular, scalable, and synthesizable for FPGA targets. It supports real-time simulation and multiple transaction scenarios using a dedicated Verilog testbench.


## FSM Overview

The core FSM includes the following states:
- `IDLE`: Waits for input and initializes variables.
- `CHECK_MONEY`: Compares inserted money with product cost.
- `WAIT_EXTRA`: Waits for extra cash if the money is insufficient.
- `DISPENSE_PRODUCT`: Dispenses the selected item if conditions are met.
- `RETURN_BALANCE`: Returns any remaining balance after product delivery.


## Process Flow

The overall vending machine process follows this flow:

1. User inserts money.
2. Selects a product.
3. System checks if the inserted money is enough.
4. If not, waits for `extra_cash`.
5. Dispenses product when conditions are met.
6. Returns the balance (if any).


