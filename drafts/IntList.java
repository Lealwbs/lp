// Exercícios baseados no capítulo 13 do livro Mordern Programming Languages.
// Instruções: A menos que o exercício indique o contrário, você deve implementar
// suas soluções em estilos imperativos e orientados a objetos. Teste suas soluções
// com uma classe Main.


public class IntList {
    
    public int[] list;

    public static void main(String[] args){
        System.out.println("Hello, Wolrd!");

        int[] tmp1 = {4, 2, 1, 3};
        int[] tmp2 = {7, 5, 6};
        IntList lista1 = new IntList(tmp1);
        IntList lista2 = new IntList(tmp2);
        // System.out.println( lista1.contains(2) );
        // System.out.println( lista1.equals(lista2) );
        IntList lista3 = lista1.append(lista2);
        // lista3.print();

        IntList lista4 = lista3.reverse();
        // lista4.print();
        
        // lista4.reverseMe();
        // lista4.print();

        lista4.print();
        IntList lista5 = lista4.sort();
        lista5.print();
    }
    
    public IntList(int[] list){
        this.list = list;
    }

    public void print(){
        for(int i=0; i<this.list.length; i++)
            System.out.print( this.list[i] + " " );
        System.out.println();
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
        IntList result = new IntList(new int[this.list.length]);

        if(this.list == null) return result;

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
        
        IntList sorted = new IntList(this.list);

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
}