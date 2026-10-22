# Static Timing Analysis (STA)

<p align="center">
  <img src="https://img.shields.io/badge/Tool-OpenSTA-blueviolet?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Library-SKY130HD-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/PVT_Corners-16-orange?style=for-the-badge" />
</p>

## Overview

In this stage of my **FSM-Based Traffic Light Controller with Countdown Timer** project, I performed Static Timing Analysis (STA) using OpenSTA and the SKY130HD standard-cell library.

The purpose of STA is to analyze the timing paths of a synthesized digital design and evaluate timing requirements such as setup, hold, and asynchronous reset recovery and removal.

I analyzed the design across 16 configured Process, Voltage, and Temperature (PVT) corners and organized the generated reports for further evaluation.

## Objectives

- Analyze maximum-delay and minimum-delay timing paths.
- Define timing constraints using an SDC file.
- Evaluate setup and hold timing behavior.
- Examine asynchronous reset recovery and removal checks.
- Run timing analysis across multiple PVT corners.
- Compare timing results using graphs.
- Identify timing violations that may require further investigation.

## Tools and Technologies

| Component | Description |
|---|---|
| OpenSTA | Static Timing Analysis tool |
| SKY130HD | Standard-cell library |
| SDC | Timing constraints |
| Tcl | Timing analysis script |
| Shell Script | Multi-corner analysis automation |
| PVT Analysis | Evaluation across 16 configured corners |

## 📂 Project Files

| File or Folder | Purpose |
|---|---|
| `traffic_light.sdc` | Defines clock and timing constraints |
| `traffic_light_sta.tcl` | Loads the timing environment and runs STA commands |
| `run_all_corners.sh` | Automates analysis across configured PVT corners |
| `reports/` | Contains 16 generated timing reports |
| `reports/README.md` | Explains the report files and their contents |

## Commands Used

The following commands are used to access the project files and run the multi-corner analysis script.

### 1. Navigate to the Project Directory

```bash
cd ~/traffic_light
```

### 2. Inspect the Project Files

```bash
ls
ls reports
```

These commands list the project files and the generated timing reports.

### 3. Inspect the Timing Constraints

```bash
cat traffic_light.sdc
```

The SDC file specifies timing constraints used by the timing analysis flow.

### 4. Inspect the OpenSTA Script

```bash
cat traffic_light_sta.tcl
```

The Tcl script contains the commands used to configure and perform timing analysis.

### 5. Inspect the Multi-Corner Script

```bash
cat run_all_corners.sh
```

This script contains the automation commands for running STA across the configured corners.

### 6. Run the Multi-Corner Analysis

```bash
chmod +x run_all_corners.sh
./run_all_corners.sh
```

The first command grants execute permission to the shell script. The second runs the analysis script.

**Note:** These are reproducible workflow commands. The exact OpenSTA invocation and input files depend on the contents of `traffic_light_sta.tcl` and `run_all_corners.sh`.

## Multi-Corner Timing Analysis

The design was analyzed across 16 configured PVT corners.

| Process Corner | Operating Conditions |
|---|---|
| FF | Fast process conditions |
| SS | Slow process conditions |
| TT | Typical process conditions |

The corner names also identify the temperature and supply-voltage conditions.

Analyzing multiple corners helps evaluate how timing behavior changes under different operating conditions.

## Timing Results and Graphical Analysis

The generated reports contain maximum-delay and minimum-delay timing paths, arrival times, required times, slack values, and timing summaries.

The timing results were organized for graphical comparison across the configured PVT corners.

### Setup Timing Analysis

Setup timing analysis evaluates whether data reaches a sequential element early enough to satisfy its setup requirement.

The setup slack values can be compared across PVT corners to identify the conditions with the smallest timing margin.

### Hold and Minimum-Delay Analysis

Minimum-delay analysis checks short data paths and includes hold-related and asynchronous reset removal checks.

Negative slack indicates a violation of the particular timing requirement being checked. The type of check must be considered when interpreting the result.

### Timing Graphs

Add your generated graph images below. Upload the graph files to this folder using the filenames shown here, or update the paths to match your actual image filenames.

#### Setup Slack Across PVT Corners

![Setup Slack Comparison](setup_slack_comparison.png)

#### Hold or Minimum-Delay Slack Across PVT Corners

![Minimum-Delay Slack Comparison](hold_slack_comparison.png)

The graphs make it easier to compare timing behavior between operating corners and identify conditions that require further investigation.

## Important Timing Concepts

- **Setup Slack:** Indicates whether data meets the setup timing requirement.
- **Hold Slack:** Indicates whether data meets the hold timing requirement.
- **WNS:** Worst Negative Slack, a summary of the worst timing slack under the reported analysis convention.
- **TNS:** Total Negative Slack, a summary of negative slack across violating timing paths.
- **Recovery Check:** Evaluates asynchronous reset deassertion timing relative to a clock edge.
- **Removal Check:** Evaluates the minimum timing requirement associated with asynchronous reset deassertion.

The meaning of each reported slack value depends on the timing check and report convention.

## 📁 Timing Reports

The `reports/` folder contains individual `.rpt` files for all 16 configured PVT corners.

Each report can be opened to inspect its timing paths, timing checks, slack values, and summary information.

For details about the report files, see [`reports/README.md`](reports/README.md).

## Summary

This stage documents the Static Timing Analysis workflow for my traffic light controller using OpenSTA and the SKY130HD standard-cell library.

I configured timing constraints, automated analysis across multiple PVT corners, reviewed the generated reports, and organized timing results for graphical comparison.

The reports and graphs provide a basis for investigating timing behavior and identifying potential issues for further optimization.

---

<p align="center">
  <b>Designed and Documented by Shaik Farida</b><br/>
  VLSI Design | Static Timing Analysis | OpenSTA | Multi-Corner Analysis
</p>

<p align="center">
  <i>"A reliable digital design must satisfy its timing requirements across its intended operating conditions."</i>
</p>
