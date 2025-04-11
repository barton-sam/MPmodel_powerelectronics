%% Initialization for the basic back-to-back sim
conv = peConvClass("2LVSC_SPWM_IGBT"); % Assuming same converter on gen-/grid-side
conv.v_dc = 800;

%% Energy Storage Initialization
es.r_0 = 0.05;
es.c_0 = 232.5;
es.k_v = 89.9;
es.r_2 = 5.55;
es.c_2 = 43.19;
es.n_p = 1;
es.n_s = 400;
es.theta = 1;
es.v_0 = 2;

%% Grid-side initialization
grid.omega = 2*pi*60; % Grid frequency [rad/s]
grid.S = 1e3; % Target apparent power drawn from grid [VA]
grid.phi = 0; % Grid phase lag
grid.P = grid.S * cos(grid.phi); % Grid active power [W] 
grid.Q = grid.S * sin(grid.phi); % Grid reactive power [VAr]

grid.v = 480; % Grid voltage (L-L rms)
grid.v_pk = grid.v * sqrt(2/3); % peak grid voltage
grid.i = grid.P / (sqrt(3)*grid.v*cos(grid.phi)); % rms grid current
grid.i_pk = grid.i * sqrt(2); % peak grid current

%% Gen-side initialization
gen.omega = 2*pi*0.1; % Generator frequency [rad/s]
gen.S = 1e3; % Target apparent power generated at gen-side [VA]
gen.phi = pi; % Gen-side phase lag
gen.P = gen.S * cos(gen.phi); % Gen active power [W]

gen.v = 480; % Generator voltage (L-L rms)
gen.v_pk = gen.v * sqrt(2/3); % Peak generator voltage
gen.i = gen.P / (sqrt(3)*gen.v*cos(gen.phi)); % RMS generator stator current
gen.i_pk = gen.i * sqrt(2); 

%% Other initialization
T_amb = 25; 
simu.endTime = 10; 
simu.dt = 1;



