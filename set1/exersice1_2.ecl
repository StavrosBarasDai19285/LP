%%% and/3
%%% Definition of the and operation
and(0,1,0).
and(0,0,0).
and(1,0,0).
and(1,1,1).

%%% or/3
%%% Definition of the or operation
or(0,1,1).
or(0,0,0).
or(1,0,1).
or(1,1,1).

%%% xor/3
%%% definition of the xor operation
xor_gate(0,0,0).
xor_gate(0,1,1).
xor_gate(1,0,1).
xor_gate(1,1,0).

%%% add/5
add(X,Y,C,S,C1):-
	xor_gate(X,Y,XYxorOutput),
	and(X,Y,XYandOutput),
	xor_gate(C,XYxorOutput,S),
	and(C,XYxorOutput,CYXandOutput),
	or(XYandOutput,CYXandOutput,C1).
	