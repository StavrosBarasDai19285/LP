%%%figure/2
figure(1, middle(triangle, square)).
figure(2, middle(circle, triangle)).
figure(3, middle(square, circle)).
figure(4, middle(square, square)).
figure(5, middle(square, triangle)).
figure(6, middle(triangle, circle)).
figure(7, middle(circle, square)).
figure(8, middle(triangle, triangle)).
figure(9, bot_left(circle, circle)).
figure(10, top_left(circle, circle)).
figure(11, bot_right(circle, circle)).
figure(12, top_right(circle, circle)).
figure(13, top_left(square, square)).
figure(14, bot_left(square, square)).
figure(15, top_right(square, square)).
figure(16, bot_right(square, square)).

%%%relation/3
relation( middle(S1,S2), middle(S2,S1), inverse).
relation( middle(_,S1), middle(_,S1), same_out).
relation( middle(S1,_), middle(S1,_), same_in).
relation( bot_left(S1,S1), bot_right(S1,S1), vert_mirror).
relation( bot_right(S1,S1), bot_left(S1,S1), vert_mirror).
relation( top_left(S1,S1), top_right(S1,S1), vert_mirror).
relation( top_right(S1,S1), top_left(S1,S1), vert_mirror).
relation( bot_left(S1,S1), top_left(S1,S1), hor_mirror).
relation( top_left(S1,S1), bot_left(S1,S1), hor_mirror).
relation( bot_right(S1,S1), top_right(S1,S1), hor_mirror).
relation( top_right(S1,S1), bot_right(S1,S1), hor_mirror).

%%%analogy/5
analogy(F1,F2,F3,F4,Rel):-
	figure(F1, Pattern1),
	figure(F2, Pattern2),
	relation( Pattern1, Pattern2, Rel),
	figure(F3, Pattern3),
	relation( Pattern3, Pattern4, Rel),
	figure(F4, Pattern4).
	
	
		






