% Exercício 01
max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- X < Y.

% Exercício 02
max_list([], _) :- false.
max_list([M], M) :- true.
max_list([H|T], M) :-
    max_list(T, MaxTail),
    max(H, MaxTail, M).

% Exercício 03
ordered([]).
ordered([_]).
ordered([H, HT|T]) :- 
    H =< HT, 
    ordered([HT|T]).

% Exercício 04
split([],[],[]).
split([A],[A],[]).
split([X, Y | R], [X | RX], [Y | RY]) :- split(R, RX, RY).
merge([],[],[]).
merge(L,[],L).
merge([],L,L).
merge([X|RX], [Y|RY], [X|M]) :- X =< Y, merge(RX, [Y|RY], M).
merge([X|RX], [Y|RY], [Y|M]) :- X > Y, merge([X|RX], RY, M).
merge_sort([], []).
merge_sort([A], [A]).
merge_sort(In, Out) :-
    split(In, X, Y),
    merge_sort(X, XS),
    merge_sort(Y, YS),
    merge(XS, YS, Out).

% Exercício 05
n_queens(N, X) :-
    solve(1, N, [], CoordsInvertidas),
    reverse(CoordsInvertidas, Coords),
    pegar_colunas(Coords, X).

pegar_colunas([], []).
pegar_colunas([_/Coluna | RestoCoords], [Coluna | RestoColunas]) :-
    pegar_colunas(RestoCoords, RestoColunas).

not_in_diagonal(XQ1/YQ1, XQ2/YQ2) :-
    abs(XQ1 - XQ2) =\= abs(YQ1 - YQ2).

is_safe(_, []).
is_safe(QX/QY, [HX/HY|T]) :-
    QX =\= HX,
    QY =\= HY,
    not_in_diagonal(QX/QY, HX/HY),
    is_safe(QX/QY, T).

solve(Linha, N, RainhasJaColocadas, RainhasJaColocadas) :- Linha > N.
solve(Linha, N, RainhasJaColocadas, SolucaoFinal) :-
    Linha =< N,
    between(1, N, Coluna),
    is_safe(Linha/Coluna, RainhasJaColocadas),
    ProxLinha is Linha + 1,
    solve(ProxLinha, N, [Linha/Coluna | RainhasJaColocadas], SolucaoFinal).


% Exercício 06

subset_sum([], 0, []).
subset_sum([H|T], Sum, [H|SubL]) :- 
    NewSum is Sum - H,
    subset_sum(T, NewSum, SubL).
subset_sum([_|T], Sum, SubL) :- 
    subset_sum(T, Sum, SubL).
