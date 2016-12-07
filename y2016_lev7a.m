clc; close all; clear all;

% read the input file
fid = fopen('y2016_lev7.txt');
C = textscan(fid, '%s'); C = double(char(C{1})).';

% find all square bracket regions (1) inside (0) outside
square_bracket_interval = cumsum((C==double('[')) - (C==double(']')));

% find all valid ABBA (1st derivative must be zero, 2nd derivative must not be
% zero, 3rd derivative must be zero, and square_bracket_interval must be zero)
diff1 = [diff(C); NaN(1,size(C,2))];
diff2 = [NaN(1,size(C,2)); diff(diff1)];
diff3 = [diff(diff2); NaN(1,size(C,2))];
all_ABBA = sum((diff1==0).*(diff2~=0).*(diff3==0),1);

all_ABBA_inside_brackets = sum((diff1==0).*(diff2~=0).*(diff3==0).*(square_bracket_interval==1),1);


num_of_all_valid_ABBA = sum(((all_ABBA>0).*(all_ABBA_inside_brackets==0))>0)
