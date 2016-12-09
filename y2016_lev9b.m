function y2016_lev9b()
global tot
% read the input file
fid = fopen('y2016_lev9.txt'); S = fscanf(fid,'%s'); fclose(fid);

tot = 0;
calculate_inside(S,1)
disp(['Total number of characters: ' num2str(tot)]);

% function to be called recursively
function calculate_inside(str,n)
global tot
tot_ins = 0;
k = 1;
while k <= length(str)    
    if str(k) == '('
        pos_end = findstr(str(k:end),')');
        % separate (AxB)
        AB = strread(str(k+1:k+pos_end(1)-2),'%s','delimiter','x');
        
        % new string to be evaluated !!! n times
        new_str = str(k+pos_end(1):k+pos_end(1)+str2num(AB{1})-1);
        calculate_inside(new_str,n*str2num(AB{2}));
        
        % skip the new number of characters
        k = k + pos_end(1) + str2num(AB{1});
    else
        tot_ins = tot_ins + 1;
        k = k + 1;
    end
end
tot = tot + n*tot_ins;

