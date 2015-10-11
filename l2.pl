% By Trolle Geuna & Oskar Casselryd, 2015


%spider(X):-

hittaMinaKamrater(X, Kompisar):-
  findall(Kamrat ,kompis(X, Kamrat), Kompisar).

% Vänskap går åt båda hållen.
kompis(A,B) :- knows(A,B) ; knows(B,A).



% Känner någon av personerna i listan varandra?

noFriends([],_).

noFriends([P|Tail]):-
  checkInList(P, Tail),
  noFriends(Tail).

% Return true om P inte känner någon i listan.
checkInList(P, [P2|[]]):-
  kompis(P,P2).

  checkInList(P, [P2|List]):-
  !,
  \+ kompis(P,P2),
  checkInList(P, List).
