# FPGA Digital Electronic Lock

Repository dedicated to the Register Transfer Level (RTL) project of an Electronic Lock, developed in SystemVerilog. [cite_start]The project was structured as a practical requirement for the Digital Systems Design course (PSD) in the Computer Engineering program at IFPB.

The focus of this repository is to demonstrate digital hardware modeling, hierarchical module partitioning, implementation of complex Finite State Machines (FSMs), and robust verification via simulation.

## Technical Specifications

The system is designed to operate at a base clock frequency of 1KHz  and simulates the business rules of commercial security hardware. Key features include:

* **Anti-Spy Buffer:** Supports the insertion of random digits before and/or after the actual password, using a dynamic buffer of up to 21 total digits[cite: 1, 2].
* **Credential Management:** Simultaneous storage of 1 Master Password and up to 4 user passwords, with variable lengths from 4 to 12 digits.
* **Security Lockout System:**
    * **Inactivity Timeout:** 5-second limit between key presses before discarding the current input[cite: 1, 2].
    * **Failure Penalty:** 1-second inoperability period for authentication failures.
    * **Hard-Lock:** 30-second total system lockout after 5 consecutive incorrect attempts.
* **Access Controls:** Parameterizable automatic locking, audible alarm (Beep) for open doors, and an internal "Do Not Disturb" blocking function.
* **Setup Mode:** Keypad-driven interface for on-the-fly reconfiguration of timers and credentials.

## Architecture and Modules

The design is modularized to ensure clarity, domain isolation, and ease of testing. [cite_start]Custom packed data types (`structs`) are used to structure communication between logic blocks.

* `FechaduraTop`: The main system wrapper. [cite_start]Routes I/O signals such as the keypad matrix, interrupt buttons, sensors, and display outputs.
* `operacional`: Primary control and datapath module. [cite_start]Evaluates inputs, manages timeout counters, verifies buffer credentials, and controls lock and alarm pins.
* `setup`: Isolated FSM dedicated to reconfiguration. [cite_start]Intercepts keypad inputs upon Master Password authentication to update global parameters.
* `decodificador_de_teclado`: Implements continuous 4x4 matrix scanning, mechanical debouncing filter, and BCD packaging of valid digits[cite: 1, 2].
* `display`: Combinational module for routing and converting BCD signals to the six 7-segment displays[cite: 1, 3].
* `resetHold5s`: Integrated safety circuit requiring a continuous 5-second high logic signal on the physical button to propagate a reset to all system registers.

## Verification and Simulation

[cite_start]Validation of combinational logic, state transitions, and timing was performed entirely through Testbench-oriented simulations, ensuring expected behavior before physical synthesis[cite: 1, 2].

**To reproduce simulations:**
1. Clone this repository.
2. Import the source files (`.sv`) into [EDA Playground](https://www.edaplayground.com/).
3. Select a SystemVerilog-compatible simulator (e.g., Synopsys VCS).
4. Run the main testbench.
5. Use **EPWave** to analyze waveforms, verifying lock actuation and state transitions.

## Authors

1. Computer Engineering Students:
- **Hillary Maximino Andrade** | [Linkedin](https://www.linkedin.com/in/hillarymaximino/)
- **Luma Sousa de Queiroz** | [Linkedin](https://www.linkedin.com/in/luma-sousa-de-queiroz/)
- **Letícia Vitória Souza Soares** | [Linkedin](https://www.linkedin.com/in/leticiavitoriadev/)
