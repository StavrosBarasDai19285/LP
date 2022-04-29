%exercice11
%%%max_min_eval/2
max_min_eval([R],R).

max_min_eval([N1,O,N2|T],R):-
	member(O,[max,min]),
	Mycall =..[O,N1,N2,RR],
	call(Mycall),
	max_min_eval([RR|T],R).
	
%exercice12
%%%less_ten/1
less_ten(X):-
	X<10.
	
%%%less_twenty/1
less_twenty(X):-
	X<20.
	
%%%filter/3
filter(_,[],[]).

filter(C,[H|T],[H|TT]):-
	Mycall =..[C,H],
	call(Mycall),
	!,
	filter(C,T,TT).
	
filter(C,[_|T],S):-
	!,
	filter(C,T,S).
