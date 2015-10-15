% By Trolle Geuna & Oskar Casselryd, 2015

% Testa med alla personer.
spider(X):-
  % Tar nästa person från exemplet
  person(X),
  hittaSpindel(X).

hittaSpindel(X):-
  % Hittar denna persons Kompisar
  allaMinaKamrater(X,Kompisar),
  % Return lista med kamrater som inte känner varandra. Dvs möjliga konspiratorer.
  fixaKonspiratorer(Kompisar, [], KonstigaManniskor),
  % Kolla om alla personer är vän med någon konspiratör. Om så är fallet är X spindel.
  jagEPoppis(KonstigaManniskor),
  !.


allaMinaKamrater(X, Kompisar):-
  % Bagof fails om inga kompisar finns.
  bagof(Kamrat, kompis(X,Kamrat), Kompisar).

% Vänskap går åt båda hållen.
kompis(A,B) :- knows(A,B) ; knows(B,A).

 
% harKompis FUNKAR!
% Känner P någon i listan? True eller false.
harKompis(P, Lista):-
  not(harKompisHelp(P, Lista)).

% Return true om P inte känner någon i listan.
harKompisHelp(_, []).

harKompisHelp(P, [Head|Lista]):-
  not(kompis(P, Head)),
  harKompisHelp(P, Lista).


% Ta in spindelns vänner och returnera en lista med folk som inte känner varandra.
fixaKonspiratorer([], Svar, Svar).

fixaKonspiratorer([Y|SpindelKompisar], Konspiratorer, Svar):-
  not(harKompis(Y, Konspiratorer)), % Y har ingen kompis bland konspiratorerna.
  fixaKonspiratorer(SpindelKompisar, [Y|Konspiratorer], Svar). % Gå vidare.

fixaKonspiratorer([_|SpindelKompisar], Konspiratorer, Svar) :-
  fixaKonspiratorer(SpindelKompisar, Konspiratorer, Svar).


% Kolla om alla personer känner någon i listan KonstigaManniskor.
% Om detta är fallet returnera true. Annars false.
jagEPoppis(KonstigaManniskor):-
  forall(person(Y),
  (member(Y,KonstigaManniskor);harKompis(Y,KonstigaManniskor))).


% hämta person X
% hämta person Xs vänlista
