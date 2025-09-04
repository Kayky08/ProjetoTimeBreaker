#region variaveis
vidas = 10;
estado = "chegando";

tempo_carregando = game_get_speed(gamespeed_fps) * .8;
timer_carregando = 0;
contador = 0;
decidindo_direcao = false;

criado_sequencia = in_sequence;
#endregion

#region metodos
//State machine
maquina_de_estado = function(){
	//Chega a variavel em varios tipos de casos
	switch(estado){
		//Casos
		case "chegando":{
			//Fazendo o inimigo ir até a o ponto certo
			if hspeed == 0 && vspeed == 0{
				//Trocando o estado do inimigo
				estado = "carregando"
			}
		}break;
		
		case "carregando":{
			vspeed = 0;
			
			//Fazendo o timer chegar até o tempo certo
			timer_carregando++;
			
			if(timer_carregando >= tempo_carregando){
				//Trocando de estado
				estado = choose("atirando","atirando2");
				
				//Resetando o timer
				timer_carregando = 0;
				
				//Aumentando o contador
				contador++;
			}
		}break
		
		case "atirando":{
			//Checando se o player existe e econtrando a direção dele
			if instance_exists(obj_player){
				var _dir = point_direction(x,y,obj_player.x,obj_player.y);

				//criando o tiro
				var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro_inimigo_3a);
				_tiro.speed = 5;
				_tiro.direction = _dir;
				_tiro.image_angle = _dir + 90;
			}
			
			//trocando o estado
			estado = "carregando";
		}break;
		
		case "atirando2":{			
			//Variavel para definir o angulo inicial do tiro
			var _angulo = 255;
			
			//Criando o tiro 
			repeat(3){
				//Criando o tiro
				var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro_inimigo_3b);
				_tiro.speed = 4;
				_tiro.direction = _angulo;
				
				_angulo += 15;
			}
			
			//Verificando se o inimigo ja deu 3 tiros
			//trocando o estado
			estado = "carregando";
		}break;
	}
}

morrendo = function(){
	//Verificando se o inimigo ainda possui vida
	if vidas >= 1{
		//Fazendo ele levar dano
		vidas--;
		
		//Fazendo a tela tremer
		screenshake(5);
	}
	
	//Verificando se o inimigo morreu
	if vidas == 0{
		//Roando a função de se destruir
		sendo_destruido(obj_explosao_3)
		//Fazemdo a tela termer
		screenshake(10);
		//Dando pontos
		global.pontos += 300;
		
		//Fazendo ele dropar o power up
		drop(70,obj_power_up);
	}
}
#endregion