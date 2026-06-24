// Exercícios baseados no capítulo 13 do livro Mordern Programming Languages.
// Instruções: A menos que o exercício indique o contrário, você deve implementar
// suas soluções em estilos imperativos e orientados a objetos. Teste suas soluções
// com uma classe Main.


public class IntList {
    
    private int[] list;

    public static void main(String[] args){
        run_tests();
    }
    
    public IntList(){ 
        this.list = null; 
    }

    public IntList(int[] list){ 
        this.list = list;  
    }

    public void print(){
        System.out.println(this.toStr());
    }

    public String toStr(){
        if(this.list == null) return "[]";
        String result = "[" + this.list[0];
        for(int i=1; i<this.list.length; i++)
            result += ", " + this.list[i]; 
    
        result += "]";
        return result;
    }

    public void add(int n){
        if(this.list == null){
            this.list = new int[]{n};
            return;
        }
    
        int[] new_list = new int[this.list.length+1];  
        for(int i=0; i < this.list.length; i++)
            new_list[i] = this.list[i];
        new_list[new_list.length - 1] = n;
        this.list = new_list;
    }
    
    // Exercício 01: Adicione um method de instância contains à classe IntList,
    // para que x.contains(n) retorne verdadeiro se o valor int n ocorrer em
    // IntList x e retorne falso caso contrário.
    public boolean contains(int n){
        if(this.list == null) 
            return false;
        
        for(int i=0; i<this.list.length; i++)
            if(this.list[i] == n) 
                return true;
        
        return false;
    }

    // Exercício 02: Adicione um method de instância equals à classe IntList, para
    // que x.equals(y) retorne verdadeiro se IntList x e IntList y tiverem
    // exatamente os mesmos inteiros na mesma ordem, e retorne falso caso contrário.
    // Deve ser verdade que x.equals(y) seja sempre equivalente a y.equals(x).
    // Também deve ser verdade que se x == y então x.equals(y), embora o inverso
    // não seja necessariamente verdadeiro.
    public boolean equals(IntList other){
        if(this.list == null && other.list == null) 
            return true;
        
        if(this.list.length != other.list.length) 
            return false;

        for(int i=0; i<this.list.length; i++)
            if(this.list[i] != other.list[i]) 
                return false;
        
        return true;
    }

    // Exercício 03: Adicione um method de instância append à classe IntList, para
    // que x.append(y) retorne uma IntList que é igual à IntList x seguida
    // pela IntList y. Não deve haver efeito colateral em x ou y. (Dica: Você precisará
    // fazer uma cópia de x.)
    public IntList append(IntList other){
        if(this.list == null)
            return new IntList(other.list);

        if(other.list == null)
            return new IntList(this.list);
        
        int[] new_list = new int[this.list.length + other.list.length];

        for(int i=0; i < this.list.length; i++)
            new_list[i] = this.list[i];

        for(int i=0; i < other.list.length; i++)
            new_list[this.list.length + i] = other.list[i];
        
        return new IntList(new_list);
    }

    // Exercício 04: Adicione um method de instância reverse à classe IntList, para
    // que x.reverse() retorne uma IntList que é o reverso da IntList x. Não
    // deve haver efeito colateral em x.
    public IntList reverse(){
        if(this.list == null || this.list.length < 1) return this;
        
        IntList result = new IntList(new int[this.list.length]);

        for(int i=0; i<this.list.length; i++)
            result.list[this.list.length - 1 - i] = this.list[i];

        return result;
    }

    // Exercício 05: Adicione um method de instância reverseMe à classe IntList,
    // para que x.reverseMe() não retorne valor, mas tenha o efeito colateral de
    // reverter o conteúdo de x. (Isso é mais fácil se você começar fazendo uma cópia
    // invertida de x.)
    public void reverseMe(){
        if(this.list == null) return;

        IntList reversed = this.reverse();

        for(int i=0; i<this.list.length; i++)
            this.list[i] = reversed.list[i];
    }

    // Exercício 06: Adicione um method de instância sort à classe IntList, para
    // que x.sort() retorne uma IntList que é uma versão de IntList x, ordenada
    // em ordem não decrescente. Você pode usar qualquer algoritmo de ordenação que
    // preferir. Não deve haver efeito colateral em x.
    public IntList sort(){
        if(this.list == null || this.list.length == 1) 
            return new IntList(new int[0]);
        
        IntList sorted = new IntList(new int[this.list.length]);

        for(int i=0; i<this.list.length; i++){
            sorted.list[i] = this.list[i];
        }

        int size = sorted.list.length;
        
        for(int i=0; i<size; i++){
            int pos = i, min = sorted.list[i];
            for(int j=i; j<size; j++)
                if(sorted.list[j] < min){
                    min = sorted.list[j];
                    pos = j;
                }
            int tmp = sorted.list[i];
            sorted.list[i] = min;
            sorted.list[pos] = tmp;
        }         

        return sorted;
    }

    private static void run_tests(){
        // =========================
        // CRIAÇÃO DAS LISTAS
        // =========================
        IntList lista1 = new IntList();
        lista1.add(1);
        lista1.add(2);
        lista1.add(3);
        
        IntList lista2 = new IntList();
        lista2.add(1);
        lista2.add(2);
        lista2.add(3);
        
        IntList lista3 = new IntList();
        lista3.add(3);
        lista3.add(2);
        lista3.add(1);
        
        IntList lista4 = new IntList();
        lista4.add(4);
        lista4.add(5);
        
        assert lista1.toStr().equals("[1, 2, 3]")
            : "add nao esta funcionando";

        assert lista2.toStr().equals("[1, 2, 3]")
            : "add nao esta funcionando";

        assert lista3.toStr().equals("[3, 2, 1]")
            : "add nao esta funcionando";

        assert lista4.toStr().equals("[4, 5]")
            : "add nao esta funcionando";

        IntList listaVazia = new IntList();

        // =========================
        // TESTES DO CONTAINS
        // =========================
        assert lista1.contains(1)
                : "contains falhou para elemento existente";
        assert lista1.contains(3)
                : "contains falhou para último elemento";
        assert !lista1.contains(10)
                : "contains falhou para elemento inexistente";
        assert !listaVazia.contains(1)
                : "contains falhou para lista vazia";

        // =========================
        // TESTES DO EQUALS
        // =========================
        assert lista1.equals(lista2)
                : "equals falhou para listas iguais";
        assert lista2.equals(lista1)
                : "equals não é simétrico";
        assert !lista1.equals(lista3)
                : "equals falhou para listas diferentes";
        assert lista1.equals(lista1)
                : "equals falhou para mesma referência";
        assert listaVazia.equals(new IntList())
                : "equals falhou para listas vazias";

        // =========================
        // TESTES DO APPEND
        // =========================
        IntList append = lista1.append(lista4);
        assert append.toStr().equals("[1, 2, 3, 4, 5]")
                : "append falhou";
        // verifica ausência de efeito colateral
        assert lista1.toStr().equals("[1, 2, 3]")
                : "append alterou lista1";
        assert lista4.toStr().equals("[4, 5]")
                : "append alterou lista4";


        // append com lista vazia
        IntList appendVazio = lista1.append(listaVazia);
        assert appendVazio.toStr().equals("[1, 2, 3]")
                : "append com lista vazia falhou";

        // =========================
        // TESTES DO REVERSE
        // =========================
        IntList reversa = lista1.reverse();
        assert reversa.toStr().equals("[3, 2, 1]")
                : "reverse falhou";
        // sem efeito colateral
        assert lista1.toStr().equals("[1, 2, 3]")
                : "reverse alterou lista original";
        // reverse de lista vazia
        assert listaVazia.reverse().toStr().equals("[]")
                : "reverse falhou para lista vazia";

        // =========================
        // TESTES DO REVERSEME
        // =========================
        lista1.reverseMe();
        assert lista1.toStr().equals("[3, 2, 1]")
                : "reverseMe falhou";
        // reversão novamente
        lista1.reverseMe();
        assert lista1.toStr().equals("[1, 2, 3]")
                : "reverseMe falhou na segunda reversão";

        // =========================
        // TESTES DO SORT
        // =========================
        IntList desordenada = new IntList();
        desordenada.add(5);
        desordenada.add(1);
        desordenada.add(4);
        desordenada.add(2);
        desordenada.add(3);

        IntList ordenada = desordenada.sort();
        assert ordenada.toStr().equals("[1, 2, 3, 4, 5]")
                : "sort falhou";
        // sem efeito colateral
        assert desordenada.toStr().equals("[5, 1, 4, 2, 3]")
                : "sort alterou lista original";
        // sort já ordenada
        assert lista1.sort().toStr().equals("[1, 2, 3]")
                : "sort falhou para lista já ordenada";
        // sort com repetidos
        IntList repetidos = new IntList();
        repetidos.add(3);
        repetidos.add(1);
        repetidos.add(3);
        repetidos.add(2);
        assert repetidos.sort().toStr().equals("[1, 2, 3, 3]")
                : "sort falhou com repetidos";

        // =========================
        // TESTES ENCADEADOS
        // =========================
        IntList resultado = lista1
                .append(lista4)
                .reverse()
                .sort();
        assert resultado.toStr().equals("[1, 2, 3, 4, 5]")
                : "Operações encadeadas falharam";

        System.out.println("Todos os testes passaram!");
    }
}