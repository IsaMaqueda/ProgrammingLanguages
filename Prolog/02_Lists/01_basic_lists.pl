/*
    Simple operations on lists

    Gilberto Echeverria
    15/05/2020
*/

%%% Reimplementation of function 'length'
% Entry function
len(D, L) :-
    len(D, 0, L).
% Base case
len([], A, A).
% Recursive rule
len([_|T], A, L) :-
    A1 is A + 1,
    len(T, A1, L).

%%% Reimplementation of function 'rev'
% Entry function
rev(D, R) :-
    rev(D, [], R).
% Base case
rev([], A, A).
% Recursive rule
rev([H|T], A, R) :-
    rev(T, [H|A], R).


% Append the contents of L1 and L2, and put the result in R
% Base case
app([], L, L).
% Recursive case
%app([H|T], L2, R) :-
%   app(T, L2, R1),
%   R = [H|R1].
% Tail recursive
app([H|T], L2, [H|R1]) :-
    app(T, L2, R1).


% Remove item X from the list D, and put the result in R
% Base case
% Delete only the first appearance of X
%del([X|T], X, T) :- !.
% Delete all appearances of X
del([], _, []) :- !.
% Recursion
del([X|T], X, R) :-
    del(T, X, R).
del([H|T], X, [H|R]) :-
    H \= X,
    del(T, X, R).


% Remove the item at index I from list D. Return the item in X and the resulting list in R
del_at(D, I, X, R).
