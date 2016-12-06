import hashlib

inn = 'cxdnnyjw'
k = 0; 
l = 0;

code = "";
while (k<8):
	my_str = inn + str(l)
	dh = hashlib.md5(my_str.encode()).hexdigest()
	if (dh[0:5] == '00000'):
		print(dh)
		code += dh[5]
		k += 1
	l += 1
	
print(' final code: ' + code)