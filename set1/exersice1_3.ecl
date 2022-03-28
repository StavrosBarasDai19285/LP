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
	
%%% add3bit/11
add3bit(C0,X0,Y0,S0,X1,Y1,S1,X2,Y2,S1,C3):-
	add(X0,Y0,C0,S0,C1),
	add(X1,Y1,C1,S1,C2),
	add(X2,Y2,C2,S2,C3).