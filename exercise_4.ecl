command(add_r1,state(acc(X),reg1(Y),R2,R3),state(acc(X+Y),reg1(Y),R2,R3)).
command(add_r2,state(acc(X),R1,reg2(Y),R3),state(acc(X+Y),R1,reg2(Y),R3)).
command(add_r3,state(acc(X),R1,R2,reg3(Y)),state(acc(X+Y),R1,R2,reg3(Y))).

command(subtract_r1,state(acc(X),reg1(Y),R2,R3),state(acc(X-Y),reg1(Y),R2,R3)).
command(subtract_r2,state(acc(X),R1,reg2(Y),R3),state(acc(X-Y),R1,reg2(Y),R3)).
command(subtract_r3,state(acc(X),R1,R2,reg3(Y)),state(acc(X-Y),R1,R2,reg3(Y))).

command(store_r1,state(acc(X),reg1(_),R2,R3),state(acc(X),reg1(X),R2,R3)).
command(store_r2,state(acc(X),R1,reg2(_),R3),state(acc(X),R1,reg2(X),R3)).
command(store_r3,state(acc(X),R1,R2,reg3(_)),state(acc(X),R1,R2,reg3(X))).

command(load_r1,state(acc(_),reg1(Y),R2,R3),state(acc(Y),reg1(Y),R2,R3)).
command(load_r2,state(acc(_),R1,reg2(Y),R3),state(acc(Y),R1,reg2(Y),R3)).
command(load_r3,state(acc(_),R1,R2,reg3(Y)),state(acc(Y),R1,R2,reg3(Y))).

findOps(O1,O2,O3):-
	command(O1,state(acc(C1),_,reg2(C2),reg(C3)),
				 state(acc(A1),reg1(R1),reg2(R2),reg3(R3))),
	command(O2,state(acc(A1),reg1(R1),reg2(R2),reg3(R3)),
				 state(acc(A11),reg1(R11),reg2(R22),reg3(R33))),
	command(O3,state(acc(A11),reg1(R11),reg2(R22),reg3(R33)),
				 state(acc(A11),reg1(C1-C2+C3),reg2(R22),reg3(R33))),
	state(acc(C1),_,reg2(C2),reg3(C3)) = state(_,reg(C1-C2+C3),_,_).
	
findOp(O1):-
	command(O1,state(acc(X),R1,reg2(Y),R3),
				 state(acc(X+Y),R1,reg2(Y),R3)).