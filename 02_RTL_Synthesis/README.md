# RTL Synthesis & Technology Mapping

<p align="center">
  <img src="https://img.shields.io/badge/HDL-Verilog-blue?style=for-the-badge" alt="Verilog">
  <img src="https://img.shields.io/badge/Synthesis-Yosys-purple?style=for-the-badge" alt="Yosys">
  <img src="https://img.shields.io/badge/Technology-SKY130HD-green?style=for-the-badge" alt="SKY130HD">
</p>

<h3 align="center">FSM-Based Traffic Light Controller with Countdown Timer</h3>

<p align="center">
  <i>From RTL Description to Standard-Cell Implementation</i>
</p>

---

## Table of Contents

- [1. Introduction](#-1-introduction)
- [2. Objectives](#-2-objectives)
- [3. Synthesis Flow](#-3-synthesis-flow)
- [4. Tools and Technology](#-4-tools-and-technology)
- [5. Generic RTL Synthesis](#-5-generic-rtl-synthesis)
- [6. SKY130HD Technology Mapping](#-6-sky130hd-technology-mapping)
- [7. Yosys Synthesis Schematic](#-7-yosys-synthesis-schematic)
- [8. Generated Artifacts](#-8-generated-artifacts)
- [9. Synthesis Results and Verification](#-9-synthesis-results-and-verification)
- [10. Summary](#-10-summary)

## 1. Introduction

RTL synthesis is a key stage in the digital VLSI design flow. It transforms a Register Transfer Level (RTL) description written in Verilog HDL into a gate-level representation that can be implemented using standard cells.

In this stage, I used **Yosys**, an open-source synthesis tool, to synthesize my FSM-Based Traffic Light Controller with Countdown Timer. The flow covers generic synthesis, logic optimization, technology mapping, and the generation of synthesis reports.

The synthesized design provides the foundation for Gate-Level Simulation (GLS) and subsequent timing analysis.

## 2. Objectives

- Convert the Verilog RTL design into a synthesized gate-level netlist.
- Perform logic synthesis and optimization using Yosys.
- Generate a technology-independent netlist.
- Map the design to SKY130HD standard cells.
- Inspect the synthesized logic using the Yosys schematic viewer.
- Analyze cell statistics and synthesis reports.
- Prepare the synthesized design for gate-level verification.

## 3. Synthesis Flow

```text
       Verilog RTL Design
               |
               v
       Read RTL Source
               |
               v
     Hierarchy and Checks
               |
               v
      Logic Optimization
               |
               v
        Generic Synthesis
               |
               v
    Generic Gate-Level Netlist
               |
               v
     SKY130HD Technology Mapping
               |
               v
      Mapped Gate-Level Netlist
               |
               v
    Schematic and Report Analysis
               |
               v
       Gate-Level Simulation
```

## 4. Tools and Technology

| Tool / Component | Purpose |
|---|---|
| Verilog HDL | RTL design description |
| Yosys | Logic synthesis and technology mapping |
| SKY130HD | Standard-cell library |
| Liberty (`.lib`) | Cell functionality and timing information |
| `show` command | Visualization of synthesized logic |
| Synthesis reports | Cell statistics and design analysis |

**Technology library used:**

`sky130_fd_sc_hd__tt_025C_1v80.lib`

**Library path:**

`/home/vsduser/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib`

## 5. Generic RTL Synthesis

Generic synthesis converts the RTL design into a technology-independent gate-level representation.

The following commands illustrate the generic synthesis workflow.

### Step 1: Launch Yosys

```bash
yosys
```

### Step 2: Read the RTL source

```yosys
read_verilog traffic_light.v
```

### Step 3: Check the design hierarchy

```yosys
hierarchy -check -top traffic_light
```

### Step 4: Perform synthesis

```yosys
synth -top traffic_light
```

### Step 5: Display synthesis statistics

```yosys
stat
```

### Step 6: View the synthesized schematic

```yosys
show
```

The `show` command opens a graphical representation of the current design in the Yosys schematic viewer.

### Step 7: Export the generic netlist

```yosys
write_verilog traffic_light_netlist.v
```

### Step 8: Exit Yosys

```yosys
exit
```

**Output:** `traffic_light_netlist.v`

This netlist represents the synthesized logic before mapping it to a specific standard-cell library.

## 6. SKY130HD Technology Mapping

Technology mapping converts the synthesized logic into cells supported by the SKY130HD standard-cell library.

The Liberty file provides the cell definitions and timing information needed by the mapping flow.

### Step 1: Launch Yosys

```bash
yosys
```

### Step 2: Define the library path

The following path identifies the SKY130HD Liberty file used in this project.

```yosys
read_liberty -lib /home/vsduser/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

### Step 3: Read and check the RTL design

```yosys
read_verilog traffic_light.v
hierarchy -check -top traffic_light
```

### Step 4: Perform generic synthesis

```yosys
synth -top traffic_light -flatten
```

### Step 5: Map sequential cells

```yosys
dfflibmap -liberty /home/vsduser/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

### Step 6: Map combinational logic

```yosys
abc -liberty /home/vsduser/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

### Step 7: Clean the design and inspect statistics

```yosys
clean
stat -liberty /home/vsduser/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

### Step 8: Export the mapped netlist

```yosys
write_verilog -noattr traffic_light_sky130.v
```

### Step 9: Exit Yosys

```yosys
exit
```

**Output:** `traffic_light_sky130.v`

The mapped netlist represents the design using SKY130HD standard cells.

## 7. Yosys Synthesis Schematic

The Yosys schematic viewer provides a visual representation of the synthesized logic and helps illustrate how the RTL design is transformed during synthesis.

Save the screenshot captured from your Yosys `show` command in this folder using the filename `yosys_synthesis_schematic.png`.

<p align="center">
  <img width="1900" height="900" alt="yosys_show_traffic light" src="https://github.com/user-attachments/assets/60aafb08-96fc-4e6e-baf2-e081489a3833" />
</p>

<p align="center">
  <i>Figure 1: Synthesized logic schematic viewed using Yosys.</i>
</p>

## 8. Generated Artifacts

| File | Description |
|---|---|
| `traffic_light_netlist.v` | Generic synthesized netlist |
| `traffic_light_sky130.v` | SKY130HD-mapped netlist |
| `synthesis_report.txt` | Generic synthesis report |
| `sky130_synthesis_report.txt` | SKY130HD synthesis report |
| `yosys_synthesis_schematic.png` | Screenshot of the Yosys schematic|

These artifacts document the synthesis process and provide the design representations required for further verification.

## 9. Synthesis Results and Verification

The synthesis reports provide information about the structure and cell composition of the generated design.

The following parameters are useful when analyzing the reports:

- **Cell statistics:** Number and types of cells generated.
- **Sequential logic:** Flip-flops and other sequential elements.
- **Combinational logic:** Logic gates and optimized combinational structures.
- **Technology mapping:** Standard cells selected from the SKY130HD library.
- **Netlist integrity:** Presence of the expected top-level module and absence of unresolved generic cells.

The generated netlists should be inspected and simulated to verify their functionality. Synthesis completion alone does not establish functional equivalence between the RTL and the mapped implementation.

## 10. Summary

In this stage, I explored the RTL synthesis flow using Yosys, from reading and elaborating the Verilog design to synthesizing the logic and generating gate-level netlists. I also studied SKY130HD technology mapping, examined synthesis statistics, and used the Yosys schematic viewer to visualize the synthesized circuit.

The generated netlists and synthesis reports establish the foundation for the next stage of my VLSI workflow: **Gate-Level Simulation (GLS)**, followed by implementation and timing analysis.

---

<p align="center">
  <b>RTL Design → Synthesis → Technology Mapping → Gate-Level Verification</b>
  <br><br>
  <i>Designed and documented by</i>
  <br>
  <b>Shaik Farida</b>
  <br><br>
  <i>Exploring digital design, synthesis, and VLSI implementation.</i>
</p>

