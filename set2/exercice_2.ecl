%%%power/3
power(_,0,1).

power(N,P,X):-
	P > 0,
	PP is P - 1,
	power(N,PP,XX),
	X is N * XX.
	
power(N,P,X):-
	P < 0,
	PP is P + 1,
	power(N,PP,XX),
	X is 1 / N * XX.