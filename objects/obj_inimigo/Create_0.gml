#region variaveis
vidas = 2;

//Tiro
timer_tiro = 0;
espera_tiro = 120;

//Descobrindo se o inimigo esta numa sequencia
criado_sequencia = in_sequence;

#endregion

#region metodos
atirando = function(){
	//verficia se o tempo do tiro esta zerado
	if(timer_tiro < 0){
		//cria o tiro
		var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro_inimigo)
	
		//define uma velocidade para o tiro
		_tiro.vspeed = 5;
		
		//Dando play no som
		audio_play_sound(snd_tiro_2,1,false);
		
		//reinicia o timer
		timer_tiro = espera_tiro;
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
		global.pontos += 100;
		
		//Fazendo ele dropar o power up
		drop(90,obj_power_up);
	}
}
#endregion