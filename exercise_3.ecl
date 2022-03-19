%%% father/2
%%% father(X,Y) X is the father of Y
father(Smith,SmithSon).
father(Baker,BakerSon).
father(Carpenter,CarpenterSon).
father(Tailor,TailorSon).

%%%not_same_prof/2
not_same_prof(X,Y):-
	job(X) \= job(Y).
	
job(Baker) = job(CarpenterSon).

worker(name(Smith),job(SmithJob)).

%%% profession/8
profession(Smith,SmithSon,Baker,BakerSon,
		   Carpenter,CarpenterSon,Tailor,TailorSon):-
	