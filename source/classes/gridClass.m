classdef gridClass<handle
    properties
        v   {mustBeNumeric} = 999; 
        omega {mustBeNumeric} = 999;
        filter_type {mustBeText}    = "none";
        filter (1,1) struct = struct(...    % Defines the filter parameters
            'L_c',  0,...   % (FLOAT) Converter-side filter inductor value
            'R_c',  0,...   % (FLOAT) Converter-side filter resistor value
            'C_f',  inf,...   % (FLOAT) Capacitor branch capacitor value
            'R_f',  inf,...   % (FLOAT) Capacitor branch resistor value
            'L_g',  0,...   % (FLOAT) Grid-side filter inductor value
            'R_g',  0);     % (FLOAT) Grid-side filter resistor value
    end

    methods 
        function [obj] = gridClass(voltage, frequency, filter_type, R_c, L_c, C_f, R_f, L_g, R_g)
            obj.v = voltage; 
            obj.omega = 2*pi*frequency; 
            obj.filter_type = filter_type; 
            if(strcmp("RL", filter_type))
                obj.filter.L_c = L_c; 
                obj.filter.R_c = R_c; 
            elseif(strcmp("LCL", filter_type))
                obj.filter.L_c = L_c; 
                obj.filter.R_c = R_c; 
                obj.filter.C_f = C_f; 
                obj.filter.R_f = R_f; 
                obj.filter.L_g = L_g; 
                obj.filter.R_g = R_g; 
            end
        end
    end
end

