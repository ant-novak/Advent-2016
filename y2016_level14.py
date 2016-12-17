import hashlib
import re


def repetitions(s):
   r = re.compile(r"(.+?)\1+")
   for match in r.finditer(s):
       yield (match.group(1), len(match.group(0))/len(match.group(1)))



inn = 'ihaygndm'
#inn = 'abc'
k = 0; l = 0;
numb_search = []; pos_search = []; counted = [];

answ=[]
while k<68:
	my_str = inn + str(l)
	#for hash_k in range(2017): # for the second part
	my_str = hashlib.md5(my_str.encode()).hexdigest()
	
	n3 = []; n5 = [];
	q = list(repetitions(my_str))
	for qq in q:
		if (list(qq)[1] >= 3) and (n3==[]):
			n3 = list(qq)[0]
		if (list(qq)[1] >= 5):
			n5.append(list(qq)[0])
	
	
	for n5i in n5:
		indices = [i for i, x in enumerate(numb_search) if x == n5i]
		for ii in indices:
			if not(counted[ii]) and (pos_search[ii] > l-1000):
				counted[ii] = 1
				k += 1
				answ.append(pos_search[ii])
		
				print(k)


	if (n3!=[]):
		numb_search.append(n3)
		pos_search.append(l)
		counted.append(0)

				
	l += 1
	
res = sorted(answ)
print('index(64) = ' + str(res[63]))