/*
* 	First example of Prolog
*
*	Isabel Maqueda Rolon
*	05/05/2020
*/
%Facts
man(socrates).
man(plato).

woman(sara).

%Rule
mortal(X) :- man(X).

mortal(X) :- woman(X).

