%exercice4
%%%rotate_left/3
rotate_left(0,L,L).
rotate_left(Pos,List,RList):-
	delete(X,List,DelList),
	append(DelList,[X],RTempList),
	Pos1 is Pos - 1,
	rotate_left(Pos1,RTempList,RList).