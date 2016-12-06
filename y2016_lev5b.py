import hashlib

inn = 'cxdnnyjw'
k = 0; 
l = 0;

code = list("xxxxxxxx")
while ('x' in code):
	my_str = inn + str(l)
	dh = hashlib.md5(my_str.encode()).hexdigest()
	if (dh[0:5] == '00000'):
		print(dh)
		k += 1
		pos = int(dh[5],16)
		if (pos < 8):
			if (code[pos] == 'x'):
				code[pos] = dh[6]
				print(code)
            
	l += 1
	
print('--------------------')
print(' final code: ' + ''.join(code))


        
