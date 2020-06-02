/*
    Define a relation to solve the steps for Towers of Hanoi

    Gilberto Echeverria
    12/05/2020
*/


% Base case
hanoi(1, Label, Origin, Destination, _) :-
    write("Move "),
    write(Label),
    write(" from "),
    write(Origin), 
    write(" to "),
    write(Destination),
    nl.

% Recursive predicate
hanoi(Rings, _, Origin, Destination, Temp) :-
    Rings > 1,
    N_1 is Rings - 1,
    hanoi(N_1, N_1, Origin, Temp, Destination),
    hanoi(1, Rings, Origin, Destination, Temp),
    hanoi(N_1, N_1, Temp, Destination, Origin),
    % Stop prolog from tying to find other solutions
    !.
