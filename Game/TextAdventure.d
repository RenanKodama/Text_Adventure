import std.stdio;
import std.exception, std.process;
import core.stdc.stdlib;		//import std.c.stdlib;
import core.stdc.time;			//import std.c.time;
import core.thread;
import std.string;


class Game{
	Cenas[25] vetor_Cenas;
	int cena_Atual;
	Inventario bolsa;
	int vida;
}

class Inventario
{
	Itens[20] itensObtidos;
	int qtd_Inventario;
}

class Cenas
{
	int id;
	string titulo;
	Itens[15] item;
	string descricao;
	Alternativas[10] caminhos;
	int tamanhoCaminhos;
	int tamanhoItem;
	int[3] dano;
	bool recebe_Dano = false;
}

class Alternativas
{
	string opcao;
	string mensagem;
	int prox_cena;
	bool ver_Opcao = true;
}

class Itens
{
	int 	id;
	string 	nome;
	string	texto;
	string 	descricao;
	bool 	obtido;
}


void IniciarlizarCenas(Game jogo)
{
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
	cena00.descricao = 	"\t Quando você se da conta, esta em um lugar totalmente diferente do acostumado, 	\n"~
						"\t\t nao se lembra como foi parar la e muito menos onde está, tudo e muito escuro, \n"~
						"\t\t voce carrega apenas uma mochila nas costas.	\n\n\n";

		altern00 = new Alternativas();

		altern00.opcao = "[A] Andar para Frente.	\n";
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
	cena01.descricao = 	"\t Voce nao consigue ver nada a frente, você comeca a se apavorar e sua respiracao \n"~
						"\t\t se torna ofegante, quando de repente você escuta galhos se quebrando [SOM DE 	\n"~
						"\t\t GALHOS QUEBRANDO],  entao você decide .... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();

		altern00.opcao = "[A] Andar para Frente com caltela. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 02;
		altern01.opcao = "[B] Correr para Frente. 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = 03;
		altern02.opcao = "[C] Andar para Esquerda e se Espreitar nos arbustos. 	\n";
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
	cena02.descricao = 	"\t Voce anda com cautela para frente porem e surpreendido pelas costas por uma 	\n"~
						"\t\t criatura indescritivel e apavorante, aos berros ela te ataca {vida -4}, com 	\n"~
						"\t\t seu corpo ferido você decide ....	\n\n\n";
	cena02.recebe_Dano = true;
	cena02.dano[0] = 4;

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern00.opcao = "[A] Correr para Frente. 	\n ";
		altern00.mensagem = null;
		altern00.prox_cena = 03;
		altern01.opcao = "[B] Enfrentar o Monstro. 	\n";
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
	cena03.descricao = 	"\t Voce decide correr para frente com medo, desviando de arbustos e arvores que mal 		\n"~
						"\t\t podiam serem vistas no escuro, ate que voce desliza e cai de um barranco {vida -1}.	\n"~
						"\t\t Atordoado voce se levanta e observa uma luz em meio a escuridao.	\n\n\n";
	cena03.recebe_Dano = true;
	cena03.dano[0] = 1;

		altern00 = new Alternativas();
		altern00.opcao = "[A] Ir até a Luz. 	\n";
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
	cena04.descricao = 	"\t Voce decide ficar espreitado nos arbustos, quando a criatura assombrosa passa diante 	\n"~
						"\t\t de voce, porém e impossivel distiguila de um animal ou de um humano. Apavorado você 	\n"~
						"\t\t espera a criatura se perder em meio a escuridao. Então voce se depara com uma luz 	\n"~
						"\t\t em meio as arvores. 	\n\n\n";

		altern00 = new Alternativas();
		altern00.opcao = "[A] Ir até a Luz. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 07;

	cena04.tamanhoCaminhos = 01;
	cena04.tamanhoItem = 00;
	cena04.caminhos[0] = altern00;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena05 = new Cenas();
	cena05.id = 05;
	cena05.titulo = "A Sala.	\n";
	cena05.item = new Itens();

		Itens item09 = new Itens();
		item09.id = 09;
		item09.nome = "Cinzas";
		item09.texto = "PEGAR CINZAS. 	\n";
		item09.descricao = "\t Do po viestes, ao po voltaras ....	\n";
		item09.obtido = false;

	cena05.item[3] = item09;
	cena05.descricao = "\t Voce decide ficar na sala, e oberva que neste lugar existe uma lareira ....	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();

		altern00.opcao = "[A] Voltar para o corredor. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 16;
		altern01.opcao = "[B] Colocar Madeira na Lareira.	\n";
		altern01.mensagem = null;
		altern01.prox_cena = -1;
		altern02.opcao = "[C] Acender Lareira. 	\n";
		altern02.mensagem = null;
		altern02.prox_cena = -1;
		altern03.opcao = "[D] Pegar Cinzas. 	\n";
		altern03.mensagem = null;
		altern03.prox_cena = -2;

	cena05.tamanhoCaminhos = 4;
	cena05.tamanhoItem = 01;
	cena05.caminhos[0] = altern00;
	cena05.caminhos[1] = altern01;
	cena05.caminhos[2] = altern02;
	cena05.caminhos[3] = altern03;

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
	cena07.descricao = 	"\t A cada passo que voce se aproxima da luz, percebe que se trata de uma simples casa 	\n"~
						"\t\t abandonada. Voce para em frente dela e decide ....	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();
		altern04 = new Alternativas();

		altern00.opcao = "[A] Bater na Porta.	\n";
		altern00.mensagem = "Nada acontece... 	\n";
		altern00.prox_cena = -1;
		altern01.opcao = "[B] Vasculhar em Volta da Casa. 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = 08;
		altern02.opcao = "[C] Tentar Abrir a Porta. 	\n";
		altern02.mensagem = "A porta esta trancada !. 	\n";
		altern02.prox_cena = -1;
		altern03.opcao = "[D] Analisar Fechadura. 	\n";
		altern03.mensagem = "Hmmm... a fechadura tem dois encaixes pequenos .... 	\n";
		altern03.prox_cena = -1;
		altern04.opcao = "[E] Forçar Trinco. 	\n";
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
	cena08.descricao = 	"\t Ao vasculhar a casa voce percebe uma caixa de correrios e uma oficina na garagem com 	\n"~
						"\t\t as portas abertas. Voce decide .... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();

		altern00.opcao = "[A] Ir para Garagem. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 09;
		altern01.opcao = "[B] Ir para a Caixa de Correios. 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = 10;
		altern02.opcao = "[C] Voltar para a Porta da Casa. 	\n";
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
		item01.nome = "Pedaco de Arame";
		item01.texto = "PEGAR PEDACO DE ARAME. 	\n";
		item01.descricao = "\t Talvez se combinar com outra coisa se torne mais util. 	\n";
		item01.obtido = false;

	cena09.item[2] = item01;
	cena09.descricao = "\t Ao chegar na garagem você comeca a vasculhar ....	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();

		altern00.opcao = "[A] Voltar para Porta da Casa. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 07;
		altern01.opcao = "[B] Continuar Vasculhando aos arredores da casa. 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = 08;
		altern02.opcao = "[C] Pegar Pedaço de Arame; 	\n";
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
		item04.id = 04;
		item04.nome = "Carta";
		item04.texto = "PEGAR CARTA 	\n";
		item04.descricao = "\t Existe um texto nela: \"Obrigado por testar nosso jogo em TextAdventure !.\"	\n";
		item04.obtido = false;

		Itens item00 = new Itens();
		item00.id = 00;
		item00.nome = "Cliper de Papel";
		item00.texto = "PEGAR CLIPE DE PAPEL 	\n";
		item00.descricao = "Muito util para manter seus papeis juntos e organizados.";

	cena10.item[2] = item04;
	cena10.item[3] = item00;

	cena10.descricao = "\t Voce chega a caixa de correios e a abre .... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();

		altern00.opcao = "[A] Continuar Vasculhando aos arredores da casa. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 08;
		altern01.opcao = "[B] Voltar para a Porta da Casa. 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = 07;
		altern02.opcao = "[C] Pegar uma Carta. 	\n";
		altern02.mensagem = null;
		altern02.prox_cena = -2;
		altern03.opcao = "[D] Pegar um Clipe de papel. 	\n";
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
	cena11.titulo = "O Corredor Inferior. 	\n";
	cena11.item = null;
	cena11.descricao = 	"\t Ao entrar na casa percebe que a luz estava ligada, porem sem nenhum movel nela, \n"~
						"\t\t voce analisa o corredor e decide .... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();
		altern04 = new Alternativas();

		altern00.opcao = "[A] Subir as Escadas. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 12;
		altern01.opcao = "[B] Ir Para a Cozinha. 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = 13;
		altern02.opcao = "[C] Ir Para Lavanderia. 	\n";
		altern02.mensagem = null;
		altern02.prox_cena = 14;
		altern03.opcao = "[D] Ir Para Banheiro Inferior.	\n";
		altern03.mensagem = null;
		altern03.prox_cena = 15;
		altern04.opcao = "[E] Ir para a Sala. 	\n";
		altern04.mensagem = null;
		altern04.prox_cena = 05;

	cena11.tamanhoCaminhos = 05;
	cena11.tamanhoItem = 00;
	cena11.caminhos[0] = altern00;
	cena11.caminhos[1] = altern01;
	cena11.caminhos[2] = altern02;
	cena11.caminhos[3] = altern03;
	cena11.caminhos[4] = altern04;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena12 = new Cenas();
	cena12.id = 12;
	cena12.titulo = "O Corredor Superior. 	\n";
	cena12.item = null;
	cena12.descricao = 	"\t Você sobe as escadas [SOM DE SUBIR AS ESCADAS], você percebe que neste andar 	\n"~
						"\t\t existem dois quartos e um banheiro, então você decide ....	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();

		altern00.opcao = "[A] Ir para o Quarto de Casal. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 18;
		altern01.opcao = "[B] Ir para o Quarto de Hóspedes. 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = 19;
		altern02.opcao = "[C] Ir para o Banheiro Superior. 	\n";
		altern02.mensagem = null;
		altern02.prox_cena = 20;
		altern03.opcao = "[D] Voltar para o Andar Inferior.	\n";
		altern03.mensagem = null;
		altern03.prox_cena = 16;

	cena12.tamanhoCaminhos = 04;
	cena12.tamanhoItem = 00;
	cena12.caminhos[0] = altern00;
	cena12.caminhos[1] = altern01;
	cena12.caminhos[2] = altern02;
	cena12.caminhos[3] = altern03;


//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena13 = new Cenas();
	cena13.id = 13;
	cena13.titulo = "A Cozinha. 	\n";

	cena13.item = new Itens();

		Itens item05 = new Itens();
		item05.id = 05;
		item05.nome = "Grãos de Feijão";
		item05.texto = "PEGAR GRÃOS DE FEIJÃO";
		item05.descricao = "Nada mais simples do que feijões, se houvesse mais poderia come -los";
		item05.obtido = false;

	cena13.item[3] = item05;
	cena13.descricao = 	"\t Ao chegar na Cozinha você encontra uma dispensa de conservas e uma janela 	\n"~
						"\t\t meio aberta. 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();
		altern04 = new Alternativas();

		altern00.opcao = "[A] Analisar Armário de Conserva. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = -1;
		altern01.opcao = "[B] Analisar Janela da Cozinha.	\n";
		altern01.mensagem = null;
		altern01.prox_cena = -1;
		altern02.opcao = "[C] Voltar ao Corredor. 	\n";
		altern02.mensagem = null;
		altern02.prox_cena = 16;
		altern03.opcao = "[D] Pegar Grãos de Feijão.	\n";
		altern03.mensagem = null;
		altern03.prox_cena = -2;
		altern04.opcao = "[E] Pular Janela. 	\n";
		altern04.mensagem = null;
		altern04.prox_cena = 17;


	cena13.tamanhoCaminhos = 05;
	cena13.tamanhoItem = 01;
	cena13.caminhos[0] = altern00;
	cena13.caminhos[1] = altern01;
	cena13.caminhos[2] = altern02;
	cena13.caminhos[3] = altern03;
	cena13.caminhos[4] = altern04;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena14 = new Cenas();
	cena14.id = 14;
	cena14.titulo = "A Lavanderia. 	\n";

	cena14.item = new Itens();
		Itens item08 = new Itens();
		Itens item10 = new Itens();

		item08.id = 08;
		item08.nome = "Velas";
		item08.texto = "PEGAR VELAS 	\n";
		item08.descricao = "Muito útil par iluminar lugares escuros. 	\n";
		item08.obtido = false;

		item10.id = 10;
		item10.nome = "Cx. de Fosforos";
		item10.texto = "PEGAR CX. DE FOSFOROS 	\n";
		item10.descricao = "... precisa de descrição ? 	\n";
		item10.obtido = false;

	cena14.item[2] = item08;
	cena14.item[3] = item10;
	cena14.descricao = "\t Ao chegar na lavanderia voce encontra apenas um armário velho e empoeirado .... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();

		altern00.opcao = "[A] Voltar ao Corredor.	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 16;
		altern01.opcao = "[B] Analisar o Armário Velho.	\n";
		altern01.mensagem = "\t [SOM DE TOSSE] Nossa como isso está sujo .... 	\n";
		altern01.prox_cena = -1;
		altern02.opcao = "[C] Pegar Velas. 	\n";
		altern02.mensagem = null;
		altern02.prox_cena = -2;
		altern03.opcao = "[D] Pegar Caixa de Fósforo. 	\n";
		altern03.mensagem = null;
		altern03.prox_cena = -2;


	cena14.tamanhoCaminhos = 04;
	cena14.tamanhoItem = 02;
	cena14.caminhos[0] = altern00;
	cena14.caminhos[1] = altern01;
	cena14.caminhos[2] = altern02;
	cena14.caminhos[3] = altern03;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena15 = new Cenas();
	cena15.id = 15;
	cena15.titulo = "O Banheiro Inferior. 	\n";
	cena15.item = null;

	cena15.descricao = "\t Ao chegar no banheiro inferior você nota que ele não foi usado por muitos anos .... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();
		altern04 = new Alternativas();
		altern05 = new Alternativas();
		altern06 = new Alternativas();

		altern00.opcao = "[A] Apertar Descarga. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 22;

		altern01.opcao = "[B] Abrir Torneira.	 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = -1;

		altern02.opcao = "[C] Abrir Espelho. 	\n";
		altern02.mensagem = "Está Vazio 	\n";
		altern02.prox_cena = -1;

		altern03.opcao = "[D] Voltar ao Corredor. 	\n";
		altern03.mensagem = null;
		altern03.prox_cena = 16;

		altern04.opcao = "[E] Colocar Broto no chão. 	\n";
		altern04.mensagem = null;
		altern04.prox_cena = -1;

		altern05.opcao = "[F] Desenhar um Pentagrama com as Cinzas no chão. 	\n";
		altern05.mensagem = null;
		altern05.prox_cena = -1;

		altern06.opcao = "[G] Colocar Velas no chão. 	\n";
		altern06.mensagem = null;
		altern06.prox_cena = -1;

	cena15.tamanhoCaminhos = 07;
	cena15.tamanhoItem = 00;
	cena15.caminhos[0] = altern00;
	cena15.caminhos[1] = altern01;
	cena15.caminhos[2] = altern02;
	cena15.caminhos[3] = altern03;
	cena15.caminhos[4] = altern04;
	cena15.caminhos[5] = altern05;
	cena15.caminhos[6] = altern06;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena16 = new Cenas();
	cena16.id = 16;
	cena16.titulo = "O Corredor Inferior. 	\n";
	cena16.item = null;

	cena16.descricao = "\t Você está parado no corredor do andar inferior, qual caminho irá escolher ?. 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();
		altern04 = new Alternativas();

		altern00.opcao = "[A] Subir as Escadas. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 12;

		altern01.opcao = "[B] Ir Para a Cozinha.	 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = 13;

		altern02.opcao = "[C] Ir Para a Lavanderia.	\n";
		altern02.mensagem = "Está Vazio 	\n";
		altern02.prox_cena = 14;

		altern03.opcao = "[D] Ir Para o Banheiro Inferior. 	\n";
		altern03.mensagem = null;
		altern03.prox_cena = 15;

		altern04.opcao = "[E] Ir Para a Sala. 	\n";
		altern04.mensagem = null;
		altern04.prox_cena = 05;

	cena16.tamanhoCaminhos = 05;
	cena16.tamanhoItem = 00;
	cena16.caminhos[0] = altern00;
	cena16.caminhos[1] = altern01;
	cena16.caminhos[2] = altern02;
	cena16.caminhos[3] = altern03;
	cena16.caminhos[4] = altern04;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena17 = new Cenas();
	cena17.id = 17;
	cena17.titulo = "O Quintal. 	\n";
	cena17.item = new Itens();

		Itens item07 = new Itens();
		item07.id = 07;
		item07.nome = "Broto";
		item07.texto = "PEGAR BROTO 	\n";
		item07.descricao = "Quem sabe um dia ele pode nos dar muitos frutos. 	\n";
		item07.obtido = false;

	cena17.item[2] = item07;
	cena17.descricao = 	"\t Você está no quintal da casa, aqui fora tem uma pequena lagoa ... Não sei 	\n"~
						"\t\t para que serve uma lagoa tão pequena assim .... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();
		altern04 = new Alternativas();

		altern00.opcao = "[A] Voltar para a cozinha. 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 13;

		altern01.opcao = "[B] Colocar Feijao com algodão na Água.	 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = -1;

		altern02.opcao = "[C] Pegar Broto.	\n";
		altern02.mensagem = null;
		altern02.prox_cena = -2;

	cena17.tamanhoCaminhos = 03;
	cena17.tamanhoItem = 00;
	cena17.caminhos[0] = altern00;
	cena17.caminhos[1] = altern01;
	cena17.caminhos[2] = altern02;
	cena17.caminhos[3] = altern03;
	cena17.caminhos[4] = altern04;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena18 = new Cenas();
	cena18.id = 18;
	cena18.titulo = "O Quarto de Casal. 	\n";
	cena18.item = new Itens();

		Itens item12 = new Itens();
		item12.id = 12;
		item12.nome = "Madeira";
		item12.texto = "PEGAR MADEIRA";
		item12.descricao = "Se descuidar pega cupim. 	\n";
		item12.obtido = false;

		Itens item13 = new Itens();
		item13.id = 13;
		item13.nome = "Revolver";
		item13.texto = "PEGAR REVOLVER 	\n";
		item13.descricao = "Cuidado para onde aponta. 	\n";
		item13.obtido = false;

	cena18.item[0] = item12;
	cena18.item[3] = item13;
	cena18.descricao = "\t Chegando ao quarto você nota que existe apenas um criado mudo e um estrado quebrado nele .... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();
		altern04 = new Alternativas();
		altern05 = new Alternativas();
		altern06 = new Alternativas();

		altern00.opcao = "[A] Pegar Pedaço de Madeira do estrado.	 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = -2;

		altern01.opcao = "[B] Ver criado mudo.	 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = -1;

		altern02.opcao = "[C] Voltar para Corredor Superior. 	\n";
		altern02.mensagem = "Ufa! O monstro está finalmente morto ! 	\n";
		altern02.prox_cena = 21;

		altern03.opcao = "[D] Pegar revolver. 	\n";
		altern03.mensagem = null;
		altern03.prox_cena = -2;

		altern04.opcao = "[E] Atirar na Cabeça. 	\n";
		altern04.mensagem = null;
		altern04.prox_cena = -1;

		altern05.opcao = "[F] Atirar no Peito. 	\n";
		altern05.mensagem = null;
		altern05.prox_cena = -1;

		altern06.opcao = "[G] Atirar na Perna. 	\n";
		altern06.mensagem = null;
		altern06.prox_cena = -1;


	cena18.tamanhoCaminhos = 07;
	cena18.tamanhoItem = 02;
	cena18.caminhos[0] = altern00;
	cena18.caminhos[1] = altern01;
	cena18.caminhos[2] = altern02;
	cena18.caminhos[3] = altern03;
	cena18.caminhos[4] = altern04;
	cena18.caminhos[5] = altern05;
	cena18.caminhos[6] = altern06;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena19 = new Cenas();
	cena19.id = 19;
	cena19.titulo = "O Quarto de Hóspedes. 	\n";
	cena19.item = new Itens();

		Itens item11 = new Itens();
		item11.id = 11;
		item11.nome = "Livro de Receitas Magicas";
		item11.texto = "PEGAR LIVRO DE RECEITAS MAGICAS	DO CHÃO	";
		item11.descricao = "\t\t\t			 			Portal Etéreo

			 				\t O feitiço do portal etéreo pode abrir dimensões desconhecidas
			 				\t para qualquer lugar ou tempo, tenha muito cuidado para onde deseja ir...

			 				\tPrimeiramente tenha em mãos os ingredientes:
			 				\t\t	Cinzas, um broto qualquer e velas

		 					\tPara a realização correta do feitiço deve -se seguir esta ordem
		 					\t\t	.Três descargas
		 					\t\t	.Desenhe um pentagrama
		 					\t\t	.Coloque as velas
		 					\t\t	.Coloque o broto
		 					\t\t\t\t					CUIDADO ! NÃO ERRE A ORDEM 				\n\n\n";

		item11.obtido = false;

	cena19.item[1] = item11;

	cena19.descricao = "\t Você entra no quarto de hóspedes [SOM DE PORTA SE FECHANDO] e observa.... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();

		altern00.opcao = "[A] Voltar para Corredor Superior.	 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 21;

		altern01.opcao = "[B] Pegar Livro de Receitas Magicas no chão.	 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = -2;

	cena19.tamanhoCaminhos = 02;
	cena19.tamanhoItem = 01;
	cena19.caminhos[0] = altern00;
	cena19.caminhos[1] = altern01;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena20 = new Cenas();
	cena20.id = 20;
	cena20.titulo = "O Bannheiro Superior. 	\n";
	cena20.item = new Itens();

		Itens item06 = new Itens();
		item06.id = 06;
		item06.nome = "Algodao";
		item06.texto = "PEGAR ALGODÃO 	\n";
		item06.descricao = "Um pequeno pedaço de algodão, se houvesse mais, poderia usalos em meus ferimentos. \n";
		item06.obtido = false;

		Itens item14 = new Itens();
		item14.id = 14;
		item14.nome = "Remedio";
		item14.texto = "PEGAR REMEDIO 	\n";
		item14.descricao = "Isso pode me curar. 	\n";
		item14.obtido = false;

	cena20.item[4] = item06;
	cena20.item[5] = item14;

	cena20.descricao = "\t Chegando ao banheiro, você percebe que este é muito semelhante ao banheiro do andar de baixo .... 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();
		altern04 = new Alternativas();
		altern05 = new Alternativas();


		altern00.opcao = "[A] Apertar Descarga.	 	\n";
		altern00.mensagem = "hmmm.... 	\n";
		altern00.prox_cena = -1;

		altern01.opcao = "[B] Abrir Torneira. 	 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = -1;

		altern02.opcao = "[C] Abrir Espelho 	 	\n";
		altern02.mensagem = null;
		altern02.prox_cena = -1;

		altern03.opcao = "[D] Voltar ao Corredor Superior.	 	\n";
		altern03.mensagem = null;
		altern03.prox_cena = 21;

		altern04.opcao = "[E] Pegar Algodão. 	 	\n";
		altern04.mensagem = null;
		altern04.prox_cena = -2;

		altern05.opcao = "[F] Pegar Remedio.	 	\n";
		altern05.mensagem = null;
		altern05.prox_cena = -2;

	cena20.tamanhoCaminhos = 06;
	cena20.tamanhoItem = 02;
	cena20.caminhos[0] = altern00;
	cena20.caminhos[1] = altern01;
	cena20.caminhos[2] = altern02;
	cena20.caminhos[3] = altern03;
	cena20.caminhos[4] = altern04;
	cena20.caminhos[5] = altern05;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena21 = new Cenas();
	cena21.id = 21;
	cena21.titulo = "O Corredor Superior. 	\n";
	cena21.item = null;

	cena21.descricao = "\t Você está parado no corredor do andar superior, qual caminho irá escolher ?. 	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();
		altern03 = new Alternativas();

		altern00.opcao = "[A] Ir para o Quarto de Casal.	 	\n";
		altern00.mensagem = null;
		altern00.prox_cena = 18;

		altern01.opcao = "[B] Ir para o Quarto de Hóspedes. 	 	\n";
		altern01.mensagem = null;
		altern01.prox_cena = 19;

		altern02.opcao = "[C] Ir para o Banheiro Superior. 	 	\n";
		altern02.mensagem = null;
		altern02.prox_cena = 20;

		altern03.opcao = "[D] Voltar para o Andar Inferior.	 	\n";
		altern03.mensagem = null;
		altern03.prox_cena = 16;

	cena21.tamanhoCaminhos = 04;
	cena21.tamanhoItem = 00;
	cena21.caminhos[0] = altern00;
	cena21.caminhos[1] = altern01;
	cena21.caminhos[2] = altern02;
	cena21.caminhos[3] = altern03;

//---------------------------------------------------------------------------------------------------------------------------

	Cenas cena22 = new Cenas();
	cena22.id = 22;
	cena22.titulo = "O Fim 	\n";
	cena22.item = null;

	cena22.descricao =	"\t Um portal se abre e você acorda em outro lugar escuro ...."~
						"\n\n\n\n \t\t\t\t\t Fim de jogo. 	\n\n\n";

	cena22.tamanhoCaminhos = 00;
	cena22.tamanhoItem = 00;

//---------------------------------------------------------------------------------------------------------------------------

	jogo.vetor_Cenas[0] = cena00;
	jogo.vetor_Cenas[1] = cena01;
	jogo.vetor_Cenas[2] = cena02;
	jogo.vetor_Cenas[3] = cena03;
	jogo.vetor_Cenas[4] = cena04;
	jogo.vetor_Cenas[5] = cena05;
	jogo.vetor_Cenas[6] = cena06;
	jogo.vetor_Cenas[7] = cena07;
	jogo.vetor_Cenas[8] = cena08;
	jogo.vetor_Cenas[9] = cena09;
	jogo.vetor_Cenas[10] = cena10;
	jogo.vetor_Cenas[11] = cena11;
	jogo.vetor_Cenas[12] = cena12;
	jogo.vetor_Cenas[13] = cena13;
	jogo.vetor_Cenas[14] = cena14;
	jogo.vetor_Cenas[15] = cena15;
	jogo.vetor_Cenas[16] = cena16;
	jogo.vetor_Cenas[17] = cena17;
	jogo.vetor_Cenas[18] = cena18;
	jogo.vetor_Cenas[19] = cena19;
	jogo.vetor_Cenas[20] = cena20;
	jogo.vetor_Cenas[21] = cena21;
	jogo.vetor_Cenas[22] = cena22;
}

void limparTela(){
	system("clear");
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


int apresentarCena(Game jogo){
	int numero_cena = jogo.cena_Atual;
	char entradaTeclado;
	int entradaTecladoConvertido = -1;
	int tam_caminhos = jogo.vetor_Cenas[numero_cena].tamanhoCaminhos;


	writefln("\n\nCena atual: %d\n\n\n\n\n\n\n",numero_cena);
	writef("Titulo: %s\n",jogo.vetor_Cenas[numero_cena].titulo);
	writef("Descricao: %s",jogo.vetor_Cenas[numero_cena].descricao);


	for(int k=0;k<jogo.vetor_Cenas[numero_cena].tamanhoCaminhos;k++){
		addSom(numero_cena);
		if (jogo.vetor_Cenas[numero_cena].caminhos[k].ver_Opcao == true){
			if(numero_cena==18 &&(k==4 || k==5 || k==6 )){
				soundPlayer("soundEffects/magnum.mp3");
			}else if(numero_cena==14 &&(k==1)){
				soundPlayer("soundEffects/tosse.mp3");
			}
			writef("\t%s ",jogo.vetor_Cenas[numero_cena].caminhos[k].opcao);
		}
	}

	if (jogo.vetor_Cenas[numero_cena].recebe_Dano == true){
		receber_Dano(jogo,numero_cena);	
	}	

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

	}
	return 0;
}

void sair_Jogo(){
	killSound();	
	exit(0);
}

void receber_Dano(Game jogo,int numero_cena){
	writefln("\n\n\n<DANO -%d>",jogo.vetor_Cenas[numero_cena].dano[0]);
	jogo.vida = jogo.vida - jogo.vetor_Cenas[numero_cena].dano[0];
}

void verInventario(Game jogo){
	char teclado;

	writefln("Eperte \"Q\" para sair!");
	while((teclado != 'q') && (teclado != 'Q')){	
		for(int i=0;i<jogo.bolsa.qtd_Inventario;i++){
			writef("Nome: %s\n",jogo.bolsa.itensObtidos[i].nome);
			writef("Texto: %s\n",jogo.bolsa.itensObtidos[i].texto);
			writef("Descricao: %s\n",jogo.bolsa.itensObtidos[i].descricao);
		}
		stdout.flush();
		scanf("%s", &teclado);
	}
}


void adicionarInventario(Game jogo,Itens itemAdquirido){
	jogo.bolsa.itensObtidos[jogo.bolsa.qtd_Inventario] = itemAdquirido;
	jogo.bolsa.qtd_Inventario++;
}

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

void main()
{
	Game jogo = new Game();
	int cena=0;
	IniciarlizarCenas(jogo);
	string musicaAmbiente = "soundEffects/ambientMusic.mp3";

	if(testaSom()){
		soundPlayerAmbiente(musicaAmbiente);
	} else {
		write("mpg123 não localizado no sistema.\n Os sons do jogo não serão reproduzidos");
	}

	while(cena != 22){
		limparTela();
		cena = apresentarCena(jogo);
	}

	killSound();




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

}
