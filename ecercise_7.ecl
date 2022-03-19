%% sumn/2
sumn(0,0).

sumn(1,1).

sumn(N,X):-
	N > 1,
	NN is N - 1,
	sumn(NN,XX),
	X is XX + N.