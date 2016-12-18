inn = '.^..^....^....^^.^^.^.^^.^.....^.^..^...^^^^^^.^^^^.^.^^^^^^^.^^^^^..^.^^^.^^..^.^^.^....^.^...^^.^.'

L = 40
# L = 400000; # second round

rule = ['..^','.^^','^^.','^..']
s = inn.count('.')

for k in range(L-1):
	inn = '.' + inn + '.'
	inn = ''.join(['^' if inn[i:i+3] in rule else '.' for i in range(len(inn)-2)])
	s += inn.count('.')

print('n. of safe tiles = ' + str(s))

