% Exercício 01
% a)
mother(X, Y) :- female(X), parent(X, Y).

% b)
father(X, Y) :- male(X), parent(X, Y).

% c)
sister(X, Y) :- female(X), parent(P, X), parent(P, Y), X \= Y.

% d)
grandson(X, Y) :- parent(Y, P), parent(P, X).

% e)
firstCousin(X, Y) :- 
    parent(P, X), 
    parent(GP, P), 
    parent(GP, T),
    parent(T, Y),
    P \= T.

% f)
descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(P, X), descendant(P, Y).

% Exercício 02
third([_,_,Y|_], Y).

% Exercício 03
firstPair([X,X|_]).

% Exercício 04
del3([A,B,C|R], [A,B|R]).

% Exercicio 05
dupList([], []).
dupList([X|RX], [X, X|RY]) :- dupList(RX, RY). 

% Exercício 06
oddSize([_]).
oddSize([_,_|R]) :- oddSize(R). 

% Exercício 07
evenSize([]).
evenSize([_,_|R]) :- evenSize(R). 