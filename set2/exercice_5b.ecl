%%%divides/3
divides(X,X,1):-
	X > 0.

divides(X,Y,D):-
	Y > 0,
	YY is Y - X,
	divides(X,YY,DD),
	D is DD + 1.