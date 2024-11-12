# OFDM 16-64 QAM Implementation

## Overview
This project explores the implementation of Orthogonal Frequency Division Multiplexing (OFDM) with Quadrature Amplitude Modulation (QAM) schemes (16-QAM to 64-QAM) to optimize wireless communication efficiency. The MATLAB scripts provided simulate an OFDM transmission system that modulates, transmits, and demodulates signals, incorporating advanced signal processing techniques like pulse shaping and equalization.

The project is organized into two main directories: **Functions** and **Others**. Each directory contains various MATLAB scripts, waveforms, and supporting files to demonstrate the full implementation and testing of OFDM with different modulation schemes. The project also uses RF equipment to analyze and improve signal performance.
## Directories and Files
### Functions Directory

1. **iqDemodulation.m**  
   Handles the demodulation of the I/Q (In-phase and Quadrature) signals after OFDM transmission.
   
2. **iqModulation.m**  
   Modulates input data into I/Q signals to prepare them for OFDM transmission.
   
3. **ofdmDemodulation.m**  
   Performs the inverse OFDM operation to recover transmitted data after receiving the modulated signal.
   
4. **ofdmEqualization.m**  
   Implements equalization techniques to reduce interference and distortion in the received OFDM signals.
   
5. **ofdmModulation.m**  
   Converts input data into an OFDM signal by applying IFFT and combining subcarriers.
   
6. **pulseShaping.m**  
   Applies pulse shaping filters to reduce inter-symbol interference (ISI) and improve spectral efficiency.
   
7. **symbolDemapping.m**  
   Decodes symbols received after OFDM demodulation back into their original data bits.
   
8. **symbolMapping.m**  
   Maps data bits onto the respective QAM constellation points for modulation.
   
9. **waveformFormatConversion.m**  
   Converts raw waveform data into a format suitable for transmission through RF hardware.

### Others Directory

1. **16pskofdm.WAVEFORM**  
   Contains waveform data for an OFDM transmission using 16-PSK modulation.
   
2. **16pskofdm_24sc_5cp.WAVEFORM**  
   Waveform with 24 subcarriers and 5 cyclic prefix lengths for 16-PSK OFDM.
   
3. **32pskofdm.WAVEFORM**  
   Waveform data for 32-PSK OFDM transmission.
   
4. **integration.m**  
   Integration script for combining various system components for overall testing.
   
5. **receiverOFDM.m**  
   Script responsible for handling OFDM signal reception, demodulation, and error detection.
   
6. **transmitterOFDM.m**  
   Handles the transmission side of the OFDM signal, including modulation, waveform generation, and sending the signal through the transmission channel.
---
## Equipment Used
The following RF equipment was essential for signal generation, transmission, and analysis during the project:

1. **Signal Generators**  
   Used to generate the modulated OFDM signals for transmission.

2. **RF Analyzers**  
   Analyzes the frequency, phase, and power of the modulated signal after transmission.
   
3. **Oscilloscopes**  
   Captures the transmitted signals and verifies their time-domain characteristics.
---
## Project Workflow

### 1. Signal Generation
- The `generate_ofdm_signal.m` script generates OFDM signals using QAM modulation (16-QAM to 64-QAM).
- Pulse shaping is applied to ensure spectral efficiency and to minimize inter-symbol interference.

### 2. Transmission
- OFDM signals are transmitted via MATLAB scripts such as `transmitterOFDM.m`, which format the data for transmission through the RF equipment.

### 3. Reception and Demodulation
- The OFDM signal is received and processed using `receiverOFDM.m`, which demodulates the signal, equalizes it, and performs symbol demapping.

### 4. Error Detection and Analysis
- The project incorporates various techniques to analyze the performance of modulation schemes by comparing the demodulated data with the original transmitted data.

---

## Key Features

- **OFDM Modulation/Demodulation**: Handles all the crucial steps of OFDM, including IFFT, cyclic prefix insertion, and channel equalization.
- **QAM Modulation**: Supports multiple QAM modulation schemes, enhancing data rates and communication efficiency.
- **Error Analysis**: Uses error metrics to evaluate the performance of the communication system.
  
---

## How to Run the Project

1. Download all the files in the **Functions** and **Others** directories.
2. Ensure you have MATLAB installed on your system.
3. To simulate the OFDM process, run `transmitterOFDM.m` to generate the waveform and send it to the SG.
4. Use `receiverOFDM.m` to receive and demodulate the signal.
