% Class - peConvClass
% peDevClass creates a 'conv' object that is used to set the parameters of
% the power electronic converter (number of devices, layout, etc.) and
% converter-level functions (estimating losses, junction temperature, etc.)
classdef peConvClass
    properties
        % Default initialization parameters for the pe converter
        % object.
        type    {mustBeText}    = "none";   % Converter type
        f_sw    {mustBeNumeric} = 0;        % Switching frequency [Hz]
        t_d     {mustBeNumeric} = 0;        % Deadtime [s]
        v_dc    {mustBeNumeric} = 0;        % DC bus voltage [V]
        T_init  {mustBeNumeric} = 0;        % Initial converter temperature [K]
        theta   {mustBeNumeric} = [0 0];    % Thermal resistance (TIM & Heat Sink) [K/W]
        c       {mustBeNumeric} = 999;      % Thermal capacitance (heat sink) [J/K]
        dev                     = peDevClass.empty(0,2);    % Power electronic devices
    end
    
    methods
        function [obj] = peConvClass(type)
            obj.type = type; 
            switch type
                case "2LVSC_SPWM_MOSFET_w_IntegratedDiode"
                    obj.f_sw    = 20e3; 
                    obj.t_d     = 1e-7; 
                    obj.v_dc    = 450; 
                    obj.T_init  = 25+273.15; 
                    obj.theta   = [1 1]; 
                    obj.c       = 5; 

                    % Initialize PE devices
                    obj.dev(1) = peDevClass("mosfet");
                    obj.dev(2) = peDevClass("body_diode");

                case "2LVSC_SPWM_MOSFET_w_ExternalDiode"
                    obj.f_sw    = 20e3; 
                    obj.t_d     = 1e-7; 
                    obj.v_dc    = 450; 
                    obj.T_init  = 25+273.15; 
                    obj.theta   = [1 1]; 
                    obj.c       = 5; 

                    % Initialize PE devices
                    obj.dev(1) = peDevClass("mosfet");
                    obj.dev(2) = peDevClass("sic_schottky_diode");

                case "2LVSC_SPWM_IGBT"
                    obj.f_sw    = 5e3; 
                    obj.t_d     = 1e-7; 
                    obj.v_dc    = 450; 
                    obj.T_init  = 25+273.15; 
                    obj.theta   = [1 1]; 
                    obj.c       = 5; 

                    % Initialize PE devices
                    obj.dev(1) = peDevClass("igbt");
                    obj.dev(2) = peDevClass("sic_schottky_diode");
            end
        end
    end
end

