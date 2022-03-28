%%% and/3
%%% Definition of the and operation
and(0,1,0).
and(0,0,0).
and(1,0,0).
and(1,1,1).

%%% xor/3
%%% definition of the xor operation
xor_gate(0,0,0).
xor_gate(0,1,1).
xor_gate(1,0,1).
xor_gate(1,1,0).

%%% halfadd/4
halfadd(X,Y,SOutput,COutput):-
	and(X,Y,COutput),
	xor_gate(X,Y,SOutput).

%%% Answers to b)
%%% halfadd(X,Y,S,C)
%%% halfadd(X,Y,S,1)
