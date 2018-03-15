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

void main(){
  writeln("Testando entrada/Saída em arquivos");
  string nome = "arquivo.txt";
  writeln("Criando Arquivo...");
  criaArquivo(nome);
  writeln("Escrevendo no arquivo...");
  escrevendoArquivo(nome);
  string doArquivo =  lendoDoArquivo(nome);
  writeln("Isso estava escrito no arquivo >> ",doArquivo );
}
