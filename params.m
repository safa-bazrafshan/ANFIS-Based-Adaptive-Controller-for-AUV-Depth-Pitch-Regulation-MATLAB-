%% params.m
% AUV 4-state simplified parameters and simulation settings
% States: x = [z; zdot; theta; thetadot]
% Inputs: u = [F_z; M_theta]

% Physical parameters
m  = 50;      % mass (kg)
b1 = 20;      % vertical damping coefficient (N s/m)

I  = 10;      % pitch moment of inertia (kg m^2)
b2 = 5;       % pitch damping coefficient (N m s/rad)

% State-space matrices (simple decoupled linear model)
A = [0    1     0    0;
     0  -b1/m   0    0;
     0    0     0    1;
     0    0     0 -b2/I];

B = [0     0;
     1/m   0;
     0     0;
     0   1/I];

% Simulation parameters
dt = 0.01;    % time step (s)
T  = 30;      % total sim time (s)
t  = 0:dt:T;  % time vector

% Reference trajectory for depth (z) and pitch (theta)
% Here: depth steps at t = 2s to 5 m, then at 12s to 2 m (example)
z_ref = zeros(size(t));
z_ref(t >= 2)  = 5;
z_ref(t >= 12) = 2;

theta_ref = zeros(size(t)); % keep desired pitch zero (level)

% LQR weighting matrices (tuneable)
Q = diag([100, 1, 50, 1]);   % state weighting
R = diag([0.1, 0.1]);        % input weighting

% Initial condition
x0 = [0; 0; 0; 0];  % start at surface, zero velocities and angle
