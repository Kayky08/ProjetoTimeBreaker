#region variaveis
//Posição inicial
_x = x
_y = y

besq = instance_create_layer(x-x/2, y, "Inimigos",obj_oodokuro_besq);
bdir = instance_create_layer(x+x/2, y, "Inimigos",obj_oodokuro_bdir);

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
			//Verificando se o timer chegou no limite de tempo
			if (x != _x || y != _y){
				estado = "movendo"
			}
			else{
				//Aumentando o timer de carregamento
				timer_tiro++
				
				if(timer_tiro >= espera_tiro){
					//Trocando de estado
					estado = "atacando";
					
					//Zerando o timer		
					timer_tiro = 0;
				}
			}
		break;
		
		case "atacando":
			//Chamando a função para criar o tiro
			
			bdir.vspeed = 5;
			
			
			//Trocando de estado
			
		break;
	}
	
	//Verificando a posição atual
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