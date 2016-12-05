clc; close all; clear all;

in = load('y2016_lev3.txt');
in = reshape(in,3,size(in,1)).';
in_sort = sort(in,2);

length(find(in_sort(:,1) + in_sort(:,2) > in_sort(:,3)))