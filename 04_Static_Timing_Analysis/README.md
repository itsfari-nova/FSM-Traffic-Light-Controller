# Static Timing Analysis (STA)

<p align="center">
  <img src="https://img.shields.io/badge/Analysis-OpenSTA-blueviolet?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Technology-SKY130HD-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Stage-Pre--Layout-orange?style=for-the-badge" />
</p>

## Overview

Static Timing Analysis (STA) is used to evaluate the timing behavior of a digital design without applying simulation test vectors. It checks whether signal paths satisfy the required timing constraints.

In this project, I used **OpenSTA** to analyze the timing characteristics of my **FSM-Based Traffic Light Controller with Countdown Timer**, using the SKY130HD standard-cell library.

## Objectives

- Analyze timing paths in the synthesized design.
- Apply clock and input/output timing constraints.
- Evaluate setup and hold timing.
- Examine timing behavior across multiple process, voltage, and temperature (PVT) corners.
- Identify timing violations for further investigation.

## Tools and Technology

| Component | Details |
|---|---|
| Timing Analysis Tool | OpenSTA |
| Standard-Cell Library | SKY130HD |
| Timing Constraints | Synopsys Design Constraints (SDC) |
| Design | FSM-Based Traffic Light Controller with Countdown Timer |
| Analysis Stage | Pre-Layout STA |

## 📂 Files Used

| File | Description |
|---|---|
| `traffic_light.sdc` | Defines clock and timing constraints |
| `traffic_light_sta.tcl` | OpenSTA script for loading the design and running timing analysis |
| `run_all_corners.sh` | Automates timing analysis across configured PVT corners |
| `reports/` | Stores generated timing reports |

## Timing Analysis Flow

1. Load the SKY130HD timing library.
2. Read the synthesized gate-level netlist.
3. Define the clock and timing constraints.
4. Check the design and timing environment.
5. Run setup and hold timing analysis.
6. Repeat the analysis across the configured PVT corners.
7. Review the reports and identify timing violations.

## Timing Parameters

### Setup Timing

Setup analysis checks whether data reaches a sequential element early enough before the active clock edge.

### Hold Timing

Hold analysis checks whether data remains stable for the required interval after the active clock edge.

### Slack

Slack represents the difference between the required arrival time and the actual arrival time, using the timing tool's reporting convention.

- **Positive slack:** The checked timing requirement is satisfied.
- **Negative slack:** The checked timing requirement is violated.

## Multi-Corner Analysis

The design was evaluated using multiple PVT corners from the SKY130HD library. These corners represent different process conditions, temperatures, and supply voltages.

The purpose of multi-corner analysis is to identify timing behavior under different operating conditions rather than relying on a single typical corner.

## Timing Results and Observations

The earlier timing analysis reported a setup timing violation at the `ss_n40C_1v28` corner, with a worst negative slack (WNS) of approximately **−6.33 ns**. The other 15 configured corners showed positive setup slack in that run.

The reported hold slack was positive across all 16 corners.

These results indicate that the design requires further investigation at the identified setup corner. The actual reports should be retained to support these observations.

> **Note:** These are results from an earlier analysis run. Confirm them against the reports included in this repository before treating them as final.

## Conclusion

Static Timing Analysis provides an important view of the timing behavior of the synthesized traffic light controller. By examining setup slack, hold slack, and multiple PVT corners, I identified a corner that requires additional setup-timing investigation.

This stage establishes the timing-analysis baseline for the subsequent physical-design and post-layout analysis stages.

---

<p align="center">
  <b>Designed and Documented by Shaik Farida</b><br/>
  VLSI Design | Static Timing Analysis | OpenSTA
</p>

<p align="center">
  <i>"Reliable digital design requires not only correct logic, but also timing that meets its constraints."</i>
</p>

