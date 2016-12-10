function bot = y2016_level10()

% read the input file
S = textread('y2016_level10.txt','%s','delimiter','\n','whitespace','');

% there are 209 bots
% table: col1 = val1, col2 = val2, col3 = bot1, col4 = tbot2, 
% col5 = out1, col6 = out2, col7 = done
bot = NaN(210,7); bot(:,7) = 0;

% prepare sorting table for each bot
for k=1:length(S)
    A = strread(S{k},'%s','delimiter',' ');
    switch A{1}
        case 'bot'
            switch A{6}
                case 'bot'
                    bot(str2num(A{2})+1,3) = str2num(A{7});
                case 'output'
                    bot(str2num(A{2})+1,5) = str2num(A{7});
            end
            switch A{11}
                case 'bot'
                    bot(str2num(A{2})+1,4) = str2num(A{12});
                case 'output'
                    bot(str2num(A{2})+1,6) = str2num(A{12});
            end
                    
        case 'value'
            if isnan(bot(str2num(A{6})+1))
                bot(str2num(A{6})+1,1) = str2num(A{2});
            else
                bot(str2num(A{6})+1,2) = str2num(A{2});
            end
    end
end
% bot
% find the num.. of bot with known values
act_pos = find(~isnan(bot(:,2)));
bot = assign(act_pos,bot);
answer = find((bot(:,1)==17).*(bot(:,2)==61));
disp(['answer 1: ' num2str(answer(1)-1)]);
disp(['answer 2: ' num2str(bot(find(bot(:,5)==0),1).*bot(find(bot(:,5)==1),1).*bot(find(bot(:,5)==2),1))]);


% recursive function to assign chip numbers to bots
function bot = assign(act_pos,bot)
chip_nums_sort = sort(bot(act_pos,1:2));
% sort chips in act bot
bot(act_pos,1) = chip_nums_sort(1);
bot(act_pos,2) = chip_nums_sort(2);
bot(act_pos,7) = 1;
% assign chips to next bots
new_pos1 = bot(act_pos,3)+1;
if ~isnan(new_pos1)
    pos1 = ~isnan(bot(new_pos1,1))+1;
    bot(new_pos1,pos1) = chip_nums_sort(1);
    if and(pos1 == 2,bot(new_pos1,7)==0)
        bot = assign(new_pos1,bot);
    end
end

new_pos2 = bot(act_pos,4)+1;
if ~isnan(new_pos2)
    pos2 = ~isnan(bot(new_pos2,1))+1;
    bot(new_pos2,pos2) = chip_nums_sort(2);
    if and(pos2 == 2,bot(new_pos2,7)==0)
        bot = assign(new_pos2,bot);
    end
end


