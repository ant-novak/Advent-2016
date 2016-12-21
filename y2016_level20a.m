clc; close all; clear all;

x = dlmread('y2016_level20.txt','-');

y = sort(x);

lowIP = 0;
for k=1:size(y,1)
    if and(lowIP>=y(k,1),lowIP<=y(k,2))
        lowIP = y(k,2) + 1;
    end
end

display(['the lowest-valued IP that is not blocked = ' num2str(lowIP)]);