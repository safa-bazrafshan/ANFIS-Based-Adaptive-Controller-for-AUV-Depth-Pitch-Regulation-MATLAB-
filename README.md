ANFIS-Based Adaptive Controller for AUV Depth & Pitch Regulation (MATLAB)

This repository provides a complete MATLAB implementation of an Adaptive Neuro-Fuzzy Inference System (ANFIS) trained using a Model Reference Adaptive Controller (MRAC) for regulating the depth and pitch of an Autonomous Underwater Vehicle (AUV).

The project includes a clean 4-state AUV model, data generation pipeline, controller training, simulation scripts, automatic result saving, and full documentation.

🚀 Key Features

4-state linear AUV dynamic model

MRAC controller used as the “teacher” for ANFIS learning

Stable ANFIS training with normalized + noise-augmented inputs

Fully automated training + simulation pipeline

Robust tracking performance for depth and pitch regulation

All results saved automatically

Clean, modular MATLAB code

Professional scientific report (PDF)

User guide explaining parameters and customization

📁 Project Structure

Project/
│── params.m — System parameters
│── run_MRAC.m — MRAC training data generator
│── run_ANFIS.m — ANFIS training + simulation
│
├── Docs/
│ ├── Scientific_Report_EN.pdf
│ ├── User_Guide_EN.pdf
│
└── Results/
  └── ANFIS_4state/

🔧 How to Run

Open MATLAB

Set the project directory as the working folder

Run the ANFIS controller:

run_ANFIS

The script automatically:

runs the MRAC simulation

generates training data

trains two ANFIS models (Fz & Mθ)

performs the full AUV simulation

saves all results and plots

📊 Output Plots

The simulation produces:

Depth tracking (reference vs. ANFIS)

Pitch tracking (reference vs. ANFIS)

Control inputs (Vertical Force Fz, Pitch Moment Mθ)

Tracking error norm

Saved .mat file containing states, inputs, references, and FIS models

All results appear in:

Results/ANFIS_4state/

⚙️ Editable Parameters

You can modify:

AUV matrices A and B

Sampling time dt

Reference signals

Training noise level

ANFIS structure (InitialFIS, Epochs, etc.)

Actuator limits (F_max, M_max)

Total simulation duration

All parameter descriptions are included in the User Guide PDF.

📬 Contact

For questions, improvements, or custom development requests:
safa.bazrafshan@gmail.com

🏷 License

This project is intended for academic and research use.
Commercial redistribution requires permission.
