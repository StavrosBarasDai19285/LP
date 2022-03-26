%% int_in_range/3
int_in_range(X,X,X).

int_in_range(Min,Max,Min):-
	Min > 0,
	Max > Min.
	
int_in_range(Min,Max,X):-
	Min > 0,
	Max > Min,
	Min1 is Min + 1,
	int_in_range(Min1,Max,X).
