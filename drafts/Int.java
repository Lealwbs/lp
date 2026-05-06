// Exercício 07: Crie uma classe Int com os seguintes membros:

public class Int{

    public static void main(String[] args){
        System.out.println("Hello, Wolrd!");
    }

    // • a. Um campo para armazenar um valor int.
    private int valor;
    
    // • b. Um construtor para que new Int(x) crie um objeto Int que armazene o valor int x.
    public Int(int x){
        this.valor = x;
    }
    
    // • c. Um method de instância toString para que x.toString() retorne o
    // valor do objeto Int x em formato de String.
    public String toString(){
        return "" + this.valor;
    }
    
    // • d. Um method de instância plus para que x.plus(y) retorne um novo
    // objeto Int cujo valor é o valor de Int x mais o valor de Int y. Não deve
    // haver efeitos colaterais.
    public Int plus(int y){
        return new Int(this.valor + y);
    };
    
    // • e. methods de instância minus, times e div, semelhantes ao method plus
    // descrito acima. (O method div deve realizar divisão inteira, como o
    // operador / em valores int.)
    public Int minus(int y){
        return new Int(this.valor - y);
    };

    public Int times(int y){
        return new Int(this.valor * y);
    };

    public Int div(int y){
        return new Int( (int) (this.valor / y) );
    };
    
    // • f. Um method de instância isPrime para que x.isPrime() retorne
    // verdadeiro se o valor de Int x for um número primo.
    public boolean isPrime(int x){
        if(x < 2) return true;

        for(int i=2; i<x; i++)
            if(x%i == 0) return false;
        
        return true;
    };
}    

