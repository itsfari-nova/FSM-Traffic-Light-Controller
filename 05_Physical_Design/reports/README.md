# Physical Design Reports

This directory contains the physical design reports of my **FSM-Based Traffic Light Controller with Countdown Timer**, implemented using OpenROAD and the SkyWater SKY130HD technology platform.

## Reports Overview

| Report File | Description |
|---|---|
| `2_floorplan_final.rpt` | Reports results after floorplanning, including initial physical-design and timing information. |
| `3_global_place.rpt` |Provides results after global placement, where standard cells are approximately positioned across the floorplan.|
| `3_detailed_place.rpt` | Reports the results of detailed placement, where cell locations are refined to legal positions. |
| `3_resizer.rpt` | Contains results from timing-driven optimization, including cell resizing and buffering.|
| `4_cts_final.rpt` |Reports results after Clock Tree Synthesis (CTS), which builds the clock distribution network.|
| `5_global_route.rpt` | Global routing analysis |
| `6_finish.rpt` | Final physical design and timing results |
| `synth_stat.txt` | Synthesized cell statistics and area |
| `synth_check.txt` | Yosys synthesis check results |


## Purpose

These reports help analyze the design's physical implementation, placement, timing optimization, clock distribution, routing, and synthesis statistics.

## Tools & Technology

- **Physical Design:** OpenROAD
- **Synthesis:** Yosys
- **Technology Platform:** SKY130HD

---

<p align="center">
  <i>Exploring the journey from synthesized logic to physical implementation.</i>
</p>

