import std.stdio;


class Game{
	Cenas[13] vetor_Cenas;
	int cena_Atual;
	Inventario bolsa;
	int vida;

	Itens[4] itensJogo;
	int qtd_ItensJogo = 4;
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
	string somCena;
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
	jogo.vida = 5;

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
		altern00.mensagem = "É um caminho... seria bom usa-lo....?";
		altern00.prox_cena = 01;

	cena00.somCena = null;
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
						"\t\tentão você se pergunta, devo ANDAR, CORRER ou me esconder nos ARBUSTOS ? .... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();

		altern00.opcao = "use andar";
		altern00.mensagem = "....Talvez nao seja nada....";
		altern00.prox_cena = 02;
		altern01.opcao = "use correr";
		altern01.mensagem = "....";
		altern01.prox_cena = 03;
		altern02.opcao = "use arbustos";
		altern02.mensagem = "...Sera que me escondo?";
		altern02.prox_cena = 04;

	cena01.somCena = "soundEffects/breakingWood.mp3";
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
		altern00.mensagem = "Talvez....";
		altern00.prox_cena = 03;
		altern01.opcao = "use bater";
		altern01.mensagem = "Sera que ganho dele? ....";
		altern01.prox_cena = 06;

	cena02.somCena = null;
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
		altern00.mensagem = "....";
		altern00.prox_cena = 07;

	cena03.somCena = null;
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
		altern00.mensagem = "Essa luz me conforta....";
		altern00.prox_cena = 07;

	cena04.somCena = null;
	cena04.tamanhoCaminhos = 01;
	cena04.tamanhoItem = 00;
	cena04.caminhos[0] = altern00;

//---------------------------------------------------------------------------------------------------------------------------
	Cenas cena06 = new Cenas();
	cena06.id = 06;
	cena06.titulo = "GAME OVER !. 	\n";
	cena06.item = null;
	cena06.descricao = 	"\t\t << Voce Morreu! >> \n"~
						"\t\t\t      GAME OVER ! \n\n\n";

	cena06.somCena = "soundEffects/morrendo.mp3";
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
		altern01.mensagem = "....";
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

	cena07.somCena = null;
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
		altern00.mensagem = "Sera que existe alguma coisa la?";
		altern00.prox_cena = 09;
		altern01.opcao = "use correios";
		altern01.mensagem = null;
		altern01.prox_cena = 10;
		altern02.opcao = "use caminho";
		altern02.mensagem = null;
		altern02.prox_cena = 07;

	cena08.somCena = null;
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

	jogo.itensJogo[0] = item01; 

	cena09.item[0] = item01;
	cena09.descricao = 	"\tAo chegar na garagem voce começa a vasculhar e nota que existe um pedaço de ARAME,		\n"~
						"\t\tvoce pode querer querer voltar pelo CAMINHO para a casa ou confiar no seu senso		\n"~
						"\t\tde EXPLORAR os arredores....	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();

		altern00.opcao = "use caminho";
		altern00.mensagem = "....";
		altern00.prox_cena = 07;
		altern01.opcao = "use explorar";
		altern01.mensagem = "Seria uma boa ideia...ou nao....";
		altern01.prox_cena = 08;
		altern02.opcao = "get arame";
		altern02.mensagem = "Talvez isso possa ser util para algo ....";
		altern02.prox_cena = -2;

	cena09.somCena = null;
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

		Itens item03 = new Itens();
		item03.id = 03;
		item03.nome = "carta";
		item03.descricao = "Existe um texto nela: \"Obrigado por testar nosso jogo em TextAdventure!.\"";

		Itens item00 = new Itens();
		item00.id = 00;
		item00.nome = "clipe";
		item00.descricao = "Muito util para manter seus papeis juntos e organizados.";

	jogo.itensJogo[1] = item03; 
	jogo.itensJogo[2] = item00; 
	cena10.item[0] = item03;
	cena10.item[1] = item00;


	cena10.descricao = 	"\tVocê chega à caixa de correios a abre e nota que existe nela uma CARTA e 	\n"~
						"\t\tum CLIPE de papel, podendo ir pelo CAMINHO para a porta da casa ou 		\n"~
						"\t\tEXPLORAR os arredores  ....\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();

		altern00.opcao = "use explorar";
		altern00.mensagem = "Seria uma boa ideia...ou nao....";
		altern00.prox_cena = 08;
		altern01.opcao = "use caminho";
		altern01.mensagem = "A luz....";
		altern01.prox_cena = 07;
		altern02.opcao = "get carta";
		altern02.mensagem = "Apenas uma carta ....";
		altern02.prox_cena = -2;
		altern03.opcao = "get clipe";
		altern03.mensagem = "Talvez ele possa ser util";
		altern03.prox_cena = -2;


	cena10.somCena = null;
	cena10.tamanhoCaminhos = 04;
	cena10.tamanhoItem = 02;
	cena10.caminhos[0] = altern00;
	cena10.caminhos[1] = altern01;
	cena10.caminhos[2] = altern02;
	cena10.caminhos[3] = altern03;

//---------------------------------------------------------------------------------------------------------------------------
	Cenas cena11 = new Cenas();
	cena11.id = 11;
	cena11.titulo = "Esperança ou Ilusao? 	\n";
	cena11.item = null;
	cena11.descricao = 	"\tAo entrar na casa voce sente a presença do mal e a escuridao começa a te envolver, enquanto seu 			\n"~
						"\t\tcoraçao começa a pulsar voce sente sua visao ficando cada vez mais turva ate que voce desmaia e cai 	\n"~
						"\t\tsobre o chao. Alguns momentos depois voce acorda e esta em um lugar totalmente diferente e escuro.		\n"~
						"\t\tParalizado voce so consegue ANDAR ....  \n\n\n";

		altern00 = new Alternativas();
		altern00.opcao = "use andar";
		altern00.mensagem = "Seria uma boa ideia...ou nao....";
		altern00.prox_cena = 12;

	cena11.somCena = null;
	cena11.tamanhoCaminhos = 01;
	cena11.tamanhoItem = 00;
	cena11.caminhos[0] = altern00;

//---------------------------------------------------------------------------------------------------------------------------
	Cenas cena12 = new Cenas();
	cena12.id = 12;
	cena12.titulo = "O Fim! 	\n";
	cena12.item = null;
	cena12.descricao = 	"\tVoce chegou ao fim da DEMO! voce pode recomeçar com o newgame \n\n\n";

		altern00 = new Alternativas();

	cena12.somCena = null;
	cena12.tamanhoCaminhos = 00;
	cena12.tamanhoItem = 00;
	cena12.caminhos[0] = altern00;

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
	jogo.vetor_Cenas[12] = cena12;
	
	Itens item02 = new Itens();
	item02.id = 02;
	item02.nome = "grampo";
	item02.descricao = "Talvez eu possa abrir coisas com ela";

	jogo.itensJogo[3] = item02;
}
