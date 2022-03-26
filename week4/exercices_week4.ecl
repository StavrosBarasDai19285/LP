%exercice 1
%%%sum_of_list/2
sum_of_list([],0).

sum_of_list([H|T],N):-
	sum_of_list(T,NN),
	N is NN + H.

%exercice 2
%%%before_last_element/2
before_last_element([X,_],X).

before_last_element([_|T],X):-
	before_last_element(T,X).

%exercice 3
%%%occurs/3
occurs(_,[],0).

occurs(N,[N|T],X):-
	occurs(N,T,XX),
	X is XX + 1.  

occurs(N,[H|T],X):-
	N \= H,
	occurs(N,T,X).

%exercice 4
%%%count_odd/2
count_odd([],0).

count_odd([H|T],X):-
	1 is H mod 2,
	count_odd(T,XX),
	X is XX + 1.

count_odd([H|T],X):-
	0 is H mod 2,
	count_odd(T,XX),
	X is XX.

%exercice 5
%%%count_vowels/2
count_vowels([],0).

count_vowels([o|T],X):-
	count_vowels(T,XX),
	X is XX + 1.
count_vowels([a|T],X):-
	count_vowels(T,XX),
	X is XX + 1.
count_vowels([e|T],X):-
	count_vowels(T,XX),
	X is XX + 1.
count_vowels([i|T],X):-
	count_vowels(T,XX),
	X is XX + 1.
count_vowels([u|T],X):-
	count_vowels(T,XX),
	X is XX + 1.
	
count_vowels([H|T],X):-
	a \= H,
	e \= H,
	o \= H,
	i \= H,
	u \= H,
	count_vowels(T,X).
	
%exercice 6
%%%sum_even/2
sum_even([],0).

sum_even([H|T],X):-
	0 is H mod 2,
	sum_even(T,XX),
	X is XX + H.
	
sum_even([H|T],X):-
	1 is H mod 2,
	sum_even(T,X).
	
%exercice 7
%%%replace/4
replace(X,Y,[X|T],[Y|T]).

replace(X,Y,[H|T],[H|TR]):-
	replace(X,Y,T,TR).
	

	

	
	
	
	
	








