(* Exercício 01. Escreva uma função i12rl do tipo int list -> real list 
que  receba  uma  lista  de  inteiros  e  retorne  uma  lista  dos  mesmos  números 
convertidos para o tipo real. Por exemplo, se você avaliar i12rl [1, 2, 3] 
você deve obter [1.0, 2.0, 3.0].  *)

val _ = print "\nExercicio 1 \n";
fun i12rl l = map (fn x => real x) l;
i12rl [1, 2, 3];

(* Exercício 02. Escreva uma função ordlist do tipo char list -> int list 
que receba uma lista de caracteres e retorne a lista dos códigos inteiros desses 
caracteres. Por exemplo, se você avaliar ordlist ['A', 'B', 'C'] você deve 
obter [65, 66, 67].  *)

val _ = print "\nExercicio 2 \n";
fun ordlist l = map (fn x => ord x) l;
ordlist [#"A", #"B", #"C"];

(* Exercício 03. Escreva uma função squarelist do tipo int list -> int 
list  que receba uma lista de inteiros e retorne a lista dos quadrados desses 
inteiros. Por exemplo, se você avaliar squarelist [1, 2, 3, 4] você deve 
obter [1, 4, 9, 16].  *)

val _ = print "\nExercicio 3 \n";
fun squarelist l = map (fn x => x*x) l;
squarelist [1, 2, 3, 4];

(* Exercício 04. Escreva uma função multpairs do tipo (int * int) list -
> int list que receba uma lista de pares de inteiros e retorne uma lista com 
os produtos de cada par. Por exemplo, se a entrada for [(1, 2), (3, 4)], sua 
função deve retornar [2, 12].  *)

val _ = print "\nExercicio 4 \n";
fun multpairs l = map (fn (a, b) => a * b) l; 
multpairs [(1, 2), (3, 4)];

(* Exercício 05. Escreva uma função inclist do tipo int list -> int -> int 
list que receba uma lista de inteiros e um incremento inteiro, e retorne a mesma 
lista de inteiros, mas com o incremento adicionado a cada um. Por exemplo, se 
você avaliar inclist [1, 2, 3, 4] 10 você deve obter [11, 12, 13, 14]. 
Note que a função é curryficada.  *)

val _ = print "\nExercicio 5 \n";
fun inclist l i = map (fn x => x + i) l;
inclist [1, 2, 3, 4] 10;

(* Exercício 06. Escreva uma função sqsum do tipo int list -> int que receba 
uma lista de inteiros e retorne a soma dos quadrados desses inteiros. Por exemplo, 
se você avaliar sqsum [1, 2, 3, 4] você deve obter 30.  *)

val _ = print "\nExercicio 6 \n";
fun sqsum l = foldl (fn (x, acc) => x*x + acc) 0 l;
sqsum [1, 2, 3, 4];

(* Exercício 07. Escreva uma função bor do tipo bool list -> bool que receba 
uma lista de valores booleanos e retorne o OU lógico de todos eles. Se a lista 
estiver vazia, sua função deve retornar false.  *)

val _ = print "\nExercicio 7 \n";
fun bor l  = foldl (fn (x, acc) => acc orelse x ) false l; 
bor [];
bor [false, false, false];
bor [false, false, true, false];

(* Exercício 08. Escreva uma função band do tipo bool list -> bool que receba 
uma lista de valores booleanos e retorne o E lógico de todos eles. Se a lista estiver 
vazia, sua função deve retornar true.  *)

val _ = print "\nExercicio 8 \n";
fun band l  = foldl (fn (x, acc) => acc andalso x) true l;
band [];
band [true, true, true];
band [false, false, true, false];

(* Exercício 09. Escreva uma função bxor do tipo bool list -> bool que receba 
uma lista de valores booleanos e retorne o OU exclusivo (XOR) de todos eles. 
(Deve retornar true se o número de valores true na lista for ímpar e false se 
for par). Se a lista estiver vazia, sua função deve retornar false.  *)

val _ = print "\nExercicio 9 \n";
fun bxor l  = foldl (fn (x, acc) => x <> acc ) false l;
bxor [];
bxor [true, true, true];
bxor [false, true, true, false];

(* Exercício 10. Escreva uma função dupList do tipo 'a list -> 'a list cuja 
lista de saída é a mesma que a lista de entrada, mas com cada elemento da lista 
de entrada repetido duas vezes consecutivas. Por exemplo, se a lista de entrada 
for [1, 3, 2], a lista de saída deve ser [1, 1, 3, 3, 2, 2].  *)

val _ = print "\nExercicio 10 \n";
fun dupList l  = foldr (fn (x, acc) => x :: (x :: acc)) [] l;
dupList [1, 3, 2];

(* Exercício 11. Escreva uma função mylength do tipo 'a list -> int que 
retorne o comprimento de uma lista. (Claro, você não pode usar a função length 
predefinida para isso).  *)

val _ = print "\nExercicio 11 \n";
fun mylength l = foldr (fn (x, acc) => acc + 1) 0 l;
mylength [];
mylength [9, 5, 1];
mylength [0, 1, 1, 2, 3, 5, 8, 13];

(* Exercício 12. Escreva uma função absreal do tipo int list -> real list 
que receba uma lista de inteiros e retorne uma lista contendo os valores absolutos 
desses inteiros, convertidos para números reais.  *)
 
val _ = print "\nExercicio 12 \n";
fun absreal l = foldr (fn (x, acc) => real (abs x) :: acc) [] l;
absreal [0, ~1, 1, 2, ~3, 5, ~8, 13];

(* Exercício 13. Escreva uma função truecount do tipo bool list -> int que 
receba uma lista de valores booleanos e retorne o número de true na lista.  *)

val _ = print "\nExercicio 13 \n";
fun truecount l = foldl (fn (x, acc) => if x then acc + 1 else acc) 0 l;
truecount [];
truecount [true, true, true];
truecount [false, false, true, false, true];

(* Exercício 14. Escreva uma função maxpairs do tipo (int * int) list -> 
int list que receba uma lista de pares de inteiros e retorne a lista dos maiores 
elementos de cada par. Por exemplo, se você avaliar maxpairs [(1, 3), (4, 
2), (-3, -4)] você deve obter [3, 4, -3].  *)

val _ = print "\nExercicio 14 \n";
fun maxpairs l = foldr (fn ((a, b), acc) => (if a > b then a else b) :: acc) [] l;
maxpairs [(1, 3), (4, 2), (~3, ~4)];

(* Exercício 15. Escreva uma função myimplode que funcione exatamente como a 
função predefinida implode. Em outras palavras, deve ser uma função do tipo 
char list -> string que receba uma lista de caracteres e retorne a string 
contendo esses mesmos caracteres na mesma ordem.  *)

val _ = print "\nExercicio 15 \n";
fun myimplode l = foldr (fn (x, acc) => str(x) ^ acc) "" l;
myimplode [#"H", #"e", #"l", #"l", #"o"];

(* Exercício 16. Escreva uma função concat do tipo 'a list list -> 'a list 
que  receba  uma  lista  de  listas  como  entrada  e  retorne  a  lista  formada  pela 
concatenação das listas de entrada em ordem. Por exemplo, se a entrada for [[1, 
2], [3, 4, 5, 6], [7]], sua função deve retornar [1, 2, 3, 4, 5, 6, 
7]. (Há uma função predefinida semelhante chamada concat, que, claro, você não 
deve usar).  *)

val _ = print "\nExercicio 16 \n";
fun concat l = foldr (fn (x, acc) => x @ acc ) [] l;
concat [[1, 2], [3, 4, 5, 6], [7]];

(* Exercício 17. Escreva uma função max do tipo int list -> int que retorne o 
maior elemento de uma lista de inteiros. Sua função não precisa tratar o caso da 
lista estiver vazia.  *)

val _ = print "\nExercicio 17 \n";
fun max [] = raise Fail "List with no elements!"
  | max l  = foldl (fn (x, acc) => if (x > acc) then x else acc) (hd l) (tl l);
max [] handle Fail _ => ~1;
max [~5, ~2, 0, 3, 9];

(* Exercício 18. Escreva uma função min do tipo int list -> int que retorne o 
menor elemento de uma lista de inteiros. Sua função não precisa tratar o caso da 
lista estiver vazia.  *)

val _ = print "\nExercicio 18 \n";
fun min l = foldl (fn (x, acc) => if (x < acc) then x else acc) (hd l) (tl l);
min [~2, ~5, 0, 3, ~9];

(* Exercício 19. Escreva uma função member do tipo 'a * 'a list -> bool para
que member (e, L) seja true se e somente se e for um elemento da lista L.  *)

val _ = print "\nExercicio 19 \n";
fun member (e, l) = foldl (fn (x, acc) => x = e orelse acc) false l;
member(0, [~2, ~5, 0, 3, ~9]);
member(4, [~2, ~5, 0, 3, ~9]);

(* Exercício 20. Escreva uma função append do tipo 'a list -> 'a list -> 
'a list que receba duas listas e retorne o resultado de anexar a segunda no 
final da primeira. Por exemplo, append [1, 2, 3] [4, 5, 6] deve avaliar 
para [1, 2, 3, 4, 5, 6]. Não use utilitários predefinidos de concatenação, 
como o operador @ ou a função concat. Note que a função é curryficada.  *)
 
val _ = print "\nExercicio 20 \n";
fun append l g = foldr (fn (x, acc) => x :: acc) g l;
append [1, 2, 3] [4, 5, 6];

(* Exercício 21. Defina uma função less do tipo int * int list -> int list 
para que (e, L) seja uma lista de todos os inteiros em L que são menores que e 
(em qualquer ordem).  *)

val _ = print "\nExercicio 21 \n";
fun less (e, l) = foldr (fn (x, acc) => if x < e then x :: acc else acc) [] l;
less(0, [3, ~5, 0, ~2, ~9, 1]);

(* Exercício 22. Escreva uma função evens do tipo int list -> int list que 
receba uma lista de inteiros e retorne a lista de todos os elementos pares da lista 
original (na ordem original). Por exemplo, se você avaliar evens [1, 2, 3, 
4], você deve obter [2, 4].  *)

val _ = print "\nExercicio 22 \n";
fun evens l = foldr (fn (x, acc) => if x mod 2 = 0 then x :: acc else acc) [] l;
evens [1, 2, 3, 4];

(* Exercício 23. Escreva uma função convert do tipo ('a * 'b) list -> 'a 
list  *  'b  list  que  converta  uma  lista  de  pares  em  um  par  de  listas, 
preservando a ordem dos elementos. Por exemplo, convert [(1, 2), (3, 4), (5, 6)] 
deve avaliar para ([1, 3, 5], [2, 4, 6]).  *)

val _ = print "\nExercicio 23 \n";
fun convert l = foldr (fn ((a, b), (x, y)) => (a :: x, b :: y) ) ([], []) l;
convert [(1, 2), (3, 4), (5, 6)];

(* Exercício 24. Defina uma função mymap com o mesmo tipo e comportamento de 
map, mas sem usar map. (Note que ainda deve ser uma função de uma linha: use 
foldl ou foldr).  *)

val _ = print "\nExercicio 24 \n";
fun mymap f l = foldr (fn (x, acc) => f(x) :: acc) [] l;
mymap (fn x => x*x) [1, 2, 3, 4];

(* Exercício 25. Represente um polinômio usando uma lista de seus coeficientes 
(reais),  começando  com  o  coeficiente  constante  e  indo  apenas  até  onde  for 
necessário. Por exemplo, 3x²+5x+1 seria representado como a lista [1.0, 
5.0, 3.0] e x³−2x como [0.0, -2.0, 0.0, 1.0]. Escreva uma função 
eval do tipo real  list  ->  real  ->  real  que receba um polinômio 
representado desta forma e um valor para x e retorne o valor desse polinômio. 
Por exemplo eval [1.0, 5.0, 3.0] 2.0 deve avaliar para 23.0, pois quando 
x=2, 3x²+5x+1=23.  *)

val _ = print "\nExercicio 25 \n";
fun eval l n = foldr (fn (x, acc) => x + n * acc ) 0.0 l; 
eval [1.0, 5.0, 3.0] 2.0;
