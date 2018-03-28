import std.exception, std.stdio, std.process;
auto soundPlayer(string nome){
  spawnProcess(["mpg123","-q",nome]);
}

void main(){
    string nome = "sounds/Themata.mp3";
    string damage = "sounds/damageSound.mp3";
    //soundPlayer(nome);
    writeln("Testando fluidez");
    soundPlayer(damage);
    writeln("fim");
}
