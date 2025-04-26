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

## Verilog Module Implementation

### (i) Vending Machine Module (ven_machine1.v)
This is the core FSM-based module responsible for product dispensing and balance calculation.
Inputs:
•	money[4:0] – Amount inserted
•	select_product[1:0] – Chosen product
•	extra_cash[4:0] – Additional money if needed
•	clock, reset – System control signals
Outputs:
•	newspaper, cadbury_bar, tropicana_juice – Product outputs
•	balance[4:0] – Returned balance

### (ii) Testbench (test_ven_machine1.v)
Used to simulate and verify behavior under different scenarios:
•	Resetting the machine
•	Inserting money
•	Selecting a product
•	Adding extra cash
The testbench mimics real user interactions, validating proper operation and state transitions of the FSM.

## Results
### Simulation Waveform Analysis
From the Vivado simulation:

•	The clock toggles every 10ns.
•	Reset is asserted high and then deasserted to start the FSM.
•	When money = 10 and select_product = 2'b10 (Tropicana Juice), the juice is dispensed and balance updates correctly.
•	Extra cash and multiple transactions are correctly handled.

### Waveform Example:

![image](https://github.com/user-attachments/assets/2394580c-bb98-4835-930c-dce9e57852bc)

The FSM-based vending machine was thoroughly tested through simulation, and the results confirm accurate functionality. The system successfully handles product dispensing and balance cal-culations. For instance, in the simulation waveform, Tropicana Juice is dispensed precisely at 207.955 ns when ₹10 is inserted, and the correct product is selected. The FSM accurately interprets the selection and transitions through the necessary states to dispense the item.
The vending machine also manages excess cash effectively. When an amount greater than the product cost is inserted, the system correctly computes and returns the remaining balance. In cases where the inserted amount is initially insufficient, the machine transitions to the WAIT_EXTRA state, accepts additional cash via the extra_cash input, and proceeds with the transaction once the re-quired amount is met.
The testbench simulated multiple user interactions, including system resets, different combi-nations of money and product selection, and extra cash scenarios. Each simulation run validated that the FSM behaves deterministically and consistently across all test cases. Furthermore, the reset func-tionality works flawlessly—upon activation, the FSM returns to its initial IDLE state, clearing inter-nal variables and outputs.
The vending machine supports three products—Tropicana Juice, Cadbury Bar, and Newspa-per—with clearly defined outputs and selection logic. The waveform analysis confirms that each product is dispensed only when the correct input sequence is detected, ensuring the FSM transitions align with the expected behavior. Overall, the design proves to be reliable, responsive, and capable of handling real-time vending scenarios in a simulated environment.

## Future Scope
This project lays a strong foundation for further enhancements and practical extensions. One promising direction is the integration of an LCD display interface using Verilog. By incorporating a simple 16x2 or graphical LCD module, real-time information such as the inserted money, selected product, remaining balance, or messages like “Insert More Cash” can be displayed to users. This would enhance the user experience by providing clear feedback during interactions, especially in public or standalone machine setups. Another valuable enhancement is the implementation of mul-tiple product stock levels. In a real-world vending machine, inventory management is crucial. By integrating internal counters and memory blocks to track the stock of each product, the system can prevent product dispensing when an item is out of stock and display relevant alerts. This feature would make the vending machine more realistic and applicable for deployment in dynamic retail en-vironments.
Furthermore, the system can be extended to support dynamic pricing with AI-based de-mand prediction. Leveraging machine learning algorithms, especially time-series models or rein-forcement learning, the system can adjust product prices based on customer buying patterns, time of day, or demand spikes. For example, during peak hours, prices of popular items could be increased marginally, while offering discounts during off-peak times to stimulate sales. This intelligent pricing strategy would not only increase the machine’s efficiency but also maximize profit, making it suita-ble for commercial smart vending systems.
Overall, these future upgrades would transform the basic FSM-based vending machine into a fully-fledged, intelligent, and commercially viable product.

## Conclusion
This project successfully demonstrates the design and simulation of a digital vending ma-chine using Verilog Hardware Description Language (HDL), leveraging the power of Finite State Machine (FSM) modeling. The implementation efficiently handles product selection, cash insertion, extra cash processing, and balance return, simulating real-world vending machine behavior within a digital environment. The FSM-based approach makes the architecture well-structured, easy to de-bug, and scalable for future extensions. Through modular design, the system cleanly separates input processing, state transitions, and output logic. This modularity enables seamless integration of new features without disrupting existing functionality. For example, additional products or denomina-tions can be added simply by expanding the input and output interfaces and updating the state tran-sitions.
Simulation results confirm that the vending machine accurately dispenses selected products based on user input and manages change calculation when excess money is provided. The design supports real-time simulation of various use cases, making it a useful reference for embedded system learners and HDL developers. Looking ahead, the project provides a solid foundation for enhance-ments such as coin return mechanisms, stock level monitoring, integration with external peripherals like displays or keypads, and even user authentication systems. Such additions can elevate this model into a fully functional smart vending machine suitable for real-world deployment.
In summary, the project not only illustrates effective FSM design in Verilog but also high-lights the potential of HDL-based systems for real-time automation applications.



