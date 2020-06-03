/*
    Modification of a simple spanish grammar for NLP
    Generating a parsing tree for the structure of the sentence

    Gilberto Echeverria
    26/05/2020

    Moisés Torres
    Added adjectives and plural articles and nouns
    02/06/2020
*/

% Vocabulary
article(art(el), mas, sin, L0, L) :- terminal(el, L0, L).
article(art(la), fem, sin, L0, L) :- terminal(la, L0, L).
article(art(los), mas, plural, L0, L) :- terminal(los, L0, L).
article(art(las), fem, plural, L0, L) :- terminal(las, L0, L).

noun(nou(manzana), fem, sin, L0, L) :- terminal(manzana, L0, L).
noun(nou(zanahoria), fem, sin, L0, L) :- terminal(zanahoria, L0, L).
noun(nou(pelota), fem, sin, L0, L) :- terminal(pelota, L0, L).
noun(nou(bici), fem, sin, L0, L) :- terminal(bici, L0, L).
noun(nou(caballo), mas, sin, L0, L) :- terminal(caballo, L0, L).
noun(nou(gallo), mas, sin, L0, L) :- terminal(gallo, L0, L).
noun(nou(niño), mas, sin, L0, L) :- terminal(niño, L0, L).

noun(nou(manzanas), fem, plural, L0, L) :- terminal(manzanas, L0, L).
noun(nou(zanahorias), fem, plural, L0, L) :- terminal(zanahorias, L0, L).
noun(nou(pelotas), fem, plural, L0, L) :- terminal(pelotas, L0, L).
noun(nou(caballos), mas, plural, L0, L) :- terminal(caballos, L0, L).
noun(nou(gallos), mas, plural, L0, L) :- terminal(gallos, L0, L).
noun(nou(niños), mas, plural, L0, L) :- terminal(niños, L0, L).

adjective(adj(grande), mas, sin, L0, L) :- terminal(grande, L0, L).
adjective(adj(pequeño), mas, sin, L0, L) :- terminal(pequeño, L0, L).
adjective(adj(pequeña), fem, sin, L0, L) :- terminal(pequeña, L0, L).

adjective(adj(grandes), mas, plural, L0, L) :- terminal(grandes, L0, L).
adjective(adj(pequeños), mas, plural, L0, L) :- terminal(pequeños, L0, L).
adjective(adj(pequeñas), fem, plural, L0, L) :- terminal(pequeñas, L0, L).

verb(ver(come), transitive, sin, L0, L) :- terminal(come, L0, L).
verb(ver(monta), transitive, sin, L0, L) :- terminal(monta, L0, L).
verb(ver(lanza), transitive, sin, L0, L) :- terminal(lanza, L0, L).
verb(ver(camina), intransitive, sin, L0, L) :- terminal(camina, L0, L).

verb(ver(comen), transitive, plural, L0, L) :- terminal(comen, L0, L).
verb(ver(montan), transitive, plural, L0, L) :- terminal(montan, L0, L).
verb(ver(lanzan), transitive, plural, L0, L) :- terminal(lanzan, L0, L).
verb(ver(caminan), intransitive, plural, L0, L) :- terminal(caminan, L0, L).


% Rule for the word to use
terminal(Word, [Word|List], List).

% Grammar
sentence(sen(NounPart, VerbPart), L0, L) :-
    subject(NounPart, Number, L0, L1),
    predicate(VerbPart, Number, L1, L),
    % Check that the noun part is not the same
    VerbPart \= vp(_, NounPart).

subject(np(Article, Noun, Adjective), Number, L0, L) :-
    article(Article, G, Number, L0, L1),
    noun(Noun, G, Number, L1, L2),
    adjective(Adjective, G, Number, L2, L).

subject(np(Article, Noun), Number, L0, L) :-
    article(Article, G, Number, L0, L1),
    noun(Noun, G, Number, L1, L).

predicate(vp(Verb), Number, L0, L) :-
    verb(Verb, _, Number, L0, L).

predicate(vp(Verb, NounPart), Number, L0, L) :-
    verb(Verb, transitive, Number, L0, L1),
    subject(NounPart, _, L1, L).
