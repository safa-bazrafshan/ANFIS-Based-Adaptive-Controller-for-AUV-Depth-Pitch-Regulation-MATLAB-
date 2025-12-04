%% run_ANFIS.m 
clear; clc; close all;

% Load parameters
params;

% -----------------------------
% Step 1: Generate training data using MRAC simulation
run('run_MRAC.m'); % Use MRAC as teacher

% Inputs: errors and derivatives
train_input  = [ (z_ref - x(1,:))'  (theta_ref - x(3,:))' x(2,:)' x(4,:)' ]; % [e_z, e_theta, dz, dtheta]
% Outputs: control inputs
train_output = u'; % [F_z, M_theta]

% -----------------------------
% Step 1b: Add tiny noise to inputs AND outputs
epsilon = 1e-3;
train_input  = train_input  + epsilon*randn(size(train_input));
train_output = train_output + epsilon*randn(size(train_output));

% -----------------------------
% Step 1c: Normalize inputs to [-1,1]
train_input_norm = train_input;
for i = 1:size(train_input,2)
    min_val = min(train_input(:,i));
    max_val = max(train_input(:,i));
    train_input_norm(:,i) = 2*(train_input(:,i)-min_val)/(max_val - min_val) - 1;
end

% -----------------------------
% Step 2: Train ANFIS
anfis_opts = anfisOptions('InitialFIS',2,'EpochNumber',20,'DisplayANFISInformation',0,...
    'DisplayErrorValues',0,'DisplayStepSize',0,'DisplayFinalResults',0);
fis_Fz  = anfis([train_input_norm train_output(:,1)], anfis_opts);
fis_Mth = anfis([train_input_norm train_output(:,2)], anfis_opts);

% -----------------------------
% Step 3: Simulation using trained ANFIS
x = zeros(4,length(t)); u = zeros(2,length(t)); x(:,1) = x0;

F_max = 200; M_max = 50;

for k=1:length(t)-1
    e_z  = z_ref(k) - x(1,k);
    e_th = theta_ref(k) - x(3,k);
    dz   = x(2,k);
    dth  = x(4,k);
    
    % Normalize input vector same as training
    input_vec = [e_z e_th dz dth];
    for i = 1:4
        min_val = min(train_input(:,i));
        max_val = max(train_input(:,i));
        input_vec(i) = 2*(input_vec(i)-min_val)/(max_val - min_val) - 1;
    end
    
    % Clip to [-1,1] to avoid evalfis warnings
    input_vec = max(min(input_vec,1),-1);
    
    % Evaluate FIS (new syntax)
    F_z     = evalfis(fis_Fz, input_vec);
    M_theta = evalfis(fis_Mth, input_vec);
    
    % Saturation
    F_z     = max(min(F_z,F_max),-F_max);
    M_theta = max(min(M_theta,M_max),-M_max);
    
    u(:,k) = [F_z; M_theta];
    
    x_dot = A*x(:,k) + B*u(:,k);
    x(:,k+1) = x(:,k) + x_dot*dt;
end

% Last step
e_z  = z_ref(end) - x(1,end);
e_th = theta_ref(end) - x(3,end);
input_vec = [e_z e_th x(2,end) x(4,end)];
for i = 1:4
    min_val = min(train_input(:,i));
    max_val = max(train_input(:,i));
    input_vec(i) = 2*(input_vec(i)-min_val)/(max_val - min_val) - 1;
end
input_vec = max(min(input_vec,1),-1);
F_z     = max(min(evalfis(fis_Fz,input_vec),F_max),-F_max);
M_theta = max(min(evalfis(fis_Mth,input_vec),M_max),-M_max);
u(:,end) = [F_z; M_theta];

% -----------------------------
% Step 4: Extract states and error norm
z_actual = x(1,:);
theta    = x(3,:);
err_norm = sqrt((z_ref - z_actual).^2 + (theta_ref - theta).^2);

% -----------------------------
% Step 5: Create results folder
resultsDir = fullfile(pwd,'Results','ANFIS_4state');
if ~exist(resultsDir,'dir')
    mkdir(resultsDir);
end

% -----------------------------
% Step 6: Plots and save automatically

% 1) Depth Tracking
fig1 = figure;
plot(t, z_ref,'r--','LineWidth',2); hold on;
plot(t, z_actual,'b','LineWidth',2);
xlabel('Time (s)'); ylabel('Depth (m)');
title('ANFIS: Depth Tracking'); legend('Desired','Actual'); grid on;
saveas(fig1, fullfile(resultsDir,'ANFIS_Depth.png'));

% 2) Pitch Tracking
fig2 = figure;
plot(t, theta_ref,'r--','LineWidth',2); hold on;
plot(t, theta,'b','LineWidth',2);
xlabel('Time (s)'); ylabel('Pitch (rad)');
title('ANFIS: Pitch Tracking'); legend('Desired','Actual'); grid on;
saveas(fig2, fullfile(resultsDir,'ANFIS_Pitch.png'));

% 3) Control Inputs
fig3 = figure;
subplot(2,1,1);
plot(t, u(1,:),'LineWidth',2); xlabel('Time (s)'); ylabel('F_z (N)');
title('ANFIS: Vertical Force'); grid on;
subplot(2,1,2);
plot(t, u(2,:),'LineWidth',2); xlabel('Time (s)'); ylabel('M_theta (N.m)');
title('ANFIS: Pitch Moment'); grid on;
saveas(fig3, fullfile(resultsDir,'ANFIS_ControlInputs.png'));

% 4) Tracking Error Norm
fig4 = figure;
plot(t, err_norm,'k','LineWidth',2);
xlabel('Time (s)'); ylabel('Error norm');
title('ANFIS Tracking Error'); grid on;
saveas(fig4, fullfile(resultsDir,'ANFIS_ErrorNorm.png'));

% -----------------------------
% Step 7: Save all data
save(fullfile(resultsDir,'ANFIS_results.mat'),'t','x','u','z_ref','theta_ref','err_norm','fis_Fz','fis_Mth');
