#region variaveis
global.qtd_inimigos += 1;

//Tiro
timer_tiro = 0;

//Iniciando efeitos
inicia_efeito_mola()
inicia_efeito_dano()

//Descobrindo se o inimigo esta numa sequencia
criado_sequencia = in_sequence;
#endregion

#region metodos
maquina_estado = function(){
	switch(estado){
		case "carregando":
			//Aumentando o timer de carregamento
			timer_tiro++
			
			//Verificando se o timer chegou no limite de tempo
			if(timer_tiro >= espera_tiro){
				//Trocando de estado
				estado = "atirando";
					
				//Zerando o timer		
				timer_tiro = 0;
			}
		break;
		
		case "atirando":
			//Chamando a função para criar o tiro
			atirar(obj_tiro_corpo_seco,snd_tiro_1,0,0)
			
			//Trocando de estado
			estado = "carregando";
		break;
	}
	
	//Verificando se o inimigo não esta mais na sequencia e o destruindo
	if(!in_sequence){
		instance_destroy()
		global.qtd_inimigos -= 1;
	}
}
morrendo = function(){
	//Verificando se o inimigo ainda possui vida
	if vida >= 1{
		//Fazendo ele levar dano
		vida--;
		
		//Fazendo a tela tremer
		screenshake(5);
		
		//Definindo efeitos
		efeito_mola(2,.5);
		timer_efeito_dano(5);
	}
	
	//Verificando se o inimigo morreu
	if vida == 0{
		//Roando a função de se destruir
		sendo_destruido(obj_mt_corpo_seco)
		
		//Fazemdo a tela termer
		screenshake(10);
		
		//Dando pontos
		global.pontos += pontos;
		
		//Fazendo ele dropar o power up
		drop(chance_drop,obj_power_up);
	}
}
#endregion