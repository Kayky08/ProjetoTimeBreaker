#region variaveis
vidas = 10;
tempo_tiro = game_get_speed(gamespeed_fps) * 2;
timer_tiro = 0;
estado = "movendo"
#endregion

#region metodos
state_machine = function(){
	switch(estado){
		case "movendo":{
			if hspeed == 0{
				estado = "carregando";
				timer_tiro = tempo_tiro
			}
		}break;
		case "carregando":{
			timer_tiro--;
			
			if timer_tiro < 0{
				estado = "atirando";
			}
		}break;
		case "atirando":{
			var _tiro = instance_create_layer(x,y,layer,obj_inimigo_5);
			
			estado = "carregando";
			timer_tiro = tempo_tiro
		}break;
	}
}

morrendo = function(){
	if vidas > 0{
		vidas--;
	}
	
	if vidas == 0{
		sendo_destruido(obj_area_explosao_2);
	}
}
#endregion