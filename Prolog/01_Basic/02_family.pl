/*
Program to establish family relationships between persons
Source of the data:
    https://dragonball.fandom.com/wiki/Bardock

Gilberto Echeverria
02/10/2019
*/

% Facts
father(goku, gohan).
father(goku, goten).
father(bardock, goku).
father(bardock, raditz).
father(vegeta, trunks).
father(vegeta, bulla).
father(dr_brief, bulma).
father(ox_king, chichi).
father(king_vegeta, vegeta).
mother(gine, goku).
mother(gine, raditz).
mother(chichi, gohan).
mother(chichi, goten).
mother(bulma, trunks).
mother(bulma, bulla).
mother(panchy, bulma).
male(bardock).
male(goku).
male(raditz).
male(vegeta).
male(gohan).
male(goten).
male(trunks).
male(king_vegeta).
male(dr_brief).
male(ox_king).
female(gine).
female(chichi).
female(bulma).
female(bulla).
female(panchy).

% Rules
% ex: brothers(gohan, goten).
brothers(X, Y) :-
    father(Z, X),
    father(Z, Y),
    mother(W, X),
    mother(W, Y),
    X \= Y.

brother(X, Y) :-
    male(X),
    brothers(X, Y).

sister(X, Y) :-
    female(X),
    brothers(X, Y).

grandfather(X, Y) :-
    father(X, Z),
    father(Z, Y).
grandfather(X, Y) :-
    father(X, Z),
    mother(Z, Y).

grandmother(X, Y) :-
    mother(X, Z),
    father(Z, Y).
grandmother(X, Y) :-
    mother(X, Z),
    mother(Z, Y).

grandchild(X, Y) :-
    grandfather(Y, X).
grandchild(X, Y) :-
    grandmother(Y, X).

grandson(X, Y) :-
    grandchild(X, Y),
    male(X).

granddaughter(X, Y) :-
    grandchild(X, Y),
    female(X).

uncle(X, Y) :-
    brother(X, Z),
    father(Z, Y).

uncle(X, Y) :-
    brother(X, Z),
    mother(Z, Y).

