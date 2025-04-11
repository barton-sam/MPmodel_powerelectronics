function clrsdi(~)
%CLRSDI Clears Simulink Data Inspector
%   Clears all data in the data inspector as well as all .dmr files that
%   are stored.
Simulink.sdi.clear; % Clears simulink data inspector
sdi.Repository.clearRepositoryFile; % Removes .dmr files ;
end

