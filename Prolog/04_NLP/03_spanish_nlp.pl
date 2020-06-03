/*
    Modification of a simple grammar for NLP
    Generating a parsing tree for the structure of the sentence

    Isabel Maqueda Rolon
    02/6/2020
*/
 /* plural articles and nouns : This will also require that you add variants to the verbs in plural*/

 /*adjectives : Applied to the subject part. Must have consistency for gender and number.*/
% Vocabulary
% singular articles
article(art(el), mas, sn, L0, L) :- terminal(el, L0, L).
article(art(la), fem, sn, L0, L) :- terminal(la, L0, L).
% plural articles 
article(art(las), fem, pl, L0, L) :- terminal(las, L0, L).
article(art(los), mas, pl, L0, L) :- terminal(los, L0, L).
% singular nouns
noun(nou(manzana), fem, sn, L0, L) :- terminal(manzana, L0, L).
noun(nou(zanahoria), fem, sn, L0, L) :- terminal(zanahoria, L0, L).
noun(nou(caballo), mas, sn,  L0, L) :- terminal(caballo, L0, L).
noun(nou(gallo), mas, sn, L0, L) :- terminal(gallo, L0, L).
% plural nouns
noun(nou(niños), mas, pl, L0, L) :- terminal(niños, L0, L).
noun(nou(pelotas), fem, pl, L0, L) :- terminal(pelotas, L0, L).
% singular verbs
verb(ver(come), sn, transitive, L0, L) :- terminal(come, L0, L).
verb(ver(camina), sn, intransitive, L0, L) :- terminal(camina, L0, L).
% plural verbs  
verb(ver(lanzan), pl, intransitive, L0, L) :- terminal(lanzan, L0, L).
% singular adjetives
adjective(adj(grande), mas, sn, L0, L) :- terminal(grande, L0, L).

% Rule for the word to use
terminal(Word, [Word|List], List).


% Grammar
sentence(sen(NounPart, VerbPart), L0, L) :-
    % where P is Plural, L0 is the list and L is the end product
    subject(NounPart, P, L0, L1),
    predicate(VerbPart, P, L1, L),
    % Check that the noun part is not the same
    VerbPart \= vp(_, NounPart).

subject(np(Article, Noun), P, L0, L) :-
    % Where G is gender, P is plural, L0 is the entire list and L is the reminded list.
    article(Article, G, P, L0, L1),
    noun(Noun, G, P, L1, L).

subject(np(Article, Noun), P, L0, L) :-
    % Where G is gender, P is plural, L0 is the entire list and L is the reminded list.
    article(Article, G, P, L0, L1),
    noun(Noun, G, P, L1, L2),
    adjective(Adjective, G, P, L2, L).

predicate(vp(Verb), P,  L0, L) :-
    verb(Verb, P, _, L0, L).

predicate(vp(Verb, NounPart), P, L0, L) :-
    % Where P is plural, L0 is the list and L is the reminder of the List
    verb(Verb, P, transitive, L0, L1),
    subject(NounPart, _, L1, L).
