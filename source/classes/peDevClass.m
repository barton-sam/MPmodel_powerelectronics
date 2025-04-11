classdef peDevClass
    % PEDEVCLASS Characterization of power electronic devices (MOSFET,
    % IGBT, diode) in the WEC drivetrain. 
    %
    % 
    
    properties
        % Default initialization if no parameters are defined
        type    {mustBeText}        = "none";
        r_on    {mustBeNumeric}     = 0; % On resistance [Ohm]
        alpha   {mustBeNumeric}     = 0; % On-resistance sensitivity to junction temperature [1/K]
        T_Rref  {mustBeNumeric}     = 0; % Reference temperature for resistance modeling [K]
        v_th    {mustBeNumeric}     = 0; % Threshold voltage [V]
        beta    {mustBeNumeric}     = 0; % Threshold voltage sensitivity to junction temperature [1/K]
        T_Vref  {mustBeNumeric}     = 0; % Reference temperature for threshold voltage modeling [K]
        E_on    {mustBeNumeric}     = 0; % Turn-on energy [J]
        gamma   {mustBeNumeric}     = 0; % Turn-on energy sensitivity to junction temperature [1/K]
        E_off   {mustBeNumeric}     = 0; % Turn-off energy [J]
        zeta    {mustBeNumeric}     = 0; % Turn-off energy sensitivity to junction temperature [1/K]
        T_Eref  {mustBeNumeric}     = 0; % Reference temperature for energy loss measurement [K]
        k_v     {mustBeNumeric}     = 0; % Voltage dependence of switching losses [-]
        k_i     {mustBeNumeric}     = 0; % Current dependence of switching losses [-]
        Q_rr    {mustBeNumeric}     = 0; % Diode reverse recovery charge (if applicable) [C]
        I_ref   {mustBeNumeric}     = 0; % Reference current for energy loss measurements [A]
        V_ref   {mustBeNumeric}     = 0; % Reference voltage for energy loss measurements [V]
        theta(1,:) {mustBeNumeric}  = [0 0 0]; % Thermal resistance (internal device) [K/W]
        c(1,:)  {mustBeNumeric}     = [999 999 999]; % Thermal capacitance [J/K]
    end
    
    methods
        function obj = peDevClass(type)
            obj.type = type;
            switch type 
                case "mosfet"
                    % Derived from Wolfspeed C3M0060065K 650V, 37A SiC
                    % MOSFET
                    % Datasheet: https://assets.wolfspeed.com/uploads/2024/01/Wolfspeed_C3M0060065K_data_sheet.pdf
                    obj.r_on    = 50e-3;
                    obj.alpha   = 0.0025; 
                    obj.T_Rref  = 25+273.15;
                    obj.E_on    = 70e-6;
                    obj.gamma   = 0.0015;
                    obj.E_off   = 5e-6;
                    obj.T_Eref  = 75+273.15; 
                    obj.k_v     = 1.5;
                    obj.I_ref   = 13.2;
                    obj.V_ref   = 400;
                    % NOTE: Thermal resistance and capacitance value same
                    % for MOSFET and diode when MOSFET w/ internal diode
                    % model is used
                    obj.theta   = [0.1 0.5 0.25 0.2];
                    obj.c       = [0.0005 0.0025 0.01 0.1];

                case "body_diode"
                    % Derived from Wolfspeed C3M0060065K 650V, 37A SiC
                    % MOSFET, looking at the reverse diode characteristics: https://assets.wolfspeed.com/uploads/2024/01/Wolfspeed_C3M0060065K_data_sheet.pdf
                    % Got the following values from the PLECS description
                    % of the C3M0060065K body diode. 
                    obj.r_on    = 75e-3;
                    obj.alpha   = 1.5e-4;
                    obj.T_Rref  = 25+273.15;
                    obj.v_th    = 3.25; 
                    obj.beta    = -7.5e-4;
                    obj.T_Vref  = 25+273.15;
                    obj.Q_rr    = 150e-9; 
                    obj.k_i     = 0.5;
                    obj.I_ref   = 15;
                    obj.V_ref   = 400;

                case "sic_schottky_diode"
                    % NEED TO UPDATE THESE WITH APPROXIMATE DATASHEET PARAMETERS 
                    obj.r_on    = 50e-3;
                    obj.alpha   = 1.5e-4;
                    obj.T_Rref  = 25+273.15;
                    obj.v_th    = 0.7; 
                    obj.beta    = -7.5e-4;
                    obj.T_Vref  = 25+273.15;
                    obj.Q_rr    = 150e-9; 
                    obj.k_i     = 0.5;
                    obj.I_ref   = 15;
                    obj.V_ref   = 400;
                    % NOTE: Thermal resistance and capacitance value same
                    % for MOSFET and diode when MOSFET w/ internal diode
                    % model is used
                    obj.theta   = [0.1 0.5 0.25 0.2];
                    obj.c       = [0.0005 0.0025 0.01 0.1];

                case "igbt"
                    % NEED TO UPDATE THESE WITH APPROXIMATE DATASHEET PARAMETERS 
                    obj.r_on    = 80e-3;
                    obj.alpha   = 1.5e-4;
                    obj.T_Rref  = 25+273.15;
                    obj.E_on    = 3e-3;
                    obj.gamma   = 0.0015;
                    obj.E_off   = 1.25e-3;
                    obj.T_Eref  = 75+273.15; 
                    obj.v_th    = 1.25; 
                    obj.beta    = 7.5e-4;
                    obj.T_Vref  = 25+273.15;
                    obj.Q_rr    = 150e-9; 
                    obj.k_i     = 0.5;
                    obj.I_ref   = 15;
                    obj.V_ref   = 400;
                    % NOTE: Thermal resistance and capacitance value same
                    % for MOSFET and diode when MOSFET w/ internal diode
                    % model is used
                    obj.theta   = [0.1 0.5 0.25 0.2];
                    obj.c       = [0.0005 0.0025 0.01 0.1];
            end

        end
    end
end

