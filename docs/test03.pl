% Questão 01

is_triple(A,B,C) :-
    C*C =:= A*A + B*B.

% Questão 02:

solve_triple(A,B,C) :-
    between(1, 10, A),
    between(1, 10, B),
    between(1, 10, C),
    is_triple(A,B,C).

% Questão 03:

% <exp> ::= <exp> + <mulexp> | <mulexp>
% <mulexp> ::= <mulexp> * <rootexp> | <rootexp>
% <expexp> ::= <expexp> ** <varexp> | <varexp> 
% <varexp> ::= let val <variable> = <exp> in <exp> end
% <rootexp> ::= <varexp> | ( <exp> ) | <constant>

% Questão 04:

evall(exp(var(BaseName), Exp), Contexto, Resultado) :-
    lookup(BaseName, Contexto, ValorBase),
    evall(Exp, Contexto, ValorExp),
    Resultado is ValorBase ** ValorExp.

exp(Base, 0, Value) :- Value is 1.
exp(Base, 1, Value) :- Value is Base.
exp(Base, 2, Value) :- Value is Base*Base.

exp(Base, Exp, Value) :- Paridade is Exp mod 2,
    Paridade = 1,
    NewBase is Base*Base,
    NewExp is Exp/2,
    exp(NewBase, NewExp, NewValue),
    Value is NewValue * Base.

exp(Base, Exp, Value) :- Paridade is Exp mod 2,
    Paridade \= 1,
    NewBase is Base*Base,
    NewExp is Exp/2,
    exp(NewBase, NewExp, Value).