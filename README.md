ANFIS-Based Adaptive Controller for AUV Depth & Pitch Regulation (MATLAB)

This repository provides a complete MATLAB implementation of an Adaptive Neuro-Fuzzy Inference System (ANFIS) trained using a Model Reference Adaptive Controller (MRAC) for stabilizing and regulating the Depth and Pitch of an Underwater Vehicle (AUV).

The project includes the full simulation environment, data generation pipeline, controller training, testing, and documentation.

🚀 Key Features

Full 4-state AUV dynamic model

MRAC controller used as the “teacher” for ANFIS learning

Robust ANFIS training using noisy, normalized inputs

Stable and reproducible control performance

Automatic result saving + plotting

Easily customizable parameters

Professional scientific documentation (PDF)

User guide for modifying and extending the system

📁 Repository Structure
/Project
│── params.m                % System parameters
│── run_MRAC.m             % Teacher MRAC simulation
│── run_ANFIS.m            % ANFIS training + control simulation
│── Docs/
│     ├── Scientific_Report_EN.pdf
│     ├── User_Guide_EN.pdf
│── Results/
      └── ANFIS_4state/

🔧 How to Run

Open MATLAB

Set the project folder as the working directory

Run the ANFIS controller:

run_ANFIS


The script will automatically:

simulate the MRAC model

generate training data

train the ANFIS models

run the final ANFIS-controlled AUV

save all results and plots

📊 Simulation Outputs

Depth tracking (reference vs. ANFIS)

Pitch tracking

Control inputs (Vertical force & Pitch moment)

ANFIS tracking error

Saved FIS models

MAT results for post-processing

⚙️ Editable Parameters

You can easily modify:

AUV dynamics (A, B matrices)

Reference trajectories

Sampling time

ANFIS structure (rules, epochs, initial FIS type)

Noise level

Normalization bounds

Actuator saturation limits

A detailed explanation is provided in the User Guide PDF.

📬 Contact for Full Version / Collaboration

To purchase the full package, request customization, or collaborate:

📧 Email: safa.bazrafshan@gmail.com

🏷 License

This project is intended for academic and research purposes.
Commercial redistribution requires written permission.
