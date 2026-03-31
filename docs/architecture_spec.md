RISC-V SoC Architecture & RF DSP Specification

 1. System Overview
This document outlines the architecture for the custom RISC-V SoC,
designed specifically to accelerate Radio Frequency (RF) digital signal processing tasks. 

 3. RF DSP Accelerator
The core hardware accelerator is a 4-tap Moving Average Filter (`rf_dsp_filter.v`). 
* **Purpose:** To smooth high-frequency noise from baseband signals post-ADC conversion.
* **Interface:** Memory-mapped to the RV32I core.
* **Data Width:** 16-bit input/output to match standard RF ADC resolutions.

3. Hardware-Software Integration
The CPU will fetch raw signal data, write it to the accelerator's input registers,
and read back the filtered data. By moving this moving-average calculation into dedicated Verilog hardware,
we significantly reduce the instruction cycle overhead compared to a pure software implementation on the RISC-V core.
