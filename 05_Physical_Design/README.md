# Physical Design Implementation Using OpenROAD

<p align="center">
  <img src="https://img.shields.io/badge/Physical%20Design-OpenROAD-7C3AED?style=for-the-badge" alt="OpenROAD Physical Design"/>
  <img src="https://img.shields.io/badge/PDK-SKY130HD-4F46E5?style=for-the-badge" alt="SKY130HD"/>
  <img src="https://img.shields.io/badge/Flow-RTL%20to%20Layout-0891B2?style=for-the-badge" alt="RTL to Layout"/>
</p>

<p align="center">
  <i>Exploring the transformation of a synthesized digital design into a physically implemented layout.</i>
</p>

---

## Overview

In this stage of my VLSI project, I implemented the **FSM-Based Traffic Light Controller with Countdown Timer** using the **OpenROAD physical-design flow** and the **SkyWater SKY130HD standard-cell platform**.

After developing and synthesizing the RTL design, I explored the physical implementation stages that transform synthesized logic into a placed-and-routed design. I examined the generated databases, timing reports, power estimates, routing checks, and physical-design visualizations to understand how implementation decisions affect the final circuit.

This stage connects my earlier RTL design, synthesis, gate-level simulation, and static timing analysis work with practical ASIC implementation concepts.

## Design Objectives

- Execute the OpenROAD physical-design flow for the traffic-light controller.
- Understand floorplanning and power-distribution network preparation.
- Explore global placement, detailed placement, and placement optimization.
- Understand clock tree synthesis (CTS) and clock distribution.
- Inspect global and detailed routing results.
- Analyze final timing, power estimates, and design-rule checks.
- Document the implementation using actual reports and visualizations.

## Design Environment

| Parameter | Configuration |
|:--|:--|
| Design Name | `traffic_light` |
| Physical-Design Flow | OpenROAD Flow Scripts |
| Standard-Cell Platform | SKY130HD |
| Synthesis Tool | Yosys |
| Core Utilization | 35% |
| Placement Density | 0.50 |
| Configuration File | `config.mk` |
| Final Database | `6_final.odb` |
| Final Routed Netlist | `6_final.v` |
| Final Layout File | `6_final.def` |
| Extracted Parasitics | `6_final.spef` |

## Physical-Design Flow

### 1️⃣ Logic Synthesis

The RTL is synthesized using Yosys, which translates the design into a gate-level representation using cells from the SKY130HD standard-cell library.

**Key activities:**
- RTL synthesis and technology mapping.
- Standard-cell selection.
- Cell statistics and area estimation.
- Structural checks of the synthesized design.

### 2️⃣ Floorplanning

Floorplanning establishes the initial physical organization of the design and prepares the layout for subsequent implementation stages.

**Key activities:**
- Floorplan initialization.
- Core and design layout preparation.
- Floorplan database generation.
- Power-distribution network preparation.

### 3️⃣ Placement and Optimization

Placement determines the physical locations of standard cells within the floorplan. Optimization refines the implementation before clock-tree synthesis.

**Key activities:**
- Global placement.
- Detailed placement.
- Placement optimization and resizing.
- Inspection of placement and congestion visualizations.

### 4️⃣ Clock Tree Synthesis (CTS)

Clock tree synthesis constructs the clock distribution network needed to deliver clock signals to sequential elements.

**Key activities:**
- Clock-tree generation.
- Clock buffering and distribution.
- Clock latency and skew analysis.
- Timing-related optimization.

### 5️⃣ Routing

Routing establishes the physical interconnections between placed cells through global routing and detailed routing.

**Key activities:**
- Global routing.
- Detailed routing.
- Routing design-rule checks.
- Inspection of routing congestion and final interconnections.

### 6️⃣ Finalization and Reporting

The final implementation stages generate the completed design databases, routed netlist, parasitic information, and reports used to evaluate the implementation.

**Key activities:**
- Final design database generation.
- Parasitic information extraction.
- Timing and power reporting.
- Setup and hold checks.
- Final physical-design visualization.

## Implementation Results

The following values were observed in the generated synthesis and final implementation reports.

| Metric | Observed Result |
|:--|--:|
| Synthesized Cell Count | 277 |
| Synthesis-Reported Chip Area | 2542.4384 µm² |
| Problems Reported by Synthesis Check | 0 |
| Final Setup Violation Count | 0 |
| Final Hold Violation Count | 0 |
| Final Worst-Slack Metric | 14.64 |
| Estimated Total Power | Approximately 152 µW |

> **Note:** The cell count and area are from the synthesis statistics, before subsequent physical-design optimization. The final setup, hold, and worst-slack values are from `6_finish.rpt`. Interpret timing values according to the units and metric definitions in the original report. Power is an estimate based on the flow's modeling assumptions.

## Physical-Design Visualization Gallery

The OpenROAD flow generated visualizations to help inspect the physical implementation at different stages.

### Placement and Clock Distribution

| Final Placement | Clock Tree |
|:--:|:--:|
| ![Final Placement](screenshots/final_placement.webp.png) | ![Final Clocks](screenshots/final_clocks.webp.png) |

### Routing and Congestion

| Final Routing | Routing Congestion |
|:--:|:--:|
| ![Final Routing](screenshots/final_routing.webp.png) | ![Final Congestion](screenshots/final_congestion.webp.png) |

### Additional Physical-Design Analysis

| Final Resizer | IR Drop |
|:--:|:--:|
| ![Final Resizer](screenshots/final_resizer.webp.png) | ![Final IR Drop](screenshots/final_ir_drop.webp.png) |

### Critical Timing Path

<p align="center">
  <img src="screenshots/final_worst_path.webp.png" alt="Final Worst Timing Path" width="850"/>
</p>

*The visualizations will appear after the corresponding image files are uploaded to the `screenshots/` directory.*

## Reports and Analysis

The following reports were generated by the OpenROAD flow.

| Report File | Purpose |
|:--|:--|
| `2_floorplan_final.rpt` | Floorplanning report |
| `3_global_place.rpt` | Global placement report |
| `3_detailed_place.rpt` | Detailed placement report |
| `3_resizer.rpt` | Resizing and optimization report |
| `4_cts_final.rpt` | Clock tree synthesis report |
| `5_global_route.rpt` | Global routing report |
| `5_route_drc.rpt` | Routing design-rule check report |
| `6_finish.rpt` | Final timing, power, and design-check information |
| `synth_stat.txt` | Synthesis cell statistics |
| `synth_check.txt` | Synthesis structural-check output |

## Important Implementation Artifacts

| File | Description |
|:--|:--|
| `6_final.odb` | Final OpenROAD database |
| `6_final.def` | Final design in DEF format |
| `6_final.v` | Final gate-level Verilog netlist |
| `6_final.sdc` | Final timing constraints |
| `6_final.spef` | Extracted parasitic information |

These files represent different aspects of the implementation. The reports and selected screenshots are the primary documentation artifacts; the larger databases can be retained separately if repository size is a concern.

## Key Learnings

Through this physical-design exercise, I gained practical exposure to:

- The transition from RTL synthesis to physical implementation.
- Floorplanning, placement, and power-distribution preparation.
- Clock-tree synthesis and clock distribution.
- Global and detailed routing.
- Timing checks, parasitic extraction, and power estimation.
- Interpretation of synthesis statistics and physical-design reports.
- The role of visualization in understanding a digital circuit's physical implementation.

## Project Progression

This stage builds on my earlier work in RTL design, gate-level simulation, and static timing analysis. It demonstrates how a digital design progresses from synthesizable logic toward a physically implemented layout using an open-source ASIC design flow.

---

<p align="center">
  <b>Designed and Documented by Shaik Farida</b><br/>
  VLSI Design | RTL-to-Physical Design | OpenROAD
</p>

<p align="center">
  <i>"Good digital design is not only about the logic we write, but also about how that logic becomes a physical circuit."</i>
</p>

