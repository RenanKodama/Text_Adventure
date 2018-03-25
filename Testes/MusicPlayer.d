auto soundPlayer(string nome){
  import std.exception, std.stdio, std.process;
  string comando = "mpg123 "~nome;
  writeln("O Comando é: ",comando);
  auto result = ["mpg123"].execute;
  writeln(spawnProcess("mpg123 Themata.mp3"));

  enforce(result.status == 0);
  result.output.write;
}

void main(){
    string nome = "sounds/Themata.mp3";
    soundPlayer(nome);
}
