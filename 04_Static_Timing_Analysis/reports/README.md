# Static Timing Analysis Reports

## Overview

This folder contains OpenSTA timing reports for the FSM-Based Traffic Light Controller with Countdown Timer project, using the SKY130HD standard-cell library.

The reports cover 16 configured Process, Voltage, and Temperature (PVT) corners and provide timing information for the analyzed design.

## 📁 Report Organization

Each `.rpt` file corresponds to a specific PVT corner:

- **FF:** Fast process corner
- **SS:** Slow process corner
- **TT:** Typical process corner

The filenames identify the process corner, temperature, and supply voltage.

## Information in Each Report

Each report includes timing information such as:

- Maximum-delay paths and setup-related checks
- Minimum-delay paths and hold-related checks
- Asynchronous reset recovery and removal checks
- Data arrival times and required times
- Slack values and timing violation summaries

## Using the Reports

Open an individual report to inspect its timing paths and slack values. Comparing reports across PVT corners helps identify how operating conditions affect the timing behavior of the design.

---

<p align="center">
  <b>Designed and Documented by Shaik Farida</b><br/>
  VLSI Design | Static Timing Analysis | OpenSTA
</p>

<p align="center">
  <i>"Accurate timing analysis helps reveal the timing challenges behind digital hardware."</i>
</p>


