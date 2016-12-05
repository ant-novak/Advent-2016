clc; close all; clear all;

% read the input file
fid = fopen('y2016_lev4.txt');
C = textscan(fid, '%s');
C = C{1}; 


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

    % make the Caesar shift by room ID
    res = char(mod(double(string_without_dashes)-97+room_ID,26)+97);

    % if there is 'north', print out the result
    if res(1:5) == 'north'
        res
        room_ID
    end
        
end
