% Importa o arquivo de soluções do aluno
:- [20].

% Declara como dinâmicos para permitir que o setup limpe e defina os fatos de teste
:- dynamic parent/2.
:- dynamic female/1.
:- dynamic male/1.

% ==============================================================================
% Cenário de Teste para o Exercício 1 (Relações de Parentesco)
% ==============================================================================
setup_parentesco :-
    retractall(parent(_, _)),
    retractall(female(_)),
    retractall(male(_)),
    % Definição de Gêneros
    assertz(male(abo)),
    assertz(male(cadu)),
    assertz(male(deco)),
    assertz(male(tio_joao)),
    assertz(male(primo_pedro)),
    assertz(female(aba)),
    assertz(female(beca)),
    assertz(female(deca)),
    assertz(female(sara)),
    assertz(female(tia_maria)),
    assertz(female(prima_julia)),
    % Definição de Parentesco (Árvore Genealógica)
    assertz(parent(abo, beca)),
    assertz(parent(aba, beca)),
    assertz(parent(beca, cadu)),
    assertz(parent(beca, sara)),       % sara é filha de beca (irmã de cadu)
    assertz(parent(cadu, deca)),      % deca é filha de cadu
    assertz(parent(cadu, deco)),      % deco é filho de cadu
    % Tios e Primos para o teste do firstCousin
    assertz(parent(abo, tio_joao)),   % tio_joao é irmão de beca
    assertz(parent(aba, tio_joao)),
    assertz(parent(tio_joao, prima_julia)), % prima_julia é prima de cadu
    assertz(parent(tio_joao, primo_pedro)).  % primo_pedro é primo de cadu

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
    nl, write('=== Executando Testes ==='), nl,
    setup_parentesco,
    
    write('Ex 01 - Relacoes de Parentesco:'), nl,
    % 1. mother/2
    run_test('a) mother/2 - beca mae de cadu', mother(beca, cadu)),
    run_test('a) mother/2 - aba mae de beca', mother(aba, beca)),
    run_test('a) mother/2 - abo nao e mae de beca (homem)', \+ mother(abo, beca)),
    run_test('a) mother/2 - cadu nao e mae de deca (homem)', \+ mother(cadu, deca)),
    run_test('a) mother/2 - deca nao e mae de deco (nao e genitora)', \+ mother(deca, deco)),
    run_test('a) mother/2 - beca nao e mae de si mesma', \+ mother(beca, beca)),
    
    % 2. father/2
    nl, run_test('b) father/2 - abo pai de beca', father(abo, beca)),
    run_test('b) father/2 - cadu pai de deca', father(cadu, deca)),
    run_test('b) father/2 - cadu pai de deco', father(cadu, deco)),
    run_test('b) father/2 - aba nao e pai de beca (mulher)', \+ father(aba, beca)),
    run_test('b) father/2 - beca nao e pai de cadu (mulher)', \+ father(beca, cadu)),
    run_test('b) father/2 - deco nao e pai de deca (nao e genitor)', \+ father(deco, deca)),
    
    % 3. sister/2
    nl, run_test('c) sister/2 - deca irma de deco', sister(deca, deco)),
    run_test('c) sister/2 - sara irma de cadu', sister(sara, cadu)),
    run_test('c) sister/2 - deco nao e irma de deca (homem)', \+ sister(deco, deca)),
    run_test('c) sister/2 - deca nao e irma de deca (si mesma)', \+ sister(deca, deca)),
    run_test('c) sister/2 - prima_julia nao e irma de cadu (primos)', \+ sister(prima_julia, cadu)),
    run_test('c) sister/2 - beca nao e irma de deca (mae/filha)', \+ sister(beca, deca)),
    
    % 4. grandson/2
    nl, (safe_has_predicate(grandson/2) ->
        run_test('d) grandson/2 - cadu neto de abo', grandson(cadu, abo)),
        run_test('d) grandson/2 - cadu neto de aba', grandson(cadu, aba)),
        run_test('d) grandson/2 - deco neto de beca', grandson(deco, beca)),
        run_test('d) grandson/2 - deca nao e neto (e neta/mulher)', \+ grandson(deca, abo)),
        run_test('d) grandson/2 - abo nao e neto de deca', \+ grandson(abo, deca)),
        run_test('d) grandson/2 - cadu nao e neto de si mesmo', \+ grandson(cadu, cadu))
    ;   write('  [PULADO] d) grandson/2 nao implementado'), nl
    ),
    
    % 5. firstCousin/2
    nl, (safe_has_predicate(firstCousin/2) ->
        run_test('e) firstCousin/2 - cadu e prima_julia', firstCousin(cadu, prima_julia)),
        run_test('e) firstCousin/2 - prima_julia e cadu (simetria)', firstCousin(prima_julia, cadu)),
        run_test('e) firstCousin/2 - sara e primo_pedro', firstCousin(sara, primo_pedro)),
        run_test('e) firstCousin/2 - cadu nao e primo de cadu (si mesmo)', \+ firstCousin(cadu, cadu)),
        run_test('e) firstCousin/2 - deca e deco nao sao primos (irmaos)', \+ firstCousin(deca, deco)),
        run_test('e) firstCousin/2 - cadu e deco nao sao primos (pai/filho)', \+ firstCousin(cadu, deco))
    ;   write('  [PULADO] e) firstCousin/2 nao implementado'), nl
    ),
    
    % 6. descendant/2
    nl, (safe_has_predicate(descendant/2) ->
        run_test('f) descendant/2 - beca descendente de abo (1 geracao)', descendant(beca, abo)),
        run_test('f) descendant/2 - cadu descendente de abo (2 geracoes)', descendant(cadu, abo)),
        run_test('f) descendant/2 - deca descendente de abo (3 geracoes)', descendant(deca, abo)),
        run_test('f) descendant/2 - abo nao e descendente de deca (ancestral)', \+ descendant(abo, deca)),
        run_test('f) descendant/2 - cadu nao e descendente de si mesmo', \+ descendant(cadu, cadu)),
        run_test('f) descendant/2 - prima_julia nao e descendente de beca', \+ descendant(prima_julia, beca))
    ;   write('  [PULADO] f) descendant/2 nao implementado'), nl
    ),

    % 7. third/2
    nl, write('Ex 02 - third/2 (terceiro elemento da lista):'), nl,
    (safe_has_predicate(third/2) ->
        run_test('third/2 - c e o terceiro em [a,b,c]', third([a, b, c], c)),
        run_test('third/2 - 3 e o terceiro em [1,2,3,4]', third([1, 2, 3, 4], 3)),
        run_test('third/2 - falha se o elemento nao for o terceiro', \+ third([a, b, x, d], c)),
        run_test('third/2 - falha para lista curta [a, b]', \+ third([a, b], _)),
        run_test('third/2 - falha para lista vazia []', \+ third([], _))
    ;   write('  [PULADO] third/2 nao implementado'), nl
    ),

    % 8. firstPair/1
    nl, write('Ex 03 - firstPair/1 (dois primeiros iguais):'), nl,
    (safe_has_predicate(firstPair/1) ->
        run_test('firstPair/1 - sucesso para [a, a]', firstPair([a, a])),
        run_test('firstPair/1 - sucesso para [1, 1, 2]', firstPair([1, 1, 2])),
        run_test('firstPair/1 - sucesso para [5, 5, 5, 5]', firstPair([5, 5, 5, 5])),
        run_test('firstPair/1 - falha para [a, b]', \+ firstPair([a, b])),
        run_test('firstPair/1 - falha para lista com 1 elemento [a]', \+ firstPair([a])),
        run_test('firstPair/1 - falha para lista vazia []', \+ firstPair([]))
    ;   write('  [PULADO] firstPair/1 nao implementado'), nl
    ),

    % 9. del3/2
    nl, write('Ex 04 - del3/2 (remove o terceiro elemento):'), nl,
    (safe_has_predicate(del3/2) ->
        run_test('del3/2 - remove c de [a,b,c]', del3([a, b, c], [a, b])),
        run_test('del3/2 - remove c de [a,b,c,d]', del3([a, b, c, d], [a, b, d])),
        run_test('del3/2 - remove 3 de [1,2,3,4,5]', del3([1, 2, 3, 4, 5], [1, 2, 4, 5])),
        run_test('del3/2 - falha para lista curta [a, b]', \+ del3([a, b], _)),
        run_test('del3/2 - falha para lista vazia []', \+ del3([], _))
    ;   write('  [PULADO] del3/2 nao implementado'), nl
    ),

    % 10. dupList/2
    nl, write('Ex 05 - dupList/2 (duplica cada elemento consecutivamente):'), nl,
    (safe_has_predicate(dupList/2) ->
        run_test('dupList/2 - duplicando []', dupList([], [])),
        run_test('dupList/2 - duplicando [a]', dupList([a], [a, a])),
        run_test('dupList/2 - duplicando [1, 2]', dupList([1, 2], [1, 1, 2, 2])),
        run_test('dupList/2 - duplicando [1, 3, 2]', dupList([1, 3, 2], [1, 1, 3, 3, 2, 2])),
        run_test('dupList/2 - sentido inverso para [1,1,2,2]', (dupList(X, [1, 1, 2, 2]), X == [1, 2])),
        run_test('dupList/2 - falha se a duplicacao for incorreta', \+ dupList([a], [a, b]))
    ;   write('  [PULADO] dupList/2 nao implementado'), nl
    ),

    % 11. oddSize/1
    nl, write('Ex 06 - oddSize/1 (lista com tamanho impar):'), nl,
    (safe_has_predicate(oddSize/1) ->
        run_test('oddSize/1 - tamanho 1 [a]', oddSize([a])),
        run_test('oddSize/1 - tamanho 3 [a, b, c]', oddSize([a, b, c])),
        run_test('oddSize/1 - tamanho 5 [1, 2, 3, 4, 5]', oddSize([1, 2, 3, 4, 5])),
        run_test('oddSize/1 - tamanho 0 [] deve falhar', \+ oddSize([])),
        run_test('oddSize/1 - tamanho 2 [a, b] deve falhar', \+ oddSize([a, b])),
        run_test('oddSize/1 - tamanho 4 [1, 2, 3, 4] deve falhar', \+ oddSize([1, 2, 3, 4]))
    ;   write('  [PULADO] oddSize/1 nao implementado'), nl
    ),

    % 12. evenSize/1
    nl, write('Ex 07 - evenSize/1 (lista com tamanho par):'), nl,
    (safe_has_predicate(evenSize/1) ->
        run_test('evenSize/1 - tamanho 0 []', evenSize([])),
        run_test('evenSize/1 - tamanho 2 [a, b]', evenSize([a, b])),
        run_test('evenSize/1 - tamanho 4 [1, 2, 3, 4]', evenSize([1, 2, 3, 4])),
        run_test('evenSize/1 - tamanho 1 [a] deve falhar', \+ evenSize([a])),
        run_test('evenSize/1 - tamanho 3 [a, b, c] deve falhar', \+ evenSize([a, b, c])),
        run_test('evenSize/1 - tamanho 5 [1, 2, 3, 4, 5] deve falhar', \+ evenSize([1, 2, 3, 4, 5]))
    ;   write('  [PULADO] evenSize/1 nao implementado'), nl
    ),
    nl.
