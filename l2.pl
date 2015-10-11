% By Trolle Geuna & Oskar Casselryd, 2015

% Ta en person, kollar dess vänner.
% Ta bort alla vänner som är vänner med spindelns vänner.





spider(X):-
  % Tar nästa perosn från exemplet
  person(X),
  % Hittar denna persons Kompisar
  allaMinaKamrater(X,Kompisar),
  % Kolla Kolla
  elimineringUtavKamrater(Kompisar,KonstigaManniskor),
  write(KonstigaManniskor),
  backa(X,Kompisar).

allaMinaKamrater(X, Kompisar):-
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
  allaMinaKamrater(NarmasteKompisen, Svar),
  subtract(Kompisar, Svar, KollaIgen),
  elimineringUtavKamrater(KollaIgen,K1),
  !,
  KonspirationsTeoretiker = [NarmasteKompisen | K1].

elimineringUtavKamrater([_|Kompisar], K):-elimineringUtavKamrater(Kompisar,K).

elimineringUtavKamrater([],[]).

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
