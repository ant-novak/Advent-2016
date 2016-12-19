
def distance(state):
	suma = 0
	for kd in range(10):
		suma = suma + (4-state[kd])**2
	return suma

	
def check(state):
	global all_tested_states
	all_tested_states.append(state)
	result = True
	if (state[0]!=state[1]):
		if ((state[2]==state[1]) or (state[4]==state[1]) or (state[6]==state[1]) or (state[8]==state[1])):
			result = False
	if (state[2]!=state[3]):
		if ((state[0]==state[3]) or (state[4]==state[3]) or (state[6]==state[3]) or (state[8]==state[3])):
			result = False
	if (state[4]!=state[5]):
		if ((state[0]==state[5]) or (state[2]==state[5]) or (state[6]==state[5]) or (state[8]==state[5])):
			result = False
	if (state[6]!=state[7]):
		if ((state[0]==state[7]) or (state[2]==state[7]) or (state[4]==state[7]) or (state[8]==state[7])):
			result = False
	if (state[8]!=state[9]):
		if ((state[0]==state[9]) or (state[2]==state[9]) or (state[4]==state[9]) or (state[6]==state[9])):
			result = False
	return result;



def move_elevator(par, avec, state):
	ok = False
	state2 = state
	if check([x + par*y for x, y in zip(state[0:10], avec)]):
		ok = True
		state2 = [x + par*y for x, y in zip(state[0:10], avec)]
		# sort the list
		q = sorted([[state2[2*i],state2[2*i+1]] for i,s in enumerate(state2[::2])])
		state2 = [item for sublist in q for item in sublist] + [state[10]+par]
	return [state2,ok];
	
	
def all_possible_movements(state):
	indices = [i for i, x in enumerate(state[0:10]) if x == state[10]]
	all = []
	for ka in indices:
		vec = [0,0,0,0,0,0,0,0,0,0]
		vec[ka] = 1
		all.append(vec)
		for l in indices:
			if (ka>l):
				vec = [0,0,0,0,0,0,0,0,0,0]
				vec[ka] = 1
				vec[l] = 1
				all.append(vec)	
	return all;

	
start_state = [1,1,2,3,2,3,2,3,2,3,1]

prev_states = []
new_states = []
keep_states = []
all_tested_states = []	

all_tested_states.append(start_state)
new_states.append(start_state)
keep_states.append(start_state)
	
k = 0
GO = True
while GO:
	k = k + 1
	print(k)
	prev_states = keep_states
	new_states = []
	for state_k in prev_states:
		all = all_possible_movements(state_k)
		for move in all:
			if ((state_k[10] + 1 >= 1) and (state_k[10] + 1) <=4):
				[new_state,ok] = move_elevator(+1, move, state_k)
				if ok:
					if not new_state in all_tested_states:
						new_states.append(new_state)
						all_tested_states.append(new_state)
			if ((state_k[10] -1 >= 1) and (state_k[10] - 1) <=4):
				[new_state,ok] = move_elevator(-1, move, state_k)
				if ok:
					if not new_state in all_tested_states:
						new_states.append(new_state)
						all_tested_states.append(new_state)

			
	
	dists = []
	for state_k in new_states:
		dists.append(distance(state_k))
		
	
	keep_states = [s for (p,s) in sorted(zip(dists,new_states))][0:70]


	
	if [4,4,4,4,4,4,4,4,4,4,4] in new_states:
		print(str(k) + ' steps is OK')
		GO = False














