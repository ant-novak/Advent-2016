inn = '10011111011011001'

L = 272
# L = 35651584 #second round
while len(inn) < L :
	inn = inn + '0' + ''.join([str(1-int(i)) for i in inn[::-1]])

inn = inn[0:L]
	
while (len(inn) % 2) == 0:
	w = [inn[2*i]+inn[2*i+1] for i in range(int(len(inn)/2))]
	inn = ''.join(['1' if (ww=='00' or ww=='11') else '0' for ww in w])


print(['the correct checksum is: ' + inn])
