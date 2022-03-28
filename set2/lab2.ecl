%%%fn/2
fn(0,1).

fn(X,X):-
	X>0,
	X<5.
	
fn(X,F):-
	X >= 5,
	X =< 8,
	XX is X - 4,
	fn(XX,FF),
	F is 2 * FF.
	
fn(X,F):-
	X > 8,
	XX is X - 8,
	fn(XX,FF),
	XXX is FF,
	fn(XXX,FFF),
	F is FFF.