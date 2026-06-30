% Importa o arquivo de soluções do aluno
:- [test03].

% Função genérica para rodar um teste e imprimir o resultado de forma limpa
run_test(Name, Goal) :-
    (   catch(Goal, Error, (write('  [ERRO] '), write(Name), write(': '), write(Error), nl, fail))
    ->  write('  [OK] '), write(Name), nl
    ;   write('  [FALHOU] '), write(Name), nl
    ).

% Verifica se o predicado foi implementado/existe
safe_has_predicate(Functor/Arity) :-
    current_predicate(Functor/Arity).

% Executa todos os testes da Prova 3
run_tests :-
    nl, write('=== Executando Testes da Prova 3 ==='), nl,
    
    % --------------------------------------------------------------------------
    % Questão 01: is_triple(A, B, C)
    % --------------------------------------------------------------------------
    write('Questao 01 - is_triple(A, B, C):'), nl,
    (safe_has_predicate(is_triple/3) ->
        run_test('is_triple(3, 4, 5) - tripla pitagorica classica', is_triple(3, 4, 5)),
        run_test('is_triple(6, 8, 10) - multiplo da classica', is_triple(6, 8, 10)),
        run_test('is_triple(5, 12, 13) - outra tripla valida', is_triple(5, 12, 13)),
        run_test('is_triple(8, 15, 17) - tripla com valores maiores', is_triple(8, 15, 17)),
        run_test('is_triple(1, 2, 3) - nao e tripla (deve falhar)', \+ is_triple(1, 2, 3)),
        run_test('is_triple(3, 4, 6) - nao e tripla (deve falhar)', \+ is_triple(3, 4, 6))
    ;   write('  [PULADO] is_triple/3 nao implementado'), nl
    ),
    
    % --------------------------------------------------------------------------
    % Questão 02: solve_triple(A, B, C)
    % --------------------------------------------------------------------------
    nl, write('Questao 02 - solve_triple(A, B, C):'), nl,
    (safe_has_predicate(solve_triple/3) ->
        run_test('solve_triple(3, 4, 5) - solucao valida dentro do limite [1..10]', solve_triple(3, 4, 5)),
        run_test('solve_triple(6, 8, 10) - solucao limite (C = 10)', solve_triple(6, 8, 10)),
        run_test('solve_triple(5, 12, 13) - deve falhar (fora do limite [1..10])', \+ solve_triple(5, 12, 13)),
        run_test('solve_triple(1, 2, 3) - deve falhar (nao e tripla)', \+ solve_triple(1, 2, 3)),
        run_test('solve_triple - encontra exatamente 4 triplas no intervalo 1 a 10', (
            findall(t(A,B,C), solve_triple(A,B,C), Triplas),
            length(Triplas, 4),
            member(t(3,4,5), Triplas),
            member(t(4,3,5), Triplas),
            member(t(6,8,10), Triplas),
            member(t(8,6,10), Triplas)
        ))
    ;   write('  [PULADO] solve_triple/3 nao implementado'), nl
    ),
    
    % --------------------------------------------------------------------------
    % Questão 04: evall/3 (Avaliação de Exponenciação base**exp)
    % --------------------------------------------------------------------------
    nl, write('Questao 04 - evall/3 (Exponenciacao):'), nl,
    (safe_has_predicate(evall/3) ->
        % Teste 1: Base de exponenciação simples (3**2)
        run_test('evall - 3**2 deve ser 9', (
            (evall(pow(var(x), const(2)), [bind(x, 3)], R) ; evall(pow(x, const(2)), [bind(x, 3)], R)),
            R =:= 9
        )),
        
        % Teste 2: Exponente como uma expressão (2**(1+2))
        run_test('evall - 2**(1+2) deve ser 8', (
            (evall(pow(var(y), plus(const(1), const(2))), [bind(y, 2)], R) ; evall(pow(y, plus(const(1), const(2))), [bind(y, 2)], R)),
            R =:= 8
        )),
        
        % Teste 3: Exponenciação com base negativa ((-2)**3)
        run_test('evall - (-2)**3 deve ser -8', (
            (evall(pow(var(z), const(3)), [bind(z, -2)], R) ; evall(pow(z, const(3)), [bind(z, -2)], R)),
            R =:= -8
        )),
        
        % Teste 4: Exponenciação encadeada (2**(2**2) = 16)
        run_test('evall - 2**(2**2) deve ser 16', (
            (
                evall(pow(var(x), pow(var(x), const(2))), [bind(x, 2)], R)
            ; 
                evall(pow(x, pow(x, const(2))), [bind(x, 2)], R)
            ),
            R =:= 16
        )),
        
        % Teste 5: Deve falhar se a variável base não estiver no contexto
        run_test('evall - falha se a variavel base nao existir no contexto', (
            \+ evall(pow(var(w), const(2)), [bind(x, 3)], _),
            \+ evall(pow(w, const(2)), [bind(x, 3)], _)
        ))
    ;   write('  [PULADO] evall/3 nao implementado'), nl
    ),
    nl.
