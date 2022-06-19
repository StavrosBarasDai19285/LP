:-lib(ic).
:-lib(ic_global).
:-lib(branch_and_bound).
:-lib(ic_edge_finder).

num_gen_min([X1,5,X3,X4,3],[Y1,Y2,0,Y4,1],D):-
	[X1,X3,X4,Y1,Y2,Y4] #:: [2,4,6,7,8,9],
	ic:alldifferent([X1,X3,X4,Y1,Y2,Y4]),
	D #= (10000*Y1 + 1000*Y2 + 10*Y4 + 1) - (10000*X1 + 5000 + 100*X3 + 10*X4 + 3),
	D #>= 0,
	bb_min(labeling([X1,X3,X4,Y1,Y2,Y4]),D,_).
	
	
%%% Student Data
student(alex,[4,1,3,5,6]).
student(nick,[6,3,5,2,4]).
student(jack,[8,4,5,7,10]).
student(helen,[3,7,8,9,1]).
student(maria,[7,1,5,6,4]).
student(evita,[8,4,7,9,5]).
student(jacky,[5,6,7,4,10]).
student(peter,[2,6,10,8,3]).
student(john,[1,3,10,9,6]).
student(mary,[1,6,7,9,10]).

solve_thesis(StudentsList,Cost):-
    findall(S,student(S,_),Students),
    constrain_students(Students,Thesis,Costs,StudentsList),
    ic_global:alldifferent(Thesis),
    sumlist(Costs,Cost),
    bb_min(labeling(Thesis),Cost,_).


constrain_students([],[],[],[]).
constrain_students([S|Rest],[T|Thesis],[I|Costs],[(S,T)|Tail]):-
	student(S,ST),
	element(I,ST,T),
	constrain_students(Rest,Thesis,Costs,Tail).
	

provider(a,[0,750,1000,1500],[0,10,13,17]).
provider(b,[0,500,1250,2000],[0,8,12,22]).
provider(c,[0,1000,1750,2000],[0,15,18,25]).
provider(d,[0,1000,1500,1750],[0,13,15,17]).


space(Contracts,Cost):-
    findall(P,provider(P,_,_),Providers),
    constrain_providers(Providers,Contracts,Costs),
	sumlist(Contracts,TotalContracts),
	TotalContracts #>= 3600,
	TotalContracts #=< 4600,
    %ic_global:alldifferent(Contracts),
    sumlist(Costs,Cost),
    bb_min(labeling(Contracts),Cost,_).


constrain_providers([],[],[]).
constrain_providers([P|Rest],[S|Speeds],[C|Costs]):-
	provider(P,MySpeeds,MyCosts),
	element(I,MySpeeds,S),
	element(I,MyCosts,C),
	constrain_providers(Rest,Speeds,Costs).



antennas(N, Max, L):-
	length(L, N),
	L #:: [0..1.0Inf],
	element(1,L,0),
	constrain_antennas(L),
	ic_global:alldifferent(L),
	append(_,[Max],L),
	bb_min(labeling(L),Max,_).
	

constrain_antennas(L):-
	calculate_distances(L,D),
	ic_global:alldifferent(D).

calculate_distances([],_).
calculate_distances([H|T],D):-
	sum_distance(H,T,DD),
	calculate_distances(T,DDD),
	append(DD,DDD,D).
	

sum_distance(_,[],[]).
sum_distance(X,[H|T],D):-
	Distance #= H - X,
	Distance #> 0,
	sum_distance(X,T,DD),
	append(DD,Distance,D).







