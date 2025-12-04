# ANFIS-Based Adaptive Controller for AUV Depth & Pitch (MATLAB)

This repository provides a clean and modular MATLAB implementation of an ANFIS-based controller for regulating the **depth** and **pitch** of a 4-state Autonomous Underwater Vehicle (AUV).  
Training data is generated using a Model Reference Adaptive Controller (MRAC), and two ANFIS networks are trained for the control inputs **Fz** and **Mθ**.

## Features
- 4-state linear AUV dynamic model  
- MRAC used as the teacher for ANFIS learning  
- Stable and noise-augmented ANFIS training  
- Fully automated simulation and result-saving pipeline  
- Modular MATLAB scripts  
- Scientific documentation and user guide included  

## Project Structure
```
Project/
│── params.m
│── run_MRAC.m
│── run_ANFIS.m
│
├── Docs/
│   ├── Scientific_Report_EN.pdf
│   └── User_Guide_EN.pdf
│
└── Results/
    └── ANFIS_4state/
```

## How to Run
1. Open MATLAB.  
2. Set the project directory as the working folder.  
3. Run the main script:
```
run_ANFIS
```

The script will:
- Run MRAC and generate training data  
- Train ANFIS models for both control channels  
- Simulate the AUV with the trained controller  
- Save plots and .mat files in the Results folder  

## Outputs
The simulation automatically generates:
- Depth tracking plot  
- Pitch tracking plot  
- Control inputs (Fz, Mθ)  
- Tracking error  
- Saved ANFIS models and simulation data  

All files are stored in:
```
Results/ANFIS_4state/
```

## Editable Parameters
You can customize:
- AUV system matrices (A, B)  
- Sampling time  
- Simulation duration  
- Reference trajectories  
- Noise levels  
- ANFIS training structure  
- Actuator limits  

Refer to the “User Guide” PDF for full instructions.

## Contact
For questions or collaborations:  
**safa.bazrafshan@gmail.com**

## Note

This is a demo version of the project.  
Full version with all features, PDF documentation, and results is available for purchase.  
For access to the full package, please contact: safa.bazrafshan@gmail.com

