# Roadmap — Electronic Lock on FPGA

This document presents the progress of the electronic lock project development, highlighting what has already been completed, what is in progress, and the next steps.

---

## 📌 Overview

- 🎯 Objective: To develop an electronic lock on an FPGA using SystemVerilog
- 🧩 Modular Architecture:

- Keyboard

- Operational

- Setup

- Display
- ⚙️ Approach:

- Simulation

- Synthesis

- Hardware Testing

---

## ✅ Completed

- [x] System Architecture Definition
- [x] Initial Project Modeling
- [x] Keyboard Module Implementation
- [x] Matrix Keyboard Reading System
- [x] Debounce Implementation
- [x] Key Conversion to BCD
- [x] Storage of up to 20 digits
- [x] Input Timeout Implementation (5s)
- [x] Handling of Special Keys (* and #)
- [x] Keyboard Module Simulation
- [x] Synthesis Validated in FPGA

---

## 🚧 Under Development

- [ ] Initial integration between modules
- [ ] Basic structure of the setup module
- [ ] Definition of the main system states
- [ ] Communication between keyboard and setup

---

## 🔜 Next Steps

### 🔷 Operational Module
- [ ] Implement password validation
- [ ] Implement lock control
- [ ] Implement attempt control
- [ ] Implement error locking
- [ ] Implement beep control
- [ ] Implement door logic (open/closed)

---

### 🔷 Setup Module (Configuration)
- [ ] Implement entry into configuration mode
- [ ] Implement authentication (master password)
- [ ] Implement menu navigation
- [ ] Implement time configuration
- [ ] Implement password configuration
- [ ] Integration with operational module

---

### 🔷 Module Display
- [ ] Implement 7-segment display driver
- [ ] Display values ​​in operating mode
- [ ] Display menus in configuration mode
- [ ] Display system errors and states

---

### 🔷 Final Integration
- [ ] Integration of all modules
- [ ] Complete system tests
- [ ] FPGA tests
- [ ] Timing and performance adjustments

---

## 🧪 Testing and Validation

- [ ] Integration tests between modules
- [ ] Invalid input tests
- [ ] Timeout tests
- [ ] Multiple attempt tests
- [ ] Configuration tests
- [ ] Tests with real hardware

---

## 🎯 Future Improvements (Optional)

- [ ] More intuitive display interface
- [ ] Access attempt log
- [ ] Multi-user system
- [ ] Communication with external systems (IoT)
- [ ] Application Mobile/Web Control

---

## 🧠 Notes

- The project is being developed in a modular way, allowing for incremental evolution.

- The complete source code for the design will be made available later.

- Documentation is being built in parallel with development.

---
