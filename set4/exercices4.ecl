%exercice1
%a)
%%%symmetric/1
symmetric(L):-
	append(Ltemp,Ltemp,L).
	
%b)
%%%end_sublist/2
end_sublist(L1,L2):-
	append(_,L1,L2).
	
%c)
%%%twice_sublist/2
twice_sublist(L1,L2):-
	append( Ltemp, S2, L2),
	append( S1, L1,Ltemp),
	append( S1,S2,L3),
	append( Ltemp1, _S21, L3),
	append( _S11, L1, Ltemp1).

%d)
%%%last_element/2
last_element(L,X):-
	append(_,[X],L).
	
%exercice2
word([p,r,o,l,o,g]).
word([m,a,t,h,s]).

%%%missing_letter/3
missing_letter(L,X,W):-
		word(W),
		delete(X,W,L).
	
%exercice3
%%%reverse_alt/2
reverse_alt([],[]).
reverse_alt(L1,L2):-
	append(Ltemp1,[X],L1),
	append([X],Ltemp2,L2),
	reverse_alt(Ltemp1,Ltemp2).
	
	
%exercice4
%%%rotate_left/3
rotate_left(0,L,L).
rotate_left(Pos,List,RList):-
	delete(X,List,DelList),
	append(DelList,[X],RTempList),
	Pos1 is Pos - 1,
	rotate_left(Pos1,RTempList,RList).
	