#region variaveis
//Posição inicial
_x = x
_y = y

image_xscale = 1.3;
image_yscale = 1.3;

//Tiro
timer_tiro = 0;

//Descobrindo se o inimigo esta numa sequencia
criado_sequencia = in_sequence;

//iniciando efeitos
inicia_efeito_dano();
inicia_efeito_mola();
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
				estado = choose("atirando","atirando2");

				//Zerando o timer
				timer_tiro = 0;
			}
		break;
		
		case "atirando":
			//criando o tiro
			var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro1_tengu)
			
			//Dando play no som
			audio_play_sound(snd_tiro_1,1,false);
			
			//Trocando de estado
			estado = "carregando";
		break;
		
		case "atirando2":
			//criando o tiro
			var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro2_tengu)
			
			if(instance_exists(obj_player)){
				var _dir = point_direction(x,y,obj_player.x,obj_player.y)
				_tiro.direction = _dir
			}
			
			//Dando play no som
			audio_play_sound(snd_tiro_1,1,false);
			
			//Trocando de estado
			estado = "carregando";
		break;
	}
	
	//Verificando a posição do inimigo
	_x = x
	_y = y
	
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
		
		//Definindo valores dos efeitos
		efeito_mola(2,.5)
		timer_efeito_dano(5);
	}
	
	//Verificando se o inimigo morreu
	if vida == 0{
		//Roando a função de se destruir
		sendo_destruido(obj_mt_tengu)
		
		//Fazemdo a tela termer
		screenshake(10);
		
		//Dando pontos
		global.pontos += pontos;
		
		//Fazendo ele dropar o power up
		drop(chance_drop,obj_power_up);
	}
}
#endregion