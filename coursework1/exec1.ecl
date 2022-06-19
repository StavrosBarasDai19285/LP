%%%List Processing
%element_repeat/2
%Στη περίπτωση που το rep είναι πρώτο, επιστρέφω την ουρά
element_repeat([rep|L],L).

element_repeat([],[]). %Βασική περίπτωση

%Γενική περίπτωση 1
%Αν το δεύτερο στοιχείο είναι ίσο με rep, βάλε δύο φορες το Ε1 στο αποτέλεσμα και συνέχισε
element_repeat([E1,E2|T],[E1,E1|RT]):- 
	E2 == rep, 
	element_repeat(T,RT).

%Γενική περίπτωση 2
%Στη περίπτωση που δεν υπάρχει rep, βάλε το στοιχείο στο αποτέλεσμα και συνέχισε
element_repeat([H|T],[H|RT]):-
	element_repeat(T,RT).
	
%%%List Processing II
%element_repeat_non/2
%Στη περίπτωση που το rep είναι πρώτο, επιστρέφω την ουρά
element_repeat_non([rep|L],L).

%Όταν δεν υπάρχει rep στη λίστα, επέστρεψε τη λίστα
element_repeat_non(L,L):-
	not(member(rep,L)).

element_repeat_non(L,R):-
	append(L1,L2,L), %Χώρισε τη λίστα σε δύο κομμάτια
	append(P1,[X,rep],L1), %Αν το πρώτο κομμάτι έχει στο τέλος ένα στοιχείο Χ και το rep
	append(P1,[X,X],P2), % Αντικατέστησε το rep με το Χ και βάλτα σε καινούργια λίστα
	append(P2,L2,R). % Σύνδεσε τη λίστα με το δεύτερο κομμάτι που διαχωρίστηκε στην αρχή 
	
	
%%%Banner
%cost_banner/3
%Βασική περίπτωση
cost_banner([_],0,_).

%Γενικές περιπτώσεις
%Περίπτωση που έχω συνδυασμό cj
cost_banner([c,j|T],Cost,comp(Comp,X,Y)):-
	cost_banner([j|T],Cost2,comp(Comp,X,Y)), %Συνέχισε χωρίς το πρώτο στοιχείο
	calc_cost(Comp,X,Cost2,Cost). %Υπολόγισε το κόστος
	
%Περίπτωση που έχω συνδυασμό jc
cost_banner([j,c|T],Cost,comp(Comp,X,Y)):-
	cost_banner([c|T],Cost2,comp(Comp,X,Y)), %Συνέχισε χωρίς το πρώτο στοιχείο
	calc_cost(Comp,Y,Cost2,Cost). %Υπολόγισε το κόστος
	
%Περίπτωση που έχω συνδυασμό cc ή jj
cost_banner([H,H|T],Cost,comp(Comp,X,Y)):-
	cost_banner([H|T],Cost2,comp(Comp,X,Y)), %Συνέχισε χωρίς το πρώτο στοιχείο
	Cost is Cost2. %Πέρασε το προηγούμενο κόστος όπως είναι
	
%calc_cost/4
%Βοηθητική συνάρτηση που υπολογίζει το κόστος
%Περίπτωση που έχω άθροισμα
calc_cost(+,A,B,R):-
	R is A + B.
	
%Περίπτωση που έχω γινόμενο και γίνεται ο πρώτος υπολογισμός
calc_cost(*,A,0,R):-
	R is A,
	!.

%Περίπτωση που έχω γινόμενο και έχουν προηγηθεί άλλα
calc_cost(*,A,B,R):-
	R is A * B.
	
%min_cost_banner/2
min_cost_banner(Banner,comp(Comp,X,Y),Cost):-
	findall(Cost,cost_banner(Banner,Cost,comp(Comp,X,Y)),R), %Βρες πρώτα όλες τις λύσεις
	setof(L,member(L,R),[Cost|_]), %Πάρε τη αυτή με το μικρότερο κόστος
	cost_banner(Banner,Cost,comp(Comp,X,Y)). %Βρες τις τιμές των μεταβλητών με το κόστος που βρήκες
	

%%%Χημικές Παρασκευές
%produce/4
%Αν Ν <= Α απέτυχε
produce(N,A,_B,_Prods):-
	N =< A,
	fail.
	
%Αν Ν > Α & Ν <= Β υπολόγισε μόνο το Ν-Α
produce(N,A,B,[AA]):-
	N > A,
	N =< B,
	AA is N - A.
	
%Αν Ν > Β υπολόγισε και τα δύο
produce(N,A,B,[AA,BB]):-
	N > B,
	AA is N - A,
	BB is N - B.

%search_order/4
%Αν καλυφθεί η παραγγελία σταμάτα
search_order(L,_,_,Order):-
	is_order_coplete(L,Order),
	!.

%Αλλιώς ψάξε
search_order(L,A,B,Order):-
	delete(N,L,LL),%Πάρε ένα στοιχείο Ν
	produce(N,A,B,Prods),%Παρασκεύασε με το Ν που πήρες
	append(Prods,LL,R), %Φτιάξε τη νέα λίστα
	search_order(R,A,B,Order), %Συνέχισε την αναζήτηση
	!.

%is_order_coplete/2
%Βοηθητική συνάρτηση που βλέπει αν καλύφθηκε η παραγγελία
%Βασική περίπτωση
is_order_coplete(_,[]).

%Γενική Περίπτωση
is_order_coplete(L,Order):-
	delete(X,Order,NOrder),%Βγάλε ένα στοιχείο από τη παραγγελία
	delete(X,L,NL),%Δες αν υπάρχει στη λίστα μου και διέγραψε το
	is_order_coplete(NL,NOrder).%Κάνε το ίδιο για την υπόλειπη παραγγελία









