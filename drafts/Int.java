// Exercício 07: Crie uma classe Int com os seguintes membros:

public class Int{
    public static void main(String[] args){
        run_tests();
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
    public Int plus(Int i){ return this.plus(i.valor);};
    public Int plus(int y){ return new Int(this.valor + y); };

    // • e. methods de instância minus, times e div, semelhantes ao method plus
    // descrito acima. (O method div deve realizar divisão inteira, como o
    // operador / em valores int.)
    public Int minus(Int i){ return this.minus(i.valor);};
    public Int minus(int y){ return new Int(this.valor - y); };

    public Int times(Int i){ return this.times(i.valor);};
    public Int times(int y){ return new Int(this.valor * y); };

    public Int div(Int i){ return this.div(i.valor); };
    public Int div(int y){ return new Int( (int) (this.valor / y) ); };
    
    // • f. Um method de instância isPrime para que x.isPrime() retorne
    // verdadeiro se o valor de Int x for um número primo.
    public boolean isPrime(){
        if(this.valor < 2) return false;
        for(int i=2; i<this.valor; i++)
            if(this.valor%i == 0) return false;
        return true;
    };

    private static void run_tests(){
        // =========================
        // TESTES DO CONSTRUTOR
        // =========================
        Int a = new Int(10);
        Int b = new Int(5);
        assert a.toString().equals("10") 
            : "Construtor ou toString falhou";
        assert b.toString().equals("5") 
            : "Construtor ou toString falhou";

        // =========================
        // TESTES DO PLUS
        // =========================
        Int soma = a.plus(b);
        assert soma.toString().equals("15") 
            : "Erro no plus";
        assert a.toString().equals("10") 
            : "plus alterou o objeto original";
        assert b.toString().equals("5") 
            : "plus alterou o objeto original";

        // =========================
        // TESTES DO MINUS
        // =========================
        Int sub = a.minus(b);
        assert sub.toString().equals("5")
            : "Erro no minus";

        // =========================
        // TESTES DO TIMES
        // =========================
        Int mult = a.times(b);
        assert mult.toString().equals("50") 
            : "Erro no times";

        // =========================
        // TESTES DO DIV
        // =========================
        Int div = a.div(b);
        assert div.toString().equals("2") 
            : "Erro no div";

        // divisão inteira
        Int c = new Int(7);
        Int d = new Int(2);
        assert c.div(d).toString().equals("3") 
            : "Divisão inteira incorreta";

        // =========================
        // TESTES DE NÚMEROS NEGATIVOS
        // =========================
        Int negativo = new Int(-4);
        assert negativo.plus(new Int(2)).toString().equals("-2")
            : "Erro com números negativos";
        assert negativo.times(new Int(3)).toString().equals("-12")
            : "Erro na multiplicação com negativos";

        // =========================
        // TESTES DO isPrime
        // =========================
        assert new Int(2).isPrime()
            : "2 deveria ser primo";
        assert new Int(3).isPrime()
            : "3 deveria ser primo";
        assert new Int(5).isPrime()
            : "5 deveria ser primo";
        assert !new Int(4).isPrime()
            : "4 não deveria ser primo";
        assert !new Int(1).isPrime()
            : "1 não é primo";
        assert !new Int(0).isPrime()
            : "0 não é primo";
        assert !new Int(-7).isPrime()
            : "Números negativos não são primos";

        // =========================
        // TESTES ENCADEADOS
        // =========================
        Int resultado = new Int(10)
            .plus(new Int(5))
            .times(new Int(2))
            .minus(new Int(4));

        assert resultado.toString().equals("26")
            : "Erro em operações encadeadas";

        System.out.println("Todos os testes passaram!");
    }
}    

