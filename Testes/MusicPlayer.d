auto soundPlayer(string nome){
  import std.exception, std.stdio, std.process;
  spawnProcess(["mpg123",nome]);
}

void main(){
    string nome = "sounds/Themata.mp3";
    soundPlayer(nome);
}
