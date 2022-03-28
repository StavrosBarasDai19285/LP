%%%mcd/3
mcd(0,N,N).

mcd(M,N,X):-
	M > N,
	mcd(N,M,XX),
	X is XX.
	
mcd(M,N,X):-
	N >= M,
	NN is N mod M,
	mcd(M,NN,XX),
	X is XX.