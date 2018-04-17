import std.stdio;
import std.exception, std.process;
import core.stdc.stdlib;		
import core.stdc.time;			
import core.thread;
import std.string;
import std.file;
import std.conv;
import std.array;
import Estruturas;



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
	writefln("\n Finalizando operaçoes aguarde ....");
	esperarSegundos(2);
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

						if(jogo.vetor_Cenas[numero_cena].caminhos[i].opcao == comando){
							jogo.cena_Atual = jogo.vetor_Cenas[numero_cena].caminhos[i].prox_cena;
							return true;
						}
					}
				}
				else{
					writefln("Item nao Disponivel!");
					esperarSegundos(1);
				}
			}
			else{
				writefln("Comando Invalido!");
				esperarSegundos(1);
			}
			break;

		default:
			writefln("Comando Invalido!");
			esperarSegundos(1);
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
			esperarSegundos(1);
			break;
	}
}

void funcao_invetory(Game jogo, int numero_cena){
	string comando;

	while(comando != "exit"){
		limparTela();
		writefln("\n\nInventario \n");

		if(jogo.bolsa.qtd_Inventario != 0){
			writefln("\n\tItens: ");
			ver_Inventario(jogo);
		}
		else{
			writefln("\n\tA bolsa esta vazia!");
		}
		writef("\ninventario/>");
		comando = strip(stdin.readln());

		writef("\n\n\n");

		auto comando_split = comando.split(" ");
		if (comando_split.length > 1){
			switch(comando_split.length){
				case(4):
					if(comando_split[0] == "combine" && comando_split[2] == "with"){
						combinar_Itens(jogo,comando);
					}	
					else{
						writefln("Comando Invalido!");
						esperarSegundos(1);
					}
					break;
			
				default:
					writefln("Comando Invalido!");
					esperarSegundos(1);
					break;
			}
		}
	}
}

void funcao_check(Game jogo, int numero_cena, string comando){
	auto comando_split  = comando.split(" ");

	if(comando_split.length == 2){
		for (int i=0;i<jogo.vetor_Cenas[numero_cena].tamanhoCaminhos;i++){
			auto aux_split = jogo.vetor_Cenas[numero_cena].caminhos[i].opcao.split(" ");
			string objeto = aux_split[1];

			if(objeto == comando_split[1]){
				writefln("\n%s\n\n",jogo.vetor_Cenas[numero_cena].caminhos[i].mensagem);
				esperarSegundos(2);
			}

		} 

	}
	else{
		writefln("Comando Invalido!");
		esperarSegundos(1);
	}
}

void funcao_save(Game jogo, int numero_cena, string comando){
	auto comando_split = comando.split(" ");

	if (comando_split.length == 1){
		File arquivo = File("Save/Save.txt","w");

		arquivo.writeln(numero_cena);
		arquivo.writeln(jogo.vida);
		for (int i=0; i<jogo.bolsa.qtd_Inventario; i++){
			arquivo.write(jogo.bolsa.itensObtidos[i].id," ");
		}

		arquivo.writeln("");

		writefln("\n\tJogo gravado com Sucesso!");
		esperarSegundos(2);
	} 	
	else{
		writefln("Comando Invalido!");
		esperarSegundos(1);
	}
}

void funcao_load(Game jogo, int numero_cena, string comando){
	auto comando_split = comando.split(" ");
	
	if (comando_split.length == 1){
		auto arquivo = File("Save/Save.txt", "r+");

		auto load_NumeroCena = arquivo.readln('\n');
		auto load_vida = arquivo.readln('\n');
		auto load_ItensInventario = arquivo.readln('\n');
		jogo.bolsa = new Inventario();

		int int_LoadNumeroCena = to!int(load_NumeroCena.replace("\n",""));		
		int int_LoadVida = to!int(load_vida.replace("\n",""));

		load_ItensInventario = load_ItensInventario.replace("\n"," ");
		int[] int_LoadItensInvetario = to!(int[]) (split(load_ItensInventario));


		jogo.cena_Atual = int_LoadNumeroCena;
		jogo.vida = int_LoadVida;

		for (int i=0;i<jogo.qtd_ItensJogo;i++){
			for (int j=0;j<int_LoadItensInvetario.length;j++){
				
				if (jogo.itensJogo[i].id == int_LoadItensInvetario[j]){	
					Itens aux_item = new Itens();

					aux_item = jogo.itensJogo[i];
					jogo.bolsa.itensObtidos[jogo.bolsa.qtd_Inventario] = aux_item;
					jogo.bolsa.qtd_Inventario++;	
				}
			}
		}
		writefln("\nJogo Carregado com Sucesso!");
		esperarSegundos(1);
	}
	else{
		writefln("Comand Invalido!");
		esperarSegundos(1);
	}
}

void funcao_newGame(Game jogo){
	writefln("\n Iniciando Novo Jogo ....");
	esperarSegundos(2);
	
	IniciarlizarCenas(jogo);
}

void funcao_help(){
	writefln("\n\nListas de comandos do jogo!\n\n");
	writeln(" use: comano para interagir/usar os objetos");
	writeln(" get: utilizado para pegar um objeto cena");
	writeln(" inventory: abre o inventário do jogo, para sair digite exit");
	writeln(" \tDentro do inventário, abilita-se o comano combine usado para combinar itens. combine ITEM with ITEM");
	writeln(" check: da informações sobre um objeto da cena");
	writeln(" save: salva o jogo atual mantendo o inventário");
	writeln(" load: carrega o jogo salvo anteriormente");
	writeln(" quit: sai do jogo");

}

void verifica_Vida(Game jogo){
	if(jogo.vida == 0){
		jogo.cena_Atual = 06;
	}
}

int apresentarCena(Game jogo){
	int numero_cena = jogo.cena_Atual;
	string comando;

	writefln("\n\nCena atual: %d\n\n\n\n\n\n\n",numero_cena);
	writef("Titulo: %s\n",jogo.vetor_Cenas[numero_cena].titulo);
	writef("Descricao: %s",jogo.vetor_Cenas[numero_cena].descricao);

	recebe_Dano(jogo,numero_cena);
	
	writef("\n\t\t\t\t\t\t\t\t\t\t\tVida: %d\n\n\n",jogo.vida);
	
	if(jogo.vetor_Cenas[numero_cena].somCena!=null){
		soundPlayer(jogo.vetor_Cenas[numero_cena].somCena);
	}

	writef("/<");

	comando = strip(stdin.readln());
	
	if (comando != ""){
		auto first_argument = comando.split(" ");
		switch(first_argument[0]){
			case("use"):
			case("USE"):
				funcao_use(jogo,numero_cena,comando);
				verifica_Vida(jogo);
				break;

			case("get"):
			case("GET"):
				funcao_get(jogo,numero_cena,comando);
				verifica_Vida(jogo);
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

			case("newgame"):
			case("NEWGAME"):
				funcao_newGame(jogo);
				break;

			case("help"):
			case("HELP"):
				funcao_help();
				break;

			case("combine"):
			case("COMBINE"):
				if(first_argument.length > 1){
					if(first_argument[0] == "combine" && first_argument[2] == "with"){
						combinar_Itens(jogo,comando);
					}
					else{
						writefln("Comando Invalido");
						esperarSegundos(1);
					}
				}
				break;
		
			default:
				writefln("Comando Invalido!");
				esperarSegundos(1);
				break;	
		}
	}
	return jogo.cena_Atual;
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
				esperarSegundos(1);	
			}

		}
		else{
			writefln("Combinaçao Invalida!");
			esperarSegundos(1);
		}
	}
	else{
		writefln("Item nao disponivel no Inventario!");
		esperarSegundos(1);
	}
}

void ver_Inventario(Game jogo){
	for(int i=0;i<jogo.bolsa.qtd_Inventario;i++){
		writef("\t\tNome: %s	(id: %d)\n",jogo.bolsa.itensObtidos[i].nome,jogo.bolsa.itensObtidos[i].id);
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
	

	try{
		string musicaAmbiente = "soundEffects/ambientMusic.mp3";
		soundPlayerAmbiente(musicaAmbiente);
	}catch{
		write("mpg123 nao localizado no sistema!. Os sons do jogo nao serao reproduzidos! ");
	}	


	while(cena != 13){
		limparTela();
		verifica_Vida(jogo);
		cena = apresentarCena(jogo);
	}

	killSound();
}