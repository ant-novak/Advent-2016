

def jnz(x,y):
	global line
	if (x!=0):
		line = line + y - 1
	
a = 0
b = 0
#c = 0	# first part 
c = 1	# second part
d = 0


all = [
'a=1',
'b=1',
'd=26',
'jnz(c, 2)',
'jnz(1, 5)',
'c=7',
'd=d+1',
'c=c-1',
'jnz(c, -2)',
'c=a',
'a=a+1',
'b=b-1',
'jnz(b,-2)',
'b=c',
'd=d-1',
'jnz(d, -6)',
'c=13',
'd=14',
'a=a+1',
'd=d-1',
'jnz(d,-2)',
'c=c-1',
'jnz(c, -5)',
]

print(all)

line = 0
while True:
	exec(all[line])
	line = line + 1
	if line > 22:
		break
		
print(a)
	
