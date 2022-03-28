%%%divides/2
divides(X,X):-
	X > 0.

divides(X,Y):-
	Y > 0,
	YY is Y - X,
	divides(X,YY).