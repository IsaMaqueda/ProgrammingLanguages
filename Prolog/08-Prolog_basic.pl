/*
    Prolog Basic
    Isabel Maqueda Rolon
    A01652906
*/

%%% in_list : Take two arguments, a list and an element, and determine if the element can be found inside the list.
% Entry Function
in_list(D, X) :- member(X,D).

/* Take as argument an index and a list, and return the element at index n of the list. 
 Indices start at 0. If the index is negative, then you should start counting from the right side,
 where the last element in the list has index -1. */

% Base Case is where element is at 0
element_at(0,[X|_],X) :- !.

% Recusrion when index is positive

element_at(N,[_|T],X) :-
    N > 0,
    C is N -1,
    element_at(C,T,X) , !.

% Recursion when index is negative
element_at(N,L,X) :- 
    N < 0,
    C is N * -1,
    N2 is C - 1,
    reverse(L,R),
    element_at(N2,R,X) , !.


/* Take as arguments a starting and ending number, as well as an increment and a list.
The list will be a collection of numbers from start to finish, with the increment specified.
The top limit is not inclusive. If it is not possible to get from start to finish with the increment provided,
return an empty list */

% Base Case when increment is positive
range(S,F,I,[]) :- 
    I > 0,
    S >= F,
    !. 

% Base Case when increment is negative 
range(S,F,I,[]) :-
    I < 0,
    S =< F,
    !.

% Base case when there is no increment return an empty list
range(_,_,0,[]) :- !. 

%Recursive Function

range(S,F,I,[S|L]) :- 
    T is S + I,
    range(T,F,I,L). 

/*Take as argument a list, and generate a list without contiguous elements that are duplicated*/

% Base Case
remove_doubles([],[]) :- !.

% When the actual element is the same as R
remove_doubles([H|T],R) :- 
    remove_doubles(T,R),
    R = [H|_],
    !.

% When the element is different than R
remove_doubles([H|T],R) :-
    remove_doubles(T,R1),
    R = [H|R1].