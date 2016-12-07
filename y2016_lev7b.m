clc; close all; clear all;

% read the input file
fid = fopen('y2016_lev7.txt');
C = textscan(fid, '%s'); C = double(char(C{1})).';

% find all square bracket regions (1) inside (0) outside
square_bracket_interval = cumsum((C==double('[')) - (C==double(']')));

% -1 1 matrix
M = cos(pi*(1:size(C,1))).'*cos(pi*(1:size(C,2)));

% find all valid ABA inside and outside brackets
%   (1st derivative must not be zero, 2nd +- derivative must be zero)
diff1 = [diff(C); NaN(1,size(C,2))];
diff2_inv = [NaN(1,size(C,2)); diff(diff1.*M)];
ABBA_outside = (diff1~=0).*(diff2_inv==0).*(square_bracket_interval==0);
ABBA_inside = (diff1~=0).*(diff2_inv==0).*(square_bracket_interval==1);

ABBA_outside(ABBA_outside==0)=NaN;
ABBA_inside(ABBA_inside==0)=NaN;

% differences
D1 =  diff1.*ABBA_outside;
D2 = -diff1.*ABBA_inside;


tot = 0;
for k=1:size(C,2)
    % find where the 1st derivative of outside = - 1st derivative of inside
    pos_diff1 = find(ismember(D1(:,k),D2(:,k)));
    pos_diff2 = find(ismember(D2(:,k),D1(:,k)));
    if ~isempty(pos_diff1)
        % and where the value in is equal to value[n-1] out
        tot = tot + ~isempty(intersect(C(pos_diff1,k),C(pos_diff2-1,k)));
    end
end

tot







