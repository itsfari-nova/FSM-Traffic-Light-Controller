# Static Timing Analysis Reports

## Overview

This folder contains the timing reports generated using **OpenSTA** for my FSM-Based Traffic Light Controller with Countdown Timer project.

The reports document the timing analysis performed using the SKY130HD standard-cell library across 16 configured Process, Voltage, and Temperature (PVT) corners.

## Purpose

- Evaluate setup and hold timing.
- Analyze timing slack across different PVT corners.
- Identify potential timing violations.
- Compare timing behavior under different operating conditions.

## 📁 Report Files

Each report corresponds to a specific PVT corner.

- **FF (Fast-Fast):** Fast process corner.
- **SS (Slow-Slow):** Slow process corner.
- **TT (Typical-Typical):** Typical process corner.

The filenames also identify the temperature and supply-voltage conditions.

## Key Observation

In the earlier analysis, the `ss_n40C_1v28` corner reported a setup Worst Negative Slack (WNS) of approximately **−6.33 ns**. The other 15 configured corners showed positive setup slack in that run.

The reported hold slack was positive across all 16 corners.

These results should be verified against the corresponding report files before drawing final conclusions.

## Conclusion

These reports provide evidence of the pre-layout timing analysis performed on the synthesized traffic light controller. They help identify timing issues that may require further investigation and optimization.

---

<p align="center">
  <b>Designed and Documented by Shaik Farida</b><br/>
  VLSI Design | Static Timing Analysis | Multi-Corner Analysis
</p>

<p align="center">
  <i>"Every timing report tells a story about the reliability of a digital design."</i>
</p>

