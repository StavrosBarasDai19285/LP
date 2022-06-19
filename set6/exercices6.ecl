%exercice1

sample(2).
sample(5).
sample(14).
sample(7).
sample(26).

%%%less_than_ten/1
less_than_ten(X):-
	findall(Y,(sample(Y),Y<10),L),
	length(L,X).
	
%exercice2
%%%set_diff_f/3
set_diff_f(L1,L2,L):-
	findall(X,(member(X,L1),not(member(X,L2))),L).
	
%exercice3
%%%minlist/2
minlist(Min,List):-
	setof(X,member(X,List),[Min|_]).
	
%exercice4
%%%proper_set_s/1
proper_set_s(List):-
	setof(X, member(X,List), Set),
	length(List,N),
	length(Set,N).
	
%exercice5
%%%map_f/3
double(X,Y):-
	Y is X * 2.

square(X,Y):-
	Y is X * X.

map_f(Op,List,Results):-
	findall(X, map_aux(Op,List,X), Results).

map_aux(Op,List,X):-
	member(Y,List),
	Myf =.. [Op, Y, X],
	call(Myf).

%exercice6
:-dynamic stack/1.
stack([]).
	
%%%push/1
push(X):-
	asserta(stack([X])).

%%%pop/1
pop(X):-
	retract(stack([X])).
	
	
%exercice7
:-op(450,yfx,and).
:-op(500,yfx,or).
:-op(550,fy, --).
:-op(400, xfx, ==>).
:-op(500, yfx, xor).
:-op(500, yfx, nor).
:-op(450, yfx, nand).

Arg1 and Arg2 :-
	Arg1,Arg2.

Arg1 or _Arg2 :-
	Arg1.

_Arg1 or Arg2 :-
	Arg2.

--Arg1 :- 
	not(Arg1).

Arg1 ==> Arg2 :-
	--Arg1 or Arg2.
	
Arg1 nand Arg2 :-
	--(Arg1 and Arg2).
	
Arg1 nor Arg2:-
	--(Arg1 or Arg2).
	
Arg1 xor Arg2:-
	(Arg1 and (--Arg2)) or (--Arg1 and Arg2).

t.
f:-!,fail.


%exercice8
%%%model/1
model(Term):-
	term_variables(Term,[]),
	Term.

model(Term):-
	term_variables(Term,[X]),
	member(X,[t,f]),
	Term.
	
model(Term):-
	term_variables(Term,[X,Y]),
	member(X,[t,f]),
	member(Y,[t,f]),
	Term.
	
%%%theory/1
theory(L):-
	findall(X,(member(X,L),model(X)),_).
	
	
	
	
%exercice9
%%%seperate_lists/3
seperate_lists(List,Lets,Nums):-
	findall(X,(member(X,List),number(X)),Nums),
	findall(X,(member(X,List),not(number(X))),Lets).
	
%exercice10
%%%less_ten/1
less_ten(X):-
	X<10.
	
%%%less_twenty/1
less_twenty(X):-
	X<20.
	
%%%filter/3
filter(C,List,Solution):-
	findall(X,
			(member(X,List), Mycall =..[C,X] ,call(Mycall)),
			Solution).
	