inn = list('abcdefgh')



lines = [line.rstrip('\n') for line in open('y2016_level21.txt')]
	
for line in lines:
	l = line.split()
	x=0
	if l[0]=='swap' and l[1]=='position':
		let = inn[int(l[2])]
		inn[int(l[2])] = inn[int(l[5])]
		inn[int(l[5])] = let

		
	if l[0]=='swap' and l[1]=='letter':
		ind2 = inn.index(l[2])
		ind5 = inn.index(l[5])
		inn[ind2] = l[5]
		inn[ind5] = l[2]
		
	if l[0]=='rotate' and l[1]=='left':
		n = int(l[2])
		inn = inn[n:] + inn[:n]
		
		
	if l[0]=='rotate' and l[1]=='right':	
		n = int(l[2])
		inn = inn[-n:] + inn[:-n]
		
	if l[0]=='rotate' and l[1]=='based':
		ind = inn.index(l[6])
		n = (1 if ind>=4 else 0)
		inn = inn[-1:] + inn[:-1]
		inn = inn[-ind:] + inn[:-ind]
		inn = inn[-n:] + inn[:-n]

		
	if l[0]=='reverse':
		in1 = int(l[2])
		in2 = int(l[4])
		inn = inn[0:in1] + inn[in1:in2+1][::-1] + inn[in2+1:]
		
	if l[0]=='move':
		in1 = int(l[2])
		in2 = int(l[5])
		let = inn[in1]
		inn = inn[0:in1] + inn[in1+1:]
		inn = inn[0:in2] + list(let) + inn[in2:]
		
		
		
		
		
		
print(''.join(inn))
		
		
		

	
