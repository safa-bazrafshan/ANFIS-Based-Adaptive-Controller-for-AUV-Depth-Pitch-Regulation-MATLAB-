# ANFIS-Based Adaptive Controller for AUV Depth & Pitch Regulation (MATLAB)

This repository provides a complete MATLAB implementation of an **Adaptive Neuro-Fuzzy Inference System (ANFIS)** trained using a **Model Reference Adaptive Controller (MRAC)** for regulating the **depth** and **pitch** of an Autonomous Underwater Vehicle (AUV).

The project includes a clean 4-state AUV model, data generation pipeline, controller training, simulation scripts, result saving, and full documentation.

---

## 🚀 Key Features

- 4-state linear AUV dynamic model  
- MRAC controller used as the “teacher” for ANFIS learning  
- Stable ANFIS training with normalized and noise-augmented inputs  
- Fully automated training + simulation pipeline  
- Robust tracking performance for depth and pitch  
- All results saved automatically  
- Clean and modular MATLAB code  
- Professional scientific report (PDF)  
- User guide for parameters and customization  

---

## 📁 Project Structure

/Project
│── params.m % System parameters
│── run_MRAC.m % MRAC training data generator
│── run_ANFIS.m % ANFIS training + simulation
│── Docs/
│ ├── Scientific_Report_EN.pdf
│ ├── User_Guide_EN.pdf
│── Results/
└── ANFIS_4state/

---

## 🔧 How to Run

1. Open MATLAB  
2. Set the project directory as the working folder  
3. Run the ANFIS controller:

```matlab
run_ANFIS
The script automatically:

runs the MRAC simulation

generates training data

trains two ANFIS models (Fz & Mθ)

performs the full AUV simulation

saves all results and plots

---

📊 Output Plots

The simulation produces:

Depth tracking (reference vs. ANFIS)

Pitch tracking (reference vs. ANFIS)

Control inputs (Vertical Force Fz, Pitch Moment Mθ)

Tracking error norm

Saved .mat file of states, inputs, references, and FIS models

All results appear in:
/Results/ANFIS_4state/

---

⚙️ Editable Parameters

You can modify:

AUV matrices A, B

Sampling time dt

Reference signals

Noise level during training

ANFIS structure (InitialFIS, number of epochs, etc.)

Actuator limits (F_max, M_max)

Simulation time

A full explanation is provided in the User Guide PDF.

---

📬 Contact

For questions, improvements, or custom development requests:
safa.bazrafshan@gmail.com

---

🏷 License

This project is intended for academic and research use.
Commercial redistribution requires permission.
