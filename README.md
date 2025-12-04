🚀 ANFIS-Based Adaptive Controller for AUV Depth & Pitch (MATLAB)

A clean and complete MATLAB implementation of an Adaptive Neuro-Fuzzy (ANFIS) controller trained using a Model Reference Adaptive Controller (MRAC) for depth and pitch regulation of an Autonomous Underwater Vehicle (AUV).

This package includes a 4-state AUV model, ANFIS training pipeline, MRAC data generation, full simulation scripts, result saving, and professional documentation.

⭐ Features

4-state linear AUV dynamic model

MRAC used as the “teacher” for training ANFIS

Stable learning with normalization + noise augmentation

Fully automated training + simulation workflow

Depth & pitch tracking with high robustness

All plots + data automatically saved

Modular, readable MATLAB code

Scientific report + user guide included

📁 Repository Structure
Project/
│── params.m              % System parameters
│── run_MRAC.m            % Data generation using MRAC
│── run_ANFIS.m           % ANFIS training + simulation
│
├── Docs/
│   ├── Scientific_Report_EN.pdf
│   └── User_Guide_EN.pdf
│
└── Results/
    └── ANFIS_4state/
▶️ How to Run

Open MATLAB

Set the project folder as your working directory

Run:

run_ANFIS


The script will automatically:

run MRAC

generate training data

train ANFIS (Fz & Mθ)

simulate AUV response

save all results

📊 Outputs

The simulation generates:

Depth tracking

Pitch tracking

Control inputs (Fz, Mθ)

Error norms

Saved .mat model + data

All stored in:

Results/ANFIS_4state/

⚙️ Editable Parameters

AUV matrices (A, B)

Sampling time

Reference signals

Noise levels

ANFIS structure

Actuator limits

Simulation duration

More details in User_Guide_EN.pdf.

📬 Contact

For questions, collaboration, or custom controller development:
safa.bazrafshan@gmail.com

📄 License

Academic & research use permitted.
Commercial redistribution requires permission.
