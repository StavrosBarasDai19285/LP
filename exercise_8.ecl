%% int_in_range/3
int_in_range(1,1,1).

int_in_range(Min,Max,X):-
	Min > 0,
	Max > Min,
	Maxx is Max - 1,
	int_in_range(Min,Maxx,XX),
	X is XX.