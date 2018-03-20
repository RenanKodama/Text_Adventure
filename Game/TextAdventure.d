import std.stdio;



class Invetario
{
	Itens[20] itensObtidos;
}

class Cenas
{
	int 	id;
	string 	titulo;
	Itens[10] item;
	string 	descricao;	
	Alternativas[10] caminhos;
}	

class Alternativas{
	string opcao;
	int prox_cena;
}

class Itens
{
	int 	id;
	string 	nome;
	string	texto;
	string 	descricao;
	bool 	obtido;
}


void IniciarlizarCenas()
{
	Alternativas altern00;
	Alternativas altern01;
	Alternativas altern02;
	Alternativas altern03;
	Alternativas altern04;
	Alternativas altern05;


	Cenas cena00 = new Cenas();
	cena00.id = 00;
	cena00.titulo = "Prologo.	\n";
	cena00.item = null;
	cena00.descricao = "\t Quando você se da conta, esta em um lugar totalmente diferente do acostumado, \n
						\t nao se lembra como foi parar la e muito menos onde está, tudo e muito escuro, \n
						\t voce carrega apenas uma mochila nas costas.	\n\n\n";
		
		altern00 = new Alternativas();
		altern00.opcao = "[A] Andar para Frente.	\n";
		altern00.prox_cena = 01;

	cena00.caminhos[0] = altern00;



	Cenas cena01 = new Cenas();
	cena01.id = 01;
	cena01.titulo = "A Floresta part. 1.	\n";
	cena01.item = null;
	cena01.descricao = "\t Voce nao consigue ver nada a frente, você comeca a se apavorar e sua respiracao \n
						\t se torna ofegante, quando de repente você escuta galhos se quebrando [SOM DE 	\n
						\t GALHOS QUEBRANDO],  entao você decide .... 	\n\n\n";
		
		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern02 = new Alternativas();		
		altern00.opcao = "[A] Andar para Frente com caltela. 	\n";
		altern00.prox_cena = 02;
		altern01.opcao = "[B] Correr para Frente. 	\n";
		altern01.prox_cena = 03;
		altern02.opcao = "[C] Andar para Esquerda e se Espreitar nos arbustos. 	\n";
		altern02.prox_cena = 04;

	cena01.caminhos[0] = altern00;
	cena01.caminhos[1] = altern01;
	cena01.caminhos[2] = altern02;



	Cenas cena02 = new Cenas();
	cena02.id = 02;
	cena02.titulo = "A Floresta part. 2.	\n";
	cena02.item = null;
	cena02.descricao = "\t Voce anda com cautela para frente porem e surpreendido pelas costas por uma \n
						\t criatura indescritivel e apavorante, aos berros ela te ataca {vida -4}, com \n
						\t seu corpo ferido você decide ....	\n\n\n";

		altern00 = new Alternativas();
		altern01 = new Alternativas();
		altern00.opcao = "[A] Correr para Frente. 	\n ";
		altern00.prox_cena = 03;
		altern01.opcao = "[B] Enfrentar o Monstro. 	\n";
		altern01.prox_cena = 06;

	cena02.caminhos[0] = altern00;
	cena02.caminhos[1] = altern01;



	Cenas cena03 = new Cenas();
	cena03.id = 03;
	cena03.titulo = "A Floresta part. 3.	\n";
	cena03.item = null;
	cena03.descricao = "\t Voce decide correr para frente com medo, desviando de arbustos e arvores que mal 	\n
						\t podiam serem vistas no escuro, ate que voce desliza e cai de um barranco {vida -1}.	\n
						\t Atordoado voce se levanta e observa uma luz em meio a escuridao.	\n";


	Cenas cena04 = new Cenas();
	cena04.id = 04;
	cena04.titulo = "A Floresta part. 4.	\n";
	cena04.item = null;
	cena04.descricao = "\t Voce decide ficar espreitado nos arbustos, quando a criatura assombrosa passa diante 	\n
						\t de voce, porém e impossivel distiguila de um animal ou de um humano. Apavorado você 		\n
						\t espera a criatura se perder em meio a escuridao. Então voce se depara com uma luz 		\n
						\t em meio as arvores. 	\n\n\n";


	Cenas cena05 = new Cenas();
	cena05.id = 05;
	cena05.titulo = "A Sala.	\n";

		Itens item09 = new Itens();
		item09.id = 09;
		item09.nome = "Cinzas";
		item09.texto = "PEGAR CINZAS. 	\n";
		item09.descricao = "\t Do po viestes, ao po voltaras ....	\n";
		item09.obtido = false;	

	cena05.item[9] = item09;
	cena05.descricao = "\t Voce decide ficar na sala, e oberva que neste lugar existe uma lareira ....	\n\n\n";


	Cenas cena06 = new Cenas();
	cena06.id = 06;
	cena06.titulo = "GAME OVER !. 	\n";
	cena06.item = null;
	cena06.descricao = "\t Você morreu destroçado pelo monstro !	\n
						\t\t 		GAME OVER !						\n\n

						\t dica: combate corpo a corpo e morte certa !	\n";


	Cenas cena07 = new Cenas();
	cena07.id = 07;
	cena07.titulo = "A Floresta part. 5.	\n";
	cena07.item = null;
	cena07.descricao = "\t A cada passo que voce se aproxima da luz, percebe que se trata de uma simples casa 	\n
						\t abandonada. Voce para em frente dela e decide ....	\n\n\n";


	Cenas cena08 = new Cenas();
	cena08.id = 08;
	cena08.titulo = "A Casa. 	\n";
	cena08.item = null;
	cena08.descricao = "\t Ao vasculhar a casa voce percebe uma caixa de correrios e uma oficina na garagem com 	\n
						\t as portas abertas. Voce decide .... 	\n\n\n";


	Cenas cena09 = new Cenas();
	cena09.id = 09;
	cena09.titulo = "A Garagem. 	\n";

		Itens item01 = new Itens();
		item01.id = 01;
		item01.nome = "Pedaco de Arame";
		item01.texto = "PEGAR PEDACO DE ARAME. 	\n";
		item01.descricao = "\t Talvez se combinar com outra coisa se torne mais util. 	\n";
		item01.obtido = false;

	cena09.item[1] = item01;
	cena09.descricao = "\t Ao chegar na garagem você comeca a vasculhar ....	\n\n\n";


	Cenas cena10 = new Cenas();
	cena10.id = 10;
	cena10.titulo = "A Caixa. 	\n";

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

	cena10.item[4] = item04;
	cena10.descricao = "\t Voce chega a caixa de correios e a abre .... 	\n\n\n";









}







void main()
{

}