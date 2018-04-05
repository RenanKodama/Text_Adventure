import std.stdio;
import std.exception, std.process;
import core.stdc.stdlib;		
import core.stdc.time;			
import core.thread;
import std.string;


class Game{
	Cenas[12] vetor_Cenas;
	int cena_Atual;
	Inventario bolsa;
	int vida;
}

class Inventario{
	Itens[5] itensObtidos;
	int qtd_Inventario;
}

class Cenas{
	int id;
	string titulo;
	Itens[5] item;
	string descricao;
	Alternativas[6] caminhos;
	int tamanhoCaminhos;
	int tamanhoItem;
	int dano;
	bool recebe_Dano = false;
}

class Alternativas{
	string opcao;
	string mensagem;
	int prox_cena;
}

class Itens{
	int 	id;
	string 	nome;
	string 	descricao;
	bool 	obtido = false;
}


void IniciarlizarCenas(Game jogo){
	jogo.cena_Atual = 0;
	jogo.bolsa = new Inventario();
	jogo.bolsa.qtd_Inventario = 0;
	jogo.vida = 10;

	Alternativas altern00;
	Alternativas altern01;
	Alternativas altern02;
	Alternativas altern03;
	Alternativas altern04;
	Alternativas altern05;
	Alternativas altern06;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena00 = new Cenas();
	cena00.id = 00;
	cena00.titulo = "Prologo.	\n";
	cena00.item = null;
	cena00.descricao = 	"\tQuando você se dá conta, está em um lugar totalmente diferente do acostumado, 	\n"~
						"\t\tnão se lembra como foi parar lá e muito menos onde está, tudo é muito escuro,	\n"~
						"\t\tvocê carrega apenas uma mochila nas costas, voce apenas ve um CAMINHO a sua frente. 	\n\n\n";

		altern00 = new Alternativas();

		altern00.opcao = "use caminho";
		altern00.mensagem = null;
		altern00.prox_cena = 01;

	cena00.tamanhoCaminhos = 01;
	cena00.tamanhoItem = 00;
	cena00.caminhos[0] = altern00;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena01 = new Cenas();
	cena01.id = 01;
	cena01.titulo = "A Floresta part. 1.	\n";
	cena01.item = null;
	cena01.descricao = 	"\tVocê não consegue ver nada a frente, você começa a se apavorar e sua respiração 	\n"~
						"\t\tse torna ofegante, quando de repente você escuta galhos se quebrando 			\n"~
						"\t\tentão você se pergunta, devo ir para ANDAR,CORRER ou esconder nos ARBUSTOS ? .... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();

		altern00.opcao = "use andar";
		altern00.mensagem = null;
		altern00.prox_cena = 02;
		altern01.opcao = "use correr";
		altern01.mensagem = null;
		altern01.prox_cena = 03;
		altern02.opcao = "use arbustos";
		altern02.mensagem = null;
		altern02.prox_cena = 04;

	cena01.tamanhoCaminhos = 03;
	cena01.tamanhoItem = 00;
	cena01.caminhos[0] = altern00;
	cena01.caminhos[1] = altern01;
	cena01.caminhos[2] = altern02;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena02 = new Cenas();
	cena02.id = 02;
	cena02.titulo = "A Floresta part. 2.	\n";
	cena02.item = null;
	cena02.descricao = 	"\tVocê anda com cautela para frente porem é surpreendido pelas costas por uma 	\n"~
						"\t\tcriatura indescritivél e apavorante, aos berros ela te ataca, com 	\n"~
						"\t\tseu corpo ferido você pensa em BATER no monstro ou CORRER ? ....	\n\n\n";	
	cena02.recebe_Dano = true;
	cena02.dano = 4;

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern00.opcao = "use correr";
		altern00.mensagem = null;
		altern00.prox_cena = 03;
		altern01.opcao = "use bater";
		altern01.mensagem = null;
		altern01.prox_cena = 06;

	cena02.tamanhoCaminhos = 02;
	cena02.tamanhoItem = 00;
	cena02.caminhos[0] = altern00;
	cena02.caminhos[1] = altern01;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena03 = new Cenas();
	cena03.id = 03;
	cena03.titulo = "A Floresta part. 3.	\n";
	cena03.item = null;
	cena03.descricao = 	"\tVocê decide correr para frente com medo, desviando de arbustos e árvores que mal 	 \n"~
						"\t\tpodiam serem vistas no escuro, até que você desliza e cai de um barranco.			 \n"~
						"\t\tAtordoado você se levanta e observa a sua frente uma luz em meio à escuridão e voce \n"~
						"\t\tdecide ANDAR em direçao a ela ....	\n\n\n";
	cena03.recebe_Dano = true;
	cena03.dano = 1;

		altern00 = new Alternativas();
		altern00.opcao = "use andar";
		altern00.mensagem = null;
		altern00.prox_cena = 07;

	cena03.tamanhoCaminhos = 01;
	cena03.tamanhoItem = 00;
	cena03.caminhos[0] = altern00;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena04 = new Cenas();
	cena04.id = 04;
	cena04.titulo = "A Floresta part. 4.	\n";
	cena04.item = null;
	cena04.descricao = 	"\tVocê decide ficar espreitado nos arbustos, quando a criatura assombrosa passa diante				\n"~
						"\t\tde você, porém é impossível distiguila de um animal ou de um humano. Apavorado você espera a 	\n"~
						"\t\tcriatura se perder em meio à escuridão. Então você se depara com uma luz a sua frente e 		\n"~
						"\t\tresolve ANDAR em dirçao a ela ....\n\n\n";

		altern00 = new Alternativas();
		altern00.opcao = "use andar";
		altern00.mensagem = null;
		altern00.prox_cena = 07;

	cena04.tamanhoCaminhos = 01;
	cena04.tamanhoItem = 00;
	cena04.caminhos[0] = altern00;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena06 = new Cenas();
	cena06.id = 06;
	cena06.titulo = "GAME OVER !. 	\n";
	cena06.item = null;
	cena06.descricao = 	"\t Você morreu destroçado pelo monstro !	\n"~
						"\t\t 		GAME OVER !						\n\n"~
						"\t\t dica: combate corpo a corpo e morte certa !	\n\n\n";

	cena06.tamanhoCaminhos = 00;
	cena06.tamanhoItem = 00;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena07 = new Cenas();
	cena07.id = 07;
	cena07.titulo = "A Floresta part. 5.	\n";
	cena07.item = null;
	cena07.descricao = 	"\tA cada passo que você se aproxima da luz, percebe que se trata de uma simples casa abandonada, \n"~
						"\t\tvoce nota que na frente existe uma velha PORTA e um CAMINHO que leva aos arredores da casa. \n"~
						"\t\tVocê para em frente dela e decide ....\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();
		altern04 = new Alternativas();

		altern01.opcao = "use caminho";
		altern01.mensagem = null;
		altern01.prox_cena = 08;
		altern02.opcao = "use porta";
		altern02.mensagem = "A porta esta trancada! 	\n";
		altern02.prox_cena = -1;
		altern03.opcao = "check porta";
		altern03.mensagem = "A porta esta fechada porem a fechadura tem dois encaixes pequenos .... 	\n";
		altern03.prox_cena = -1;
		altern04.opcao = "use grampo with porta";
		altern04.mensagem = null;
		altern04.prox_cena = 11;

	cena07.tamanhoCaminhos = 05;
	cena07.tamanhoItem = 00;
	cena07.caminhos[0] = altern00;
	cena07.caminhos[1] = altern01;
	cena07.caminhos[2] = altern02;
	cena07.caminhos[3] = altern03;
	cena07.caminhos[4] = altern04;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena08 = new Cenas();
	cena08.id = 08;
	cena08.titulo = "A Casa. 	\n";
	cena08.item = null;
	cena08.descricao = 	"\tAo vasculhar a os arredores da casa voce percebe uma caixa de CORREIOS e uma OFICINA na garagem 	\n"~
						"\t\tcom os portoes abertos ou pode escolher o CAMINHO obscuro de volta a entrada da casa.	\n"~
						"\t\tEntao voce decide ....\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();

		altern00.opcao = "use oficina";
		altern00.mensagem = null;
		altern00.prox_cena = 09;
		altern01.opcao = "use correios";
		altern01.mensagem = null;
		altern01.prox_cena = 10;
		altern02.opcao = "use caminho";
		altern02.mensagem = null;
		altern02.prox_cena = 07;


	cena08.tamanhoCaminhos = 03;
	cena08.tamanhoItem = 00;
	cena08.caminhos[0] = altern00;
	cena08.caminhos[1] = altern01;
	cena08.caminhos[2] = altern02;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena09 = new Cenas();
	cena09.id = 09;
	cena09.titulo = "A Garagem. 	\n";
	cena09.item = new Itens();

		Itens item01 = new Itens();
		item01.id = 01;
		item01.nome = "arame";
		item01.descricao = "Talvez se combinar com outra coisa se torne mais util.";

	cena09.item[0] = item01;
	cena09.descricao = 	"\tAo chegar na garagem voce começa a vasculhar e nota que existe um pedaço de ARAME,		\n"~
						"\t\tvoce pode querer querer voltar pelo CAMINHO para a casa ou confiar no seu senso		\n"~
						"\t\tde EXPLORAR os arredores....	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();

		altern00.opcao = "use caminho";
		altern00.mensagem = null;
		altern00.prox_cena = 07;
		altern01.opcao = "use explorar";
		altern01.mensagem = null;
		altern01.prox_cena = 08;
		altern02.opcao = "get arame";
		altern02.mensagem = null;
		altern02.prox_cena = -2;

	cena09.tamanhoCaminhos = 03;
	cena09.tamanhoItem = 01;
	cena09.caminhos[0] = altern00;
	cena09.caminhos[1] = altern01;
	cena09.caminhos[2] = altern02;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena10 = new Cenas();
	cena10.id = 10;
	cena10.titulo = "A Caixa. 	\n";
	cena10.item = new Itens();

		Itens item04 = new Itens();
		item04.id = 03;
		item04.nome = "carta";
		item04.descricao = "Existe um texto nela: \"Obrigado por testar nosso jogo em TextAdventure!.\"";

		Itens item00 = new Itens();
		item00.id = 00;
		item00.nome = "clipe";
		item00.descricao = "Muito util para manter seus papeis juntos e organizados.";

	cena10.item[0] = item04;
	cena10.item[1] = item00;

	cena10.descricao = 	"\tVocê chega à caixa de correios a abre e nota que existe nela uma CARTA e 	\n"~
						"\t\tum CLIPE de papel, podendo ir pelo CAMINHO para a porta da casa ou 		\n"~
						"\t\tEXPLORAR os arredores  ....\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();

		altern00.opcao = "use explorar";
		altern00.mensagem = null;
		altern00.prox_cena = 08;
		altern01.opcao = "use caminho";
		altern01.mensagem = null;
		altern01.prox_cena = 07;
		altern02.opcao = "get carta";
		altern02.mensagem = null;
		altern02.prox_cena = -2;
		altern03.opcao = "get clipe";
		altern03.mensagem = null;
		altern03.prox_cena = -2;

	cena10.tamanhoCaminhos = 04;
	cena10.tamanhoItem = 02;
	cena10.caminhos[0] = altern00;
	cena10.caminhos[1] = altern01;
	cena10.caminhos[2] = altern02;
	cena10.caminhos[3] = altern03;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena11 = new Cenas();
	cena11.id = 11;
	cena11.titulo = "O Fim 	\n";
	cena11.item = null;
	cena11.descricao = 	"\tAo entrar na casa voce sente a presença do mal e a escuridao começa a te envolver, enquanto seu 			\n"~
						"\t\tcoraçao começa a pulsar voce sente sua visao ficando cada vez mais turva ate que voce desmaia e cai 		\n"~
						"\t\tsobre o chao. Alguns momentos depois voce acorda e esta em um lugar totalmente diferente e escuro ....  \n\n\n";

		altern00 = new Alternativas();

	cena11.tamanhoCaminhos = 01;
	cena11.tamanhoItem = 00;
	cena11.caminhos[0] = altern00;

//---------------------------------------------------------------------------------------------------------------------------
	jogo.vetor_Cenas[0] = cena00;
	jogo.vetor_Cenas[1] = cena01;
	jogo.vetor_Cenas[2] = cena02;
	jogo.vetor_Cenas[3] = cena03;
	jogo.vetor_Cenas[4] = cena04;
	jogo.vetor_Cenas[6] = cena06;
	jogo.vetor_Cenas[7] = cena07;
	jogo.vetor_Cenas[8] = cena08;
	jogo.vetor_Cenas[9] = cena09;
	jogo.vetor_Cenas[10] = cena10;
	jogo.vetor_Cenas[11] = cena11;
}
//---------------------------------------------------------------------------------------------------------------------------




auto soundPlayer(string nome){
  spawnProcess(["mpg123","-q",nome]);
}

auto soundPlayerAmbiente(string nome){
  spawnProcess(["mpg123","-q","--loop","-1",nome]);
}

auto killSound(){
	spawnProcess(["killall","mpg123"]);
}
bool testaSom(){
	auto result = ["mpg123"].execute;
	result.output.write;

		return true;
}

auto addSom(int numero_cena){
	string galhoQuebrando = "soundEffects/breakingWood.mp3";
	string damageSound = "soundEffects/damageSound.mp3";
	string escadaMadeira = "soundEffects/woodenStair.mp3";
	string magnum = "soundEffects/magnum.mp3";
	string portaFechando = "soundEffects/portaFechando.mp3";
	if(numero_cena==1){
		soundPlayer(galhoQuebrando);
	}
	if(numero_cena==2 || numero_cena==3){
		soundPlayer(damageSound);
	}
	if(numero_cena==12){
		soundPlayer(escadaMadeira);
	}
	if(numero_cena==19){
		soundPlayer(portaFechando);
	}
}


void limparTela(){
	system("clear");
}

void funcao_quit(){
	killSound();	
	exit(0);
}

void esperarSegundos(int time){
	Thread.sleep(dur!("seconds")( time ));
}

bool funcao_use(Game jogo, int numero_cena, string comando){
	auto comando_split = comando.split(" ");

	switch(comando_split.length){
		case(2):
			for (int i=0;i<jogo.vetor_Cenas[numero_cena].tamanhoCaminhos;i++){
				if(jogo.vetor_Cenas[numero_cena].caminhos[i].opcao == comando){

					if(jogo.vetor_Cenas[numero_cena].caminhos[i].prox_cena == -1 ){
						writef("\n\n\n\t%s",jogo.vetor_Cenas[numero_cena].caminhos[i].mensagem);
						esperarSegundos(2);
						return true;
					}
					else{
						jogo.cena_Atual = jogo.vetor_Cenas[numero_cena].caminhos[i].prox_cena;
						return true;
					}
				}
			}

			break;

		case(4):

			if ((comando_split[0] == "use") && (comando_split[2] == "with")){
				bool tem_item = false;
				string item = comando_split[1];

				for (int i=0;i<jogo.bolsa.qtd_Inventario;i++){
					if(jogo.bolsa.itensObtidos[i].nome == item){
						tem_item = true;
					}
				}

				if (tem_item == true){ 
					for (int i=0;i<jogo.vetor_Cenas[numero_cena].tamanhoCaminhos;i++){
						writefln(jogo.vetor_Cenas[numero_cena].caminhos[i].opcao);

						if(jogo.vetor_Cenas[numero_cena].caminhos[i].opcao == comando){
							jogo.cena_Atual = jogo.vetor_Cenas[numero_cena].caminhos[i].prox_cena;
							return true;
						}
					}
				}
				else{
					writefln("Item nao Disponivel!");
					esperarSegundos(2);
				}
			}
			else{
				writefln("Comando Invalido!");
				esperarSegundos(2);
			}

			break;

		default:
			writefln("Comando Invalido!");
			esperarSegundos(2);
			break;
	}

	return false;
}

void funcao_get(Game jogo, int numero_cena, string comando){
	auto comando_split = comando.split(" ");

	switch(comando_split.length){
		case(2):

			for (int i=0;i<jogo.vetor_Cenas[numero_cena].tamanhoCaminhos;i++){
				if(jogo.vetor_Cenas[numero_cena].caminhos[i].opcao == comando){
					adiconar_ItemIventario(jogo,numero_cena,comando_split[1]);
				}
			}
			break;

		default:
			writefln("Comando Invalido!");
			esperarSegundos(2);
			break;
	}
}

void funcao_invetory(Game jogo, int numero_cena){
	string comando;

	while(comando != "quit"){
		limparTela();
		writefln("\n\n\tInventario \n");

		writefln("\n\tItens: ");
		ver_Inventario(jogo);

		writef("\ninventario/>");
		comando = strip(stdin.readln());

		writef("\n\n\n");

		auto comando_split = comando.split(" ");


		if (comando_split.length > 1){
			switch(comando_split.length){
				case(4):
					if(comando_split[0] == "use" && comando_split[2] == "with"){
						combinar_Itens(jogo,comando);
					}	
					else{
						writefln("Conmando Invalido!");
						esperarSegundos(2);
					}
					break;
			
				default:
					writefln("Conmando Invalido!");
					esperarSegundos(2);
					break;
			}
		}
	}
}

void funcao_check(Game jogo, int numero_cena, string comando){

}

void funcao_save(Game jogo, int numero_cena, string comando){

}

void funcao_load(Game jogo, int numero_cena, string comando){

}


int apresentarCena(Game jogo){
	int numero_cena = jogo.cena_Atual;
	string comando;

	writefln("\n\nCena atual: %d\n\n\n\n\n\n\n",numero_cena);
	writef("Titulo: %s\n",jogo.vetor_Cenas[numero_cena].titulo);
	writef("Descricao: %s",jogo.vetor_Cenas[numero_cena].descricao);

	recebe_Dano(jogo,numero_cena);
	writef("\n\t\t\t\t\t\t\t\t\t\t\tVida: %d\n\n\n",jogo.vida);


	writef("/<");
	comando = strip(stdin.readln());
	
	

	auto first_argument = comando.split(" ");
	switch(first_argument[0]){
		case("use"):
		case("USE"):
			funcao_use(jogo,numero_cena,comando);
			break;

		case("get"):
		case("GET"):
			funcao_get(jogo,numero_cena,comando);
			break;

		case("inventory"):
		case("INVENTORY"):
			funcao_invetory(jogo,numero_cena);
			break;

		case("check"):
		case("CHECK"):
			funcao_check(jogo,numero_cena,comando);
			break;

		case("save"):
		case("SAVE"):
			funcao_save(jogo,numero_cena,comando);
			break;
		
		case("load"):
		case("LOAD"):
			funcao_load(jogo,numero_cena,comando);
			break;

		case("quit"):
		case("QUIT"):
			funcao_quit();
			break;

		default:
			writefln("Comando Invalido!");
			esperarSegundos(2);
			break;	
	}
	return 0;
}

void combinar_Itens(Game jogo, string comando){
	auto comando_split = comando.split(" ");

	string item01 = comando_split[1];
	string item02 = comando_split[3];
	bool tem_Item01 = false;
	bool tem_Item02 = false;

	for (int i=0;i<jogo.bolsa.qtd_Inventario;i++){
		if(jogo.bolsa.itensObtidos[i].nome == item01){
			tem_Item01 = true;
		}
		if(jogo.bolsa.itensObtidos[i].nome == item02){
			tem_Item02 = true;
		}
	}

	if(tem_Item01 == true && tem_Item02 == true){
		if (((item01 == "clipe") && (item02 == "arame")) || ((item01 == "arame") && (item02 == "clipe"))) {
			bool tem_item = false;

			Itens item = new Itens();
			item.id = 02;
			item.nome = "grampo";
			item.descricao = "Talvez eu possa abrir coisas com ela";
			item.obtido = true;


			for (int i=0;i<jogo.bolsa.qtd_Inventario;i++){
				if(jogo.bolsa.itensObtidos[i].nome == item.nome){
					tem_item = jogo.bolsa.itensObtidos[i].obtido;
					break;
				}
			}

			if(tem_item == false){
				jogo.bolsa.itensObtidos[jogo.bolsa.qtd_Inventario] = item;
				jogo.bolsa.qtd_Inventario++;
				
				writefln("Item Adquirido: %s \n",item.nome);
				esperarSegundos(2);
			}
			else{
				writefln("Item \"%s\" ja esta no Invetario \n",item.nome);
				esperarSegundos(2);	
			}

		}
		else{
			writefln("Combinaçao Invalida!");
		}
	}
	else{
		writefln("Item nao disponivel no Inventario!");
		esperarSegundos(2);
	}


}


void ver_Inventario(Game jogo){
	for(int i=0;i<jogo.bolsa.qtd_Inventario;i++){
		writef("\t\tNome: %s\n",jogo.bolsa.itensObtidos[i].nome);
		writefln("\t\tDescricao: %s\n\n",jogo.bolsa.itensObtidos[i].descricao);
	}
}


void recebe_Dano(Game jogo,int numero_cena){
	if (jogo.vetor_Cenas[numero_cena].recebe_Dano == true){
		writefln("\t\t<DANO -%d>",jogo.vetor_Cenas[numero_cena].dano);
		jogo.vida = jogo.vida - jogo.vetor_Cenas[numero_cena].dano;
		jogo.vetor_Cenas[numero_cena].recebe_Dano = false;		
	}
}

void adiconar_ItemIventario(Game jogo,int numero_cena, string item){
	Itens aux = null;

	for(int i=0;i<jogo.vetor_Cenas[numero_cena].tamanhoItem;i++){
		
		if(jogo.vetor_Cenas[numero_cena].item[i].nome == item){

			if(jogo.vetor_Cenas[numero_cena].item[i].obtido == false){
				aux = jogo.vetor_Cenas[numero_cena].item[i];
				jogo.bolsa.itensObtidos[jogo.bolsa.qtd_Inventario] = aux;
				jogo.bolsa.qtd_Inventario++;	
				jogo.vetor_Cenas[numero_cena].item[i].obtido = true;

				writefln("Item Adquirido: %s \n",jogo.vetor_Cenas[numero_cena].item[i].nome);
				esperarSegundos(2);

				break;
			}
			else{
				writefln("Item \"%s\" ja esta no Invetario \n",jogo.vetor_Cenas[numero_cena].item[i].nome);
				esperarSegundos(2);				
			}
		}	
	}
}


void main(){
	Game jogo = new Game();
	int cena=0;
	IniciarlizarCenas(jogo);
	
	/*string musicaAmbiente = "sjogo.vetor_Cenas[numero_cena]oundEffects/ambientMusic.mp3";

	if(testaSom()){
		soundPlayerAmbiente(musicaAmbiente);
	} else {
		write("mpg123 nao localizado no sistema!. Os sons do jogo nao serao reproduzidos! ");
	}*/	


	while(cena != 11){
		limparTela();
		
		cena = apresentarCena(jogo);
	}

}













	/*for(int k=0;k<jogo.vetor_Cenas[numero_cena].tamanhoCaminhos;k++){
		addSom(numero_cena);
		if (jogo.vetor_Cenas[numero_cena].caminhos[k].ver_Opcao == true){
			if(numero_cena==18 && (k==4 || k==5 || k==6)){
				soundPlayer("soundEffects/magnum.mp3");
			}else if(numero_cena==14 &&(k==1)){
				soundPlayer("soundEffects/tosse.mp3");
			}
			writef("\t%s ",jogo.vetor_Cenas[numero_cena].caminhos[k].opcao);
		}
	}*/



/*
//	if (jogo.vetor_Cenas[numero_cena].recebe_Dano == true){
	//	receber_Dano(jogo,numero_cena);	
//	}	

	writef("\n\t\t\t\t\t\t\t\tVida: %d",jogo.vida);
	writefln("\n\t\t\t\t\t\t\t\tPressione \"V\" para ver o Invetario ");
	writef("\n\t\t\t\t\t\t\t\tPressione \"Q\" para sair do Jogo! ");

	if (jogo.vetor_Cenas[numero_cena].tamanhoCaminhos != 0){
		writef("\nOpcao: ");
		stdout.flush();
		scanf("%s", &entradaTeclado);


			switch(entradaTeclado){
				case('A'):
				case('a'):
					entradaTecladoConvertido = 0;
					break;

				case('B'):
				case('b'):
					entradaTecladoConvertido = 1;
					break;

				case('C'):
				case('c'):
					entradaTecladoConvertido = 2;
					break;

				case('D'):
				case('d'):
					entradaTecladoConvertido = 3;
					break;

				case('E'):
				case('e'):
					entradaTecladoConvertido = 4;
					break;

				case('F'):
				case('f'):
					entradaTecladoConvertido = 5;
					break;

				case('G'):
				case('g'):
					entradaTecladoConvertido = 6;
					break;

				case('H'):
				case('h'):
					entradaTecladoConvertido = 7;
					break;

				case('V'):
				case('v'):
					verInventario(jogo);
					break;

				case('Q'):
				case('q'):
					sair_Jogo();
					break;
				
				default:
					writefln("Caractere Invalido!");

			}

			if (entradaTecladoConvertido != -1){
				//chamada para outros cenarios
				if (jogo.vetor_Cenas[numero_cena].caminhos[entradaTecladoConvertido].prox_cena != -1){
					if (jogo.vetor_Cenas[numero_cena].caminhos[entradaTecladoConvertido].prox_cena != -2){
						jogo.cena_Atual = jogo.vetor_Cenas[numero_cena].caminhos[entradaTecladoConvertido].prox_cena;
					}
				}

				//chamada para cenas invalidas
				if (jogo.vetor_Cenas[numero_cena].caminhos[entradaTecladoConvertido].prox_cena == -1){
					if (jogo.vetor_Cenas[numero_cena].caminhos[entradaTecladoConvertido].mensagem != null){
						writefln ("\n %s",jogo.vetor_Cenas[numero_cena].caminhos[entradaTecladoConvertido].mensagem);
						Thread.sleep(dur!("seconds")( 2 ));
					}
				}
				//chamada para itens
				if (jogo.vetor_Cenas[numero_cena].caminhos[entradaTecladoConvertido].prox_cena == -2){
					jogo.vetor_Cenas[numero_cena].caminhos[entradaTecladoConvertido].ver_Opcao = false;

					writefln("Item Adquirido: %s \n",jogo.vetor_Cenas[numero_cena].item[entradaTecladoConvertido].nome);
					Thread.sleep(dur!("seconds")( 3 ));
				}
			}

	}*/
	//return 0;
//}



/*
void receber_Dano(Game jogo,int numero_cena){
	writefln("\n\n\n<DANO -%d>",jogo.vetor_Cenas[numero_cena].dano[0]);
	jogo.vida = jogo.vida - jogo.vetor_Cenas[numero_cena].dano[0];
	jogo.vetor_Cenas[numero_cena].receber_Dano = false;
}*/

/*
int combinar_Itens(Game jogo){
	int aux_teclado1;
	int aux_teclado2;

	stdout.flush();
	scanf("ID item1: %d", &aux_teclado1);
	stdout.flush();	
	scanf("ID item2: %d", &aux_teclado2);
}*/

/*
void verInventario(Game jogo){
	char teclado;

	while((teclado != 'q') && (teclado != 'Q')){	
		writefln("Aperte \"Q\" para sair!");
		writefln("Aperte \"C\" para combinar itens!");

		writefln("\nItens: \n\n");
			for(int i=0;i<jogo.bolsa.qtd_Inventario;i++){
				writef("\tNome: %s\n",jogo.bolsa.itensObtidos[i].nome);
				writef("\tTexto: %s\n",jogo.bolsa.itensObtidos[i].texto);
				writef("\tDescricao: %s\n",jogo.bolsa.itensObtidos[i].descricao);
		}

		switch(teclado){
			case('C'):
			case('c'):
				combinar_Itens(jogo);



			break;

		}
			
	}
}*/

/*
void adicionarInventario(Game jogo,Itens itemAdquirido){
	jogo.bolsa.itensObtidos[jogo.bolsa.qtd_Inventario] = itemAdquirido;
	jogo.bolsa.qtd_Inventario++;
}*/












	/*for(int i=0;i<=22;i++){
		writef("Titulo: %s",jogo.vetor_Cenas[i].titulo);

		for(int j=0;j<jogo.vetor_Cenas[i].tamanhoItem;j++){
			writef("Itens: %s, %d\n",jogo.vetor_Cenas[i].item[j].nome,jogo.vetor_Cenas[i].item[j].id);
		}
		writef("Descricao: %s",jogo.vetor_Cenas[i].descricao);

		for(int k=0;k<jogo.vetor_Cenas[i].tamanhoCaminhos;k++){
			writef("%s ",jogo.vetor_Cenas[i].caminhos[k].opcao);
			writef("%s ",jogo.vetor_Cenas[i].caminhos[k].mensagem);
			writef("\tProxima Cena: %d \n",jogo.vetor_Cenas[i].caminhos[k].prox_cena);
		}

		writefln("\n\n\n\n");

	}*/


