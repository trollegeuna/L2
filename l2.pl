% By Trolle Geuna & Oskar Casselryd, 2015

% Ta en person, kollar dess vänner.
% Ta bort alla vänner som är vänner med spindelns vänner.





spider(X):-
  % Tar nästa perosn från exemplet
  person(X),
  % Hittar denna persons Kompisar
  allaMinaKamrater(X,Kompisar),
  % Return lista med kamrater som inte känner varandra. Dvs möjliga konspiratorer.
  elimineringUtavKamrater(Kompisar,KonstigaManniskor),
  % Kolla om alla personer är vän med någon konspiratör. Om så är fallet är X spindel.
  jagEPoppis(KonstigaManniskor).
  %write(KonstigaManniskor)
  % Backtrack, kolla detta för alla personer.
  % backa(X,Kompisar).


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



% TODO FIXA kanskeJagGillarDig
% Känner någon i listan någon?
kanskeJagGillarDig(_, []).

kanskeJagGillarDig(P1, [P2|Tail]):-
  allaMinaKamrater(P1,_),
  kanskeJagGillarDig(Tail).

% TODO här kan vi ev. få fel när vi subtractar folk från listan.
% TODO vi borde skicka in 2 listor. En med alla spindelns vänner som vi inte ändrar, och en där vi tar bort deras vänner.
elimineringUtavKamrater([NarmasteKompisen|Kompisar], KonspirationsTeoretiker):-
  allaMinaKamrater(NarmasteKompisen, Svar),
  subtract(Kompisar, Svar, KollaIgen),
  elimineringUtavKamrater(KollaIgen,K1),
  KonspirationsTeoretiker = [NarmasteKompisen | K1].

elimineringUtavKamrater([_|Kompisar], K):-
  elimineringUtavKamrater(Kompisar,K).

elimineringUtavKamrater([],[]).

% Kolla om alla personer känner någon i listan KonstigaManniskor.
% Om detta är fallet returnera true. Annars false.
% TODO: FIXA forall
jagEPoppis([KonstigaManniskor]):-
  forall(Person(Asome),
  member(Asome,KonstigaManniskor);kanskeJagGillarDig(Asome,KonstigaManniskor)).


% hämta person X
% hämta person Xs vänlista
