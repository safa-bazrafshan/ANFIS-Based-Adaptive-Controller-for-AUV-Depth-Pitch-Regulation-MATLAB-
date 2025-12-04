ANFIS-Based AUV Depth & Pitch Controller (MATLAB)

This repository contains MATLAB code for training and testing an ANFIS-based adaptive controller for regulating the depth and pitch of an Autonomous Underwater Vehicle (AUV).
A 4-state linear AUV model is used, and training data is generated using an MRAC controller.

Contents

params.m

run_MRAC.m

run_ANFIS.m

Docs (Scientific report and user guide)

Results (saved figures and data)

How to Run

Open MATLAB.

Set the project folder as the working directory.

Run the script:

run_ANFIS


The script automatically generates training data, trains the ANFIS models, runs the full simulation, and saves results.

Outputs

Generated plots, trained ANFIS models, and simulation data are stored in:

Results/ANFIS_4state/

Editable Parameters

You can modify:

AUV model matrices

Simulation time

Reference signals

Noise levels

ANFIS structure and training settings

Actuator limits

More details are available in the user guide (PDF).

Contact

safa.bazrafshan@gmail.com
