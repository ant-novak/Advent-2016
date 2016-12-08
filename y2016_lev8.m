function answer = y2016_lev8()
global DISPLAY
DISPLAY = zeros(6,50);

fid = fopen('y2016_lev8.txt');
C = fread(fid,'*char')';
fclose(fid);

% change commands into Matlab functions calls using regular expressions
expression = {'rect (\w*)x(\w*)','rotate column x=(\w*) by (\w*)','rotate row y=(\w*) by (\w*)'};
replace = {'fnc_rect($1,$2);','fnc_rotate_col($1,$2);','fnc_rotate_row($1,$2);'};
C2 = regexprep(C,expression,replace);

% evaluate all Matlab commands
eval(C2);
% sum of all pixels (1 = lit)
answer = ['number of pixels = ' num2str(sum(DISPLAY(:)))];
imagesc(~DISPLAY); colormap('bone'); axis off; set(gcf,'Position',[680 558 560 100]);
title(answer)

function fnc_rect(x,y)
global DISPLAY
DISPLAY(1:y,1:x)=1;

function fnc_rotate_col(x,by)
global DISPLAY
DISPLAY(:,x+1) = [DISPLAY(end-by+1:end,x+1); DISPLAY(1:end-by,x+1)];

function fnc_rotate_row(y,by)
global DISPLAY
DISPLAY(y+1,:) = [DISPLAY(y+1,end-by+1:end) DISPLAY(y+1,1:end-by)];
