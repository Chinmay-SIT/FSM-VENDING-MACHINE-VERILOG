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

The project leverages Verilog HDL to design a modular, synthesizable vending machine
architecture. The logic is written to be FPGA-compatible, and the entire system is simulated using a
testbench to validate functional correctness. The FSM includes the following primary states:
- IDLE – Waiting for money input.
- CHECK_AMOUNT – Validating the inserted money against the selected product
price.
- WAIT_FOR_EXTRA – Awaiting additional cash if the money is insufficient.
- DISPENSE – Dispensing the selected product.
- RETURN_BALANCE – Returning any extra money.
The design ensures reusability, clarity, and scalability—making it suitable for extension to more
complex real-world vending systems involving digital displays, stock tracking, and advanced
payment methods such as NFC or QR code scanning.
