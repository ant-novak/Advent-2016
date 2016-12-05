clc; close all; clear all;

% read the input file
fid = fopen('y2016_lev4.txt');
C = textscan(fid, '%s');
C = C{1}; 

kod_sum = 0;
l = 0;

for k=1:length(C)
    % separate the string and the code_hash
    A = strread(C{k},'%s','delimiter','[');
    
    % code_hash
    kod = A{2}(1:end-1);
    
    % separate the ID from the rest
    b = findstr(A{1}, '-'); 
    x = A{1}(1:b(end)-1);
    string_without_dashes = strrep(x,'-','');
    
    room_ID = str2num(A{1}(b(end)+1:end));
    	
    ascii_of_string = double(x);
    
    % calculate the histogram of the ascii_of_string
    % (add 0.5 and 123.5 to have incude 1 to 122 (ascii of 'z'))
    [hist_values,hist_axis] = hist([0.5 ascii_of_string 123.5],123);
    hist_values = hist_values(2:end-1);
    hist_axis = hist_axis(2:end-1);
    
    % sort results in descendent order (to tie-break alphapetically)
    [e1,b1] = sort(hist_values,'descend');
    
    % get top 5
    top_5 = char(hist_axis(b1(1:5)));
    
    % if code matches, add room ID
    if strcmp(top_5,kod)
        l = l+1;
        kod_sum = kod_sum + room_ID;
    end
    
    
end

kod_sum