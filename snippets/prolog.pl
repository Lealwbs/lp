% REGRAS DE INFERÊNCIA
% Para executar, usar: swipl test.pl

% Maiúscula: Variável
% minúscula: nome

parent(abo, beca).
parent(aba, beca).
parent(beca, cadu).
parent(cadu, deca).
parent(cadu, deco).

grandparent(GP,GC) :- parent(GP,X), parent(X,GC).

% Caso base deve vir antes do recursivo
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(Z, Y), ancestor(X, Z).


greatgrandparent(GGP, X) :- 
    parent(GGP, GP),
    parent(GP, P),
    parent(P, X). 


% OPERADORES:

% ?- X+Y = 1+2*3.
% X = 1,
% Y = 2*3.

% LISTAS: [] = Vazia

% ?- X = [1,2,3].
% X = [1,2,3].
% ?- X = [1, joao, X, parent(esther, X)].
% X = [1, joao, X, parent(esther, X)].

% APPEND:

% ?- append([1,2],[3,4], X).
% X = [1, 2, 3, 4].
% ?- append(X, Y, [1,2,3,4]).
% X = [],
% Y = [1, 2, 3, 4] ;
% X = [1],
% Y = [2, 3, 4] ;
% X = [1, 2],
% Y = [3, 4] ;

% MEMBER:

member(A,[A|_]).
member(A, [_|T]) :- member(A,T).

% LENGTH

% ?- length([1,2], X).
% X = 2.
% ?- length(X, 2).
% X = [_, _].
% ?- length([1,2,3|A], X).
% A = [],
% X = 3 ;
% A = [_],
% X = 4 ;
% A = [_, _],
% X = 5 .

sibling(X,Y) :- not(X=Y), parent(P, X), parent(P, Y).
% sibling(X,Y) :- parent(P, X), parent(P, Y), not(X=Y).
