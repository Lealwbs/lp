% Importa o arquivo de soluções do aluno
:- [23].

% Função genérica para rodar um teste e imprimir o resultado de forma limpa
run_test(Name, Goal) :-
    (   catch(Goal, Error, (write('  [ERRO] '), write(Name), write(': '), write(Error), nl, fail))
    ->  write('  [OK] '), write(Name), nl
    ;   write('  [FALHOU] '), write(Name), nl
    ).

% Verifica se o predicado foi implementado/existe
safe_has_predicate(Functor/Arity) :-
    current_predicate(Functor/Arity).

% Executa todos os testes
run_tests :-
    nl, write('=== Executando Testes do Ex 23 ==='), nl,
    
    % --------------------------------------------------------------------------
    % Exercício 01: max(X, Y, Z)
    % --------------------------------------------------------------------------
    write('Ex 01 - max(X, Y, Z):'), nl,
    (safe_has_predicate(max/3) ->
        run_test('max(3, 5, 5) - maior a direita', max(3, 5, 5)),
        run_test('max(10, 2, 10) - maior a esquerda', max(10, 2, 10)),
        run_test('max(-1, -5, -1) - numeros negativos', max(-1, -5, -1)),
        run_test('max(7, 7, 7) - numeros iguais', max(7, 7, 7)),
        run_test('max(4, 9, M) - unificacao correta de variavel livre', (max(4, 9, M), M == 9)),
        run_test('max(8, 3, 3) - deve falhar se o resultado esperado for incorreto', \+ max(8, 3, 3))
    ;   write('  [PULADO] max/3 nao implementado'), nl
    ),
    
    % --------------------------------------------------------------------------
    % Exercício 02: max_list(L, M)
    % --------------------------------------------------------------------------
    nl, write('Ex 02 - max_list(L, M):'), nl,
    (safe_has_predicate(max_list/2) ->
        run_test('max_list([1, 5, 3, 9, 2], 9) - sucesso padrao', max_list([1, 5, 3, 9, 2], 9)),
        run_test('max_list([7], 7) - elemento unico', max_list([7], 7)),
        run_test('max_list([-3, -1, -5], -1) - negativos', max_list([-3, -1, -5], -1)),
        run_test('max_list([2, 2, 2], 2) - duplicados', max_list([2, 2, 2], 2)),
        run_test('max_list([], _) - deve falhar para lista vazia', \+ max_list([], _)),
        run_test('max_list([4, 10, 5], Max) - unificacao de variavel', (max_list([4, 10, 5], Max), Max == 10))
    ;   write('  [PULADO] max_list/2 nao implementado'), nl
    ),
    
    % --------------------------------------------------------------------------
    % Exercício 03: ordered(L)
    % --------------------------------------------------------------------------
    nl, write('Ex 03 - ordered(L):'), nl,
    (safe_has_predicate(ordered/1) ->
        run_test('ordered([]) - lista vazia', ordered([])),
        run_test('ordered([4]) - unico elemento', ordered([4])),
        run_test('ordered([1, 2, 3, 4, 5]) - estritamente crescente', ordered([1, 2, 3, 4, 5])),
        run_test('ordered([1, 1, 2, 2, 3]) - menor ou igual', ordered([1, 1, 2, 2, 3])),
        run_test('ordered([1, 3, 2]) - desordenada deve falhar', \+ ordered([1, 3, 2])),
        run_test('ordered([5, 4, 3]) - decrescente deve falhar', \+ ordered([5, 4, 3]))
    ;   write('  [PULADO] ordered/1 nao implementado'), nl
    ),
    
    % --------------------------------------------------------------------------
    % Exercício 04: merge_sort(In, Out)
    % --------------------------------------------------------------------------
    nl, write('Ex 04 - merge_sort(In, Out):'), nl,
    (safe_has_predicate(merge_sort/2) ->
        run_test('merge_sort([], []) - lista vazia', merge_sort([], [])),
        run_test('merge_sort([5], [5]) - unico elemento', merge_sort([5], [5])),
        run_test('merge_sort([3, 1, 2], [1, 2, 3]) - desordenada simples', merge_sort([3, 1, 2], [1, 2, 3])),
        run_test('merge_sort([5, 4, 3, 2, 1], [1, 2, 3, 4, 5]) - invertida', merge_sort([5, 4, 3, 2, 1], [1, 2, 3, 4, 5])),
        run_test('merge_sort([1, 3, 2, 3, 1], [1, 1, 2, 3, 3]) - com elementos repetidos', merge_sort([1, 3, 2, 3, 1], [1, 1, 2, 3, 3])),
        run_test('merge_sort([10, -2, 5], Out) - unificacao de variavel', (merge_sort([10, -2, 5], Out), Out == [-2, 5, 10]))
    ;   write('  [PULADO] merge_sort/2 nao implementado'), nl
    ),
    
    % --------------------------------------------------------------------------
    % Exercício 05: n_queens(N, X)
    % --------------------------------------------------------------------------
    nl, write('Ex 05 - n_queens(N, X):'), nl,
    (safe_has_predicate(n_queens/2) ->
        run_test('n_queens(1, [1]) - 1 rainha', n_queens(1, [1])),
        run_test('n_queens(2, _) - 2 rainhas deve falhar', \+ n_queens(2, _)),
        run_test('n_queens(3, _) - 3 rainhas deve falhar', \+ n_queens(3, _)),
        run_test('n_queens(4, X) - 4 rainhas sucesso', n_queens(4, _)),
        run_test('n_queens(4, X) - todas as solucoes para 4 rainhas (devem ser 2)', (findall(S, n_queens(4, S), Sols), length(Sols, 2))),
        run_test('n_queens(8, _) - 8 rainhas sucesso', n_queens(8, _))
    ;   write('  [PULADO] n_queens/2 nao implementado'), nl
    ),
    
    % --------------------------------------------------------------------------
    % Exercício 06: subset_sum(L, Sum, SubL)
    % --------------------------------------------------------------------------
    nl, write('Ex 06 - subset_sum(L, Sum, SubL):'), nl,
    (safe_has_predicate(subset_sum/3) ->
        run_test('subset_sum([1, 2, 3], 0, []) - soma 0', subset_sum([1, 2, 3], 0, [])),
        run_test('subset_sum([1, 2, 2, 5, 3], 5, [1, 2, 2]) - subset no inicio', subset_sum([1, 2, 2, 5, 3], 5, [1, 2, 2])),
        run_test('subset_sum([1, 2, 2, 5, 3], 5, [5]) - subset elemento unico', subset_sum([1, 2, 2, 5, 3], 5, [5])),
        run_test('subset_sum([1, 2, 2, 5, 3], 5, [2, 3]) - subset distribuido', (
            findall(Subset, subset_sum([1, 2, 2, 5, 3], 5, Subset), Subsets),
            (member([2, 3], Subsets) ; member([3, 2], Subsets))
        )),
        run_test('subset_sum([1, 2], 5, _) - sem solucao deve falhar', \+ subset_sum([1, 2], 5, _)),
        run_test('subset_sum([10, -2, 4], 8, [10, -2]) - com numeros negativos', subset_sum([10, -2, 4], 8, [10, -2]))
    ;   write('  [PULADO] subset_sum/3 nao implementado'), nl
    ),
    nl.
