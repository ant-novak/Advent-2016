clc; close all; clear all;

in = 'L3, R1, L4, L1, L2, R4, L3, L3, R2, R3, L5, R1, R3, L4, L1, L2, R2, R1, L4, L4, R2, L5, R3, R2, R1, L1, L2, R2, R2, L1, L1, R2, R1, L3, L5, R4, L3, R3, R3, L5, L190, L4, R4, R51, L4, R5, R5, R2, L1, L3, R1, R4, L3, R1, R3, L5, L4, R2, R5, R2, L1, L5, L1, L1, R78, L3, R2, L3, R5, L2, R2, R4, L1, L4, R1, R185, R3, L4, L1, L1, L3, R4, L4, L1, R5, L5, L1, R5, L1, R2, L5, L2, R4, R3, L2, R3, R1, L3, L5, L4, R3, L2, L4, L5, L4, R1, L1, R5, L2, R4, R2, R3, L1, L1, L4, L3, R4, L3, L5, R2, L5, L1, L1, R2, R3, L5, L3, L2, L1, L4, R4, R4, L2, R3, R1, L2, R1, L2, L2, R3, R3, L1, R4, L5, L3, R4, R4, R1, L2, L5, L3, R1, R4, L2, R5, R4, R2, L5, L3, R4, R1, L1, R5, L3, R1, R5, L2, R1, L5, L2, R2, L2, L3, R3, R3, R1';

%strsplit(in,', ')
A = strread(in,'%s','delimiter',', ');

tot = zeros(1,length(A)+1);
direction = exp(j*pi/2);
for k=1:length(A)
    c = A{k};
    
    % "phase" of the movement
    if c(1) == 'R' % turn right
        direction = direction.*exp(-j*pi/2);
    else % turn left
        direction = direction.*exp(j*pi/2);
    end
    
    % "amplitude" of movement
    number = str2num(c(2:end));
    
    % add the movement: tot = tot + amp*phase
    tot(k+1) = tot(k) + number.*direction;
    
end

% print how many blocks away is Easter Bunny
T = tot(end);
abs(real(T))+abs(imag(T))

% 2nd part of the riddle = first crossing from the graph  (121,-22)
plot(tot)

