% input
n = 3014387;

% part 1
elf_win1 = 2*(n-2^floor(log2(n)))+1;
display(['winning elf is n.' num2str( elf_win1  ) ]);

% part 2
elf_win2 = max(n - 3.^floor(log(n)/log(3)), 2*(n) - 3.^ceil(log(n)/log(3)));
display(['winning elf is n.' num2str( elf_win2  ) ]);
