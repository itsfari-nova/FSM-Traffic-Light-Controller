

# 🚦 FSM-Based Traffic Light Controller with Countdown Timer

## Project Overview

The **FSM-Based Traffic Light Controller with Countdown Timer** is a digital design implemented using Verilog HDL. It uses a Finite State Machine (FSM) to control traffic signals in a predefined sequence and incorporates a countdown timer to indicate the remaining time for the active signal.

This project demonstrates the complete digital design flow, starting from RTL design and functional verification to synthesis, gate-level simulation, static timing analysis, and physical design using the SKY130HD standard-cell technology.

## Objectives

- Design a traffic light controller using a Finite State Machine.
- Implement sequential control of RED, GREEN, and YELLOW signals.
- Integrate a countdown timer for each traffic signal state.
- Verify functionality using a Verilog testbench.
- Perform RTL synthesis and gate-level simulation.
- Analyze timing before and after physical design.
- Evaluate timing performance across 16 process, voltage, and temperature (PVT) corners.

## Problem Statement

Traffic signals require reliable and systematic control to regulate vehicle movement at road intersections. A digital controller can automate signal transitions and provide a countdown indicating the remaining duration of each signal.

The objective of this project is to develop an FSM-based traffic light controller with a countdown timer and evaluate its functionality and implementation through digital design and VLSI design tools.

## Proposed Solution

The proposed system uses a synchronous Finite State Machine to control the sequence of traffic signals. A countdown timer tracks the remaining duration of the active state, while display outputs represent the countdown digits.

The design is described in Verilog HDL and verified through simulation. It is then synthesized using Yosys, evaluated through gate-level simulation, and taken through physical design and post-route timing analysis using SKY130HD technology.

## Functional Specifications

| Parameter | Specification |
|---|---|
| Project Type | Digital Sequential Design |
| Design Language | Verilog HDL |
| Controller | Finite State Machine (FSM) |
| Operation | Clock-driven synchronous control |
| Reset Behavior | Initializes the controller to RED |
| Traffic Signals | RED, GREEN, YELLOW |
| Timer | Countdown for the active signal |
| Display Outputs | Tens and units digit signals |
| Target Technology | SKY130HD |
| Clock Period for STA | 20 ns |
| RTL Simulation | Icarus Verilog |
| Waveform Analysis | GTKWave |
| Synthesis | Yosys |
| Physical Design | OpenROAD |
| Static Timing Analysis | OpenSTA |
| Timing Evaluation | 16 PVT corners |

## FSM State Description

| State | Active Signal | Function |
|---|---|---|
| RED | RED = 1 | Stops traffic |
| GREEN | GREEN = 1 | Allows traffic to proceed |
| YELLOW | YELLOW = 1 | Indicates a transition between traffic phases |

The FSM transitions between states according to the programmed sequence and countdown logic. The reset operation initializes the controller to the RED state.

## Countdown Timer

The countdown timer tracks the remaining duration of the active traffic signal. The countdown value is represented using the timer output and the tens and units display signals.

When the countdown reaches its programmed terminal value, the controller transitions to the next state according to the RTL implementation.

## Inputs and Outputs

### Inputs

| Signal | Description |
|---|---|
| `clk` | Clock input that synchronizes the controller |
| `reset` | Reset input that initializes the controller |

### Outputs

| Signal | Description |
|---|---|
| `red` | Controls the RED traffic signal |
| `green` | Controls the GREEN traffic signal |
| `yellow` | Controls the YELLOW traffic signal |
| `countdown` | Represents the countdown value |
| `seg_tens` | Represents the tens-digit display output |
| `seg_units` | Represents the units-digit display output |

## Tools and Technologies

- **Verilog HDL** — RTL design
- **Icarus Verilog** — RTL and gate-level simulation
- **GTKWave** — Simulation waveform analysis
- **Yosys** — RTL synthesis and technology mapping
- **SKY130HD** — Standard-cell technology library
- **OpenROAD** — Physical design implementation
- **OpenSTA** — Static timing analysis
- **GitHub** — Version control and project documentation

## Implementation Workflow

1. **Project Introduction and Specifications** — Define the problem, objectives, and functional requirements.
2. **RTL Design and Testbench** — Develop the Verilog design and verify its functionality.
3. **RTL Synthesis** — Convert the RTL design into a synthesized netlist.
4. **Gate-Level Simulation** — Verify the synthesized design.
5. **Pre-Layout STA** — Analyze timing before physical implementation.
6. **Physical Design** — Perform floorplanning, placement, clock-related implementation, and routing as configured in the flow.
7. **Post-Layout Multi-Corner STA** — Evaluate timing using extracted parasitics and 16 PVT corners.
8. **Project Demonstration** — Document the workflow and present the results.

## Timing Analysis Summary

Post-route timing analysis was performed across 16 PVT corners using OpenSTA.

- **Total corners evaluated:** 16
- **Corners without reported setup violations:** 15
- **Corner requiring further timing investigation:** `ss_n40C_1v28`
- **Worst setup slack at `ss_n40C_1v28`:** -6.33 ns
- **Hold slack:** Positive across all 16 evaluated corners

The negative setup slack at `ss_n40C_1v28` indicates a setup timing violation that requires further investigation and optimization. Therefore, the design should not be considered setup-clean across all corners.

## Expected Outcome

This project demonstrates the implementation of an FSM-based traffic light controller with a countdown timer and explores the VLSI design flow from RTL development to physical implementation.

It provides practical experience in digital design, functional verification, synthesis, standard-cell mapping, physical design, and multi-corner static timing analysis.

## Author

**Shaik Farida**

B.Tech — Electronics and Communication Engineering (ECE)

Project: FSM-Based Traffic Light Controller with Countdown Timer

---

<p align="center">
  <i>"From RTL design to silicon — learning VLSI one stage at a time."</i>
</p>
