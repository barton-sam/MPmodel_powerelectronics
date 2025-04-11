%% installLib.m
% Runs workspace-clearing commands, and adjusts file path to include all
% necessary functions and models
s = pathsep;
source_path = fullfile(pwd,'source');
addpath(genpath(source_path));

clear s source_path