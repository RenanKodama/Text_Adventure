import std.stdio;
import std.string;
import std.conv;

//Baseado em C e C++
class apenasprintar
{
	string saudacao = "Ola Mundo, VIVA O LINUX!";
	int ano = 2018;
	float horas = 1.59;
	float horasT = 2.32;

	void inicializar()
	{
		writefln(saudacao);
		writefln(to!string(ano));
		writefln(to!string(horas));
		writefln("%s",horasT);				
	}

	void criarvetor()
	{
		int[5] vetor;

		for (int j=0;j<5;j++){
			vetor[j] = j;
		}
		this.verVetor(vetor);
	}

	void verVetor(int[] vetor){
		for(int i=0;i<vetor.length;i++){
			writef(to!string(vetor[i]));
		}
		writefln("");
	}
}

void main(char[][] args){
	apenasprintar ini = new apenasprintar();
	
	string teste;


	
	teste = strip(stdin.readln());
	printf ("%s\n", &teste);




	if (teste == "oi"){
		printf("Oiiiiiiiiiiiiiiiiiiiiiiiiii");
	}

	//ini.inicializar();
	//ini.criarvetor();

}