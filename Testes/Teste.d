import std.stdio;
import std.string;
import std.conv;
import TesteLiby;


//Baseado em C e C++


void main(char[][] args){
	apenasprintar ini = new apenasprintar();
	
	string teste;


	
	teste = strip(stdin.readln());
	printf ("%s\n", &teste);




	if (teste == "oi"){
		printf("Oiiiiiiiiiiiiiiiiiiiiiiiiii");
	}

	ini.inicializar();
	ini.criarvetor();

}