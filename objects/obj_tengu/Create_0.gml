#region variaveis
//Posição inicial
_x = x
_y = y

image_xscale = 2;
image_yscale = 2;

//Tiro
timer_tiro = 0;

//Descobrindo se o inimigo esta numa sequencia
criado_sequencia = in_sequence;
#endregion

#region metodos
maquina_estado = function(){
	switch(estado){
		case "movendo":
			//Verificando se o objeto esta se movendo
			if (x != _x || y != _y){
				//Trocando de estado
				estado = "movendo"
			}
			else{
				//Trocando de estado
				estado = "carregando";
			}
		break;
		
		case "carregando":
			//Verificando se o objeto esta se movendo
			if (x != _x || y != _y){
				//Trocando de estado
				estado = "movendo"
			}
			else{
				//Aumentando o timer de carregamento
				timer_tiro++

				//Verificando se o timer chegou no limite de tempo
				if(timer_tiro >= espera_tiro){
					//Trocando de estado
					estado = choose("atirando","atirando2");

					//Zerando o timer
					timer_tiro = 0;
				}
			}
		break;
		
		case "atirando":
			//criando o tiro
			var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro3_tengu)
	
			//definindo a velocidade do tiro
			_tiro.vspeed = vel_tiro;
			
			//Verificando se o player existe
			if(instance_exists(obj_player)){
				//Pegando a localização do player
				var _dir = point_direction(x,y,obj_player.x,obj_player.y)
				
				//Fazendo com que o tiro siga o player
				_tiro.direction = _dir
				_tiro.image_angle = _dir + 90;
			}
			
			//Dando play no som
			audio_play_sound(snd_tiro_1,1,false);
			
			//Trocando de estado
			estado = "carregando";
		break;
		
		case "atirando2":
			//criando o tiro
			var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro2_tengu)
	
			//definindo a velocidade do tiro
			_tiro.vspeed = 3;
			
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