%exercice2
%%%set_diff/3
set_diff([],_,[]).
set_diff(List,[X|Rest],DiffList):-
	member(X,List),
	set_diff(Rest,List,DiffList).
set_diff(List,[X|Rest],[X|DiffList]):-
	!,
	set_diff(Rest,List,DiffList).
	
%exercice3
%%%lunion/3
lunion([],L,L).
lunion([X|Rest],L,[X|Sol]):-
	not(member(X,L)),
	!,
	lunion(Rest,L,Sol).
lunion([_|Rest],L,Sol):-
	lunion(Rest,L,Sol).
	
%exercice4
%%%max_list/2
max_list(X,L):-
	member(X,L),
	not((member(Y,L),Y>X)).
	
%exercice5
%%%unique_element/2
unique_element(X,L):-
	delete(X,L,Rest),
	not(member(X,Rest)).
	
%exercice6
%%%proper_set/1
proper_set(L):-
	not((member(X,L),not(unique_element(X,L)))).
	
%exercice7
%%%double/2
double(X,Y):-
	Y is X * 2.

%%%square/2
square(X,Y):-
	Y is X * X.

%%%map/3
map(_,[],[]).
map(Op,[X|T],[Y|R]):-
	Mycall =..[Op,X,Y],
	call(Mycall),
	map(Op,T,R).
	
%exercice8
%%%reduce/3
reduce(_,[X],X).
reduce(Op,[X,Y|Rest],Sol):-
	Mycall =..[Op,X,Y,Z],
	call(Mycall),
	reduce(Op,[Z|Rest],Sol).
	
%exercice9
%%%valid_queries/1
valid_queries(P):-
	P,
	write(P),nl.

	
	
	