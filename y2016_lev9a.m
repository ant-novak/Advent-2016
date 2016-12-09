clc; clear all; close all;

% read the input file
fid = fopen('y2016_lev9.txt'); S = fscanf(fid,'%s'); fclose(fid);

tot = 0;
k = 1;
while k <= length(S)
    if S(k) == '('
        pos_end = findstr(S(k:end),')');
        % separate (AxB)
        AB = strread(S(k+1:k+pos_end(1)-2),'%s','delimiter','x');
        % total number of charcters inreases by AxB
        tot = tot + str2num(AB{1})*str2num(AB{2});
        % skip the new number of characters
        k = k + pos_end(1) + str2num(AB{1});
    else
        tot = tot + 1;
        k = k + 1;
    end
end
disp(['Total number of characters: ' num2str(tot)]);