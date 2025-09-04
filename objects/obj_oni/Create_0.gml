#region variaveis
//Tiro
timer_tiro = 0;

//Descobrindo se o inimigo esta numa sequencia
criado_sequencia = in_sequence;
#endregion

#region metodos
maquina_estado = function(){
	switch(estado){
		case "movendo":
			//Verificando se o inimigo esta parado
			if(hspeed = 0 && vspeed = 0){
				//Trocando de estado
				estado = "carregando";
			}
		break;
		
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
			atirar(obj_tiro_oni,vel_tiro,snd_tiro_1,0,0)
			
			//Trocando de estado
			estado = "carregando";
		break;
	}
}
morrendo = function(){
	//Verificando se o inimigo ainda possui vida
	if vida >= 1{
		//Fazendo ele levar dano
		vida--;
		
		//Fazendo a tela tremer
		screenshake(5);
	}
	
	//Verificando se o inimigo morreu
	if vida == 0{
		//Roando a função de se destruir
		sendo_destruido(obj_explosao_3)
		
		//Fazemdo a tela termer
		screenshake(10);
		
		//Dando pontos
		global.pontos += 100;
		
		//Fazendo ele dropar o power up
		drop(90,obj_power_up);
	}
}
#endregion
