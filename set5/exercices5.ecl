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
	
%exercice10
%%%seperate_lists/3
seperate_lists([],[],[]).

seperate_lists([H|T],Lets,[H|TT]):-
	number(H),
	!,
	seperate_lists(T,Lets,TT).
	
seperate_lists([H|T],[H|TT],Nums):-
	!,
	seperate_lists(T,TT,Nums).
	
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


	
