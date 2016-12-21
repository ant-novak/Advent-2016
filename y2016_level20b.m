clc; close all; clear all;

x = dlmread('y2016_level20.txt','-');
y = sort(x);

maxIP = 0;
total_IP = 0;
for k=1:size(y,1)
    if y(k,1) > maxIP
        total_IP = total_IP + (y(k,1) - maxIP);
    end
    maxIP = y(k,2) + 1;
end

display(['IPs allowed by the blacklist = ' num2str(total_IP)]);