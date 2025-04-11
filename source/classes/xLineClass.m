% Class Definition: xLineClass
% xLineClass creates a 'xLine' object that holds electrical 
% parameters relating to the impedance of the line, and the
% physical line length. 
%
% As of now, not really sure what the best way to model this is.
classdef xLineClass<handle
    properties
        length {mustBeNumeric} = 999; 
        L   {mustBeNumeric} = 999; 
        C   {mustBeNumeric} = 999; 
        R   {mustBeNumeric} = 999;
    end

    methods
        function obj = xLineClass(length, L, C, R)
            % Initial attempt at a constructor
            obj.length = length; 
            obj.L = L; 
            obj.C = C; 
            obj.R = R;
        end
    end

end