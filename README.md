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

## Hardware and Software Tools
- Language: Verilog 
- Simulation Tool: Xilinx Vivado
- Waveform Viewer: Vivado Simulator

## Methodology
System Flow Overview
To ensure a structured and predictable operation, the vending machine follows a predefined process.
This is visualized in the flowchart below:
![image](https://github.com/user-attachments/assets/ebfe7f39-d151-486e-8df5-6ebebd5c22de)

Figure 1: Vending Machine Operation Flowchart

## FSM-Based Control Logic
The core control logic of the vending machine is implemented as a Finite State Machine (FSM)
using Verilog HDL. FSMs are ideal for designing systems with a well-defined number of states and
transitions based on input conditions.
FSM State Diagram
The FSM for this vending machine includes the following major states:
### IDLE: System waits for user input and resets internal variables.
### CHECK_MONEY: Compares the inserted amount against the cost of the selected
product.
### WAIT_EXTRA: Activated if the inserted amount is insufficient; waits for additional
funds via the extra_cash input.
### DISPENSE_PRODUCT: Dispenses the chosen product once funds are validated.
### RETURN_BALANCE: Returns any extra amount inserted beyond the product cost.
![image](https://github.com/user-attachments/assets/13441a3d-3068-4cfb-b995-a408b45a70a6)

Figure 2: FSM State Diagram for the Vending Machine

