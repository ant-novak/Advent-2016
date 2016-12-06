clc; close all; clear all

% read the input file
fid = fopen('y2016_lev6.txt');
C = textscan(fid, '%s'); C = C{1}; 

% part I
char(mode(double(char(C))))
% part II
char(mode_min(double(char(C))))





