import std.stdio,std.file;

auto criaArquivo(string nome){
  File arquivo = File(nome,"w");
}

auto escrevendoArquivo(string nome){
  File arquivo = File(nome,"r+");
  arquivo.writeln("Escrevendo no arquivo, isso parece Python");
  arquivo.close();
}

string lendoDoArquivo(string nome){
  File arquivo = File(nome, "r+");
  return arquivo.readln();
}
// CRIANDO CLASSES
class Objeto{
  public:
    int id;
    string nome;
    string descricao;
}
class Cena{
  public:
    int id;
    int numero;
    string descricao;
    Objeto[] objetos;
}
//FIM


void main(){
  writeln("Testando entrada/Saída em arquivos");

  string nome = "arquivo.txt";
  writeln("Criando Arquivo...");
  
  criaArquivo(nome);
  writeln("Escrevendo no arquivo...");
  
  escrevendoArquivo(nome);
  string doArquivo =  lendoDoArquivo(nome);
  writeln("Isso estava escrito no arquivo >> ",doArquivo );
  //OBJETOS
  Objeto ob = new Objeto();
  ob.id=1;
  ob.nome = "Cadeira";
  ob.descricao = "Uma fucking cadeira";
  writeln(ob.nome);
  Cena cena1 = new Cena();
  cena1.id = 0;
  cena1.numero=2;
  cena1.descricao = "não sei nao";
  cena1.objetos[] = ob;
  writeln(cena1.objetos[]);
}
