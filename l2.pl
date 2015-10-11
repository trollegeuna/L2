% By Trolle Geuna & Oskar Casselryd, 2015

% Ta en person, kollar dess vänner.
% Ta bort alla vänner som är vänner med spindelns vänner.





spider(X):-
  % Tar nästa perosn från exemplet
  person(X),
  % Hittar denna persons Kompisar
  hittaMinaKamrater(X,Kompisar),
  % Kolla Kolla
  write(Kompisar),
  backa(X,Kompisar).

hittaMinaKamrater(X, Kompisar):-
  bagof(Kamrat, kompis(X,Kamrat), Kompisar).
  %findall(Kamrat ,kompis(X, Kamrat), Kompisar).

% Vänskap går åt båda hållen.
kompis(A,B) :- knows(A,B) ; knows(B,A).

 

% % Känner någon i listan någon?
% noFriends(P, []).
%
% noFriends(P1, [P2|Tail]):-
%   not(hittaMinaKamrater(P,Hokus)),
%   noFriends(Tail).



elimineringUtavKamrater([NarmasteKompisen|Kompisar], KonspirationsTeoretiker):-
  checkInList(NarmasteKompisen, Kompisar),
  !,
  KonspirationsTeoretiker is [NarmasteKompisen | KonspirationsTeoretiker],
  !,
  elimineringUtavKamrater(Kompisar,KonspirationsTeoretiker).



elimineringUtavKamrater([NarmasteKompisen|Kompisar],KonspirationsTeoretiker):-
  elimineringUtavKamrater(Kompisar, KonspirationsTeoretiker).





% Return true om P inte känner någon i listan.
% Return false om P känner någon i listan.
checkInList(P, [P2|[]]):-
  not(kompis(P,P2)).

checkInList(P, [P2|List]):-
  not(kompis(P,P2)),
  checkInList(P, List).


% Det här kommer inte gå!
backa([X,Xs|Tail],K):-!.


% hämta person X
% hämta person Xs vänlista
