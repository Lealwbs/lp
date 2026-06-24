(* datatype 'coisas punhado = Um of 'coisas | Varios of 'coisas list;


fun tamanho (Um _) = 1
  | tamanho (Varios l) = length l;

(* tamanho (Um 1);
tamanho (Um "haha");
tamanho (Varios [1,2,3,4,5,6]);
tamanho (Varios ["a", "b", "c"]);
tamanho (Um [1,2,3,4,5]);  *)

datatype 'a myList = NIL | || of 'a * 'a myList;
infixr 5 ||; *)



(* Exercício 01. Escreva uma definição de tipo datatype para um tipo naipe cujos
valores são os quatro naipes de um baralho de cartas. *)

val _ = print "\nExercicio 1 \n";
datatype naipe = paus | copas | espadas | ouros; 

(* Exercício 02. Usando sua definição do Exercício 01, escreva uma função
nome_naipe do tipo naipe -> string que retorna uma string dando o nome
de um naipe. *)

val _ = print "\nExercicio 2 \n";
fun nome_naipe (n: naipe) = case n of
  paus => "paus" |
  copas => "copas" |
  espadas => "espadas" |
  ouros => "ouros";

nome_naipe(paus);

(* Exercício 03. Escreva uma definição de tipo datatype para um tipo number
cujos valores sejam inteiros ou números reais. *)

val _ = print "\nExercicio 3 \n";
datatype number = i of int | r of real;

(* Exercício 04. Usando sua definição do Exercício 03, escreva uma função plus
do tipo number -> number -> number que soma dois números, convertendo
int para real somente se necessário. *)

val _ = print "\nExercicio 4 \n";
fun plus a b = case (a, b) of
  (i x, i y) => i (x + y) |
  (i x, r y) => r (real(x) + y) |
  (r x, i y) => r (x + real(y)) |
  (r x, r y) => r (x + y);

val a = i 2;
val b = r 3.0;
plus a b;

(* Exercício 05. Escreva uma função addup do tipo intnest -> int que soma
todos os inteiros em uma lista de intnest. Use esta definição para intnest:
datatype intnest = INT of int | LIST of intnest list;
(Tome cuidado ao digitar: INT não é o mesmo que int!) *)

val _ = print "\nExercicio 5 \n";
datatype intnest = INT of int | LIST of intnest list;
fun addup (INT x) = x
  | addup (LIST l) = foldl (fn (x, acc) => addup x + acc) 0 l;

(* Exercício 06. Escreva uma função prod do tipo int mylist -> int que recebe
uma lista int mylist e retorna o produto de todos os elementos da lista. Se a
lista for NIL, sua função deve retornar 1. Aqui está a definição de mylist:
datatype 'el mylist = NIL | CONS of 'el * 'el mylist; *)

val _ = print "\nExercicio 6 \n";
datatype 'el mylist = NIL | CONS of 'el * 'el mylist;
fun prod NIL = 1
  | prod (CONS (x, xs)) = x * prod xs;

(* Exercício 07. Escreva uma função reverse do tipo 'a mylist -> 'a mylist
que recebe uma lista mylist e retorna uma lista mylist com todos os elementos
em ordem inversa. (Use a definição de mylist do Exercício 06). *)

val _ = print "\nExercicio 7 \n";
fun reverse lst =
  let
    fun rev_helper (NIL, acc) = acc
      | rev_helper (CONS (x, xs), acc) = rev_helper (xs, CONS (x, acc))
  in
    rev_helper (lst, NIL)
  end;

(* Exercício 08. Escreva uma função append do tipo 'a mylist -> 'a mylist
-> 'a mylist que recebe duas listas mylist, a e b, e retorna uma lista mylist
contendo todos os elementos de a seguidos por todos os elementos de b. (Use a
definição de mylist do Exercício 06). *)

val _ = print "\nExercicio 8 \n";
fun append a b =
  let
    fun append_helper (NIL, acc) = acc
      | append_helper (CONS (x, xs), acc) = append_helper (xs, CONS (x, acc))
  in
    append_helper (reverse a, b)
  end;

(* Exercício 09. Escreva uma função appendall do tipo 'a list tree -> 'a
list que recebe uma árvore de listas e retorna o resultado de concatenar todas
as listas. Coloque a lista de um nó nesta ordem: primeiro o conteúdo da subárvore
esquerda, depois a lista no nó e, finalmente, o conteúdo da subárvore direita. Aqui
está a definição de tree:
datatype 'data tree = Empty | Node of 'data tree * 'data * 'data tree; *)

val _ = print "\nExercicio 9 \n";
datatype 'data tree = Empty | Node of 'data tree * 'data * 'data tree;
fun appendall Empty = []
  | appendall (Node (left, lst, right)) = appendall left @ lst @ appendall right;

(* Exercício 10. Uma árvore binária completa é aquela em que cada Node tem dois
filhos Empty ou dois filhos Node, mas não um de cada. Escreva uma função
complete do tipo 'a tree -> bool que verifica se uma árvore é completa. (Use
a definição de tree do Exercício 09) *)

val _ = print "\nExercicio 10 \n";
fun complete Empty = true
  | complete (Node (Empty, _, Empty)) = true
  | complete (Node (left, _, right)) = 
      case (left, right) of
        (Empty, Empty) => true
      | (Empty, Node _) => false
      | (Node _, Empty) => false
      | (Node _, Node _) => complete left andalso complete right;