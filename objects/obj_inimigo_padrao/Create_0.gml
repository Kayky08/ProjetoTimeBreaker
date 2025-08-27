#region variaveis
//Tiro
timer_tiro = 0;

//Descobrindo se o inimigo esta numa sequencia
criado_sequencia = in_sequence;
#endregion

#region metodos
atirar = function(){
	atirando(obj_tiro_inimigo,5,snd_tiro_2, 3);
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

alarm[0] = random_range(.5,2) * game_get_speed(gamespeed_fps);