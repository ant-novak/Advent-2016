import hashlib




def test(x,y,strX,leng):
	if (x == 3) and (y==3):
		print('path = ' + str(leng) + ': ' + strX[8:])
		return

	my_str = hashlib.md5(strX.encode()).hexdigest()[0:4]
	# UP
	if (my_str[0] >= 'b') and (y-1 >=0) and (leng + 1 < max_leng):
		test(x+0,y-1,strX+'U',leng+1)
	# DOWN
	if (my_str[1] >= 'b') and (y+1 <=3) and (leng + 1 < max_leng):
		test(x+0,y+1,strX+'D',leng+1)
	# LEFT
	if (my_str[2] >= 'b') and (x-1 >=0) and (leng + 1 < max_leng):
		test(x-1,y+0,strX+'L',leng+1)
	# RIGHT
	if (my_str[3] >= 'b') and (x+1 <=3) and (leng + 1 < max_leng):
		test(x+1,y+0,strX+'R',leng+1)


max_leng = 11

test(0,0,'qljzarfv',0)
