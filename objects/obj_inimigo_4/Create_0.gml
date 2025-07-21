#region variaveis
vidas = 6
vel = 1
tempo_tiro = game_get_speed(gamespeed_fps) * 1.5;
timer_tiro = 0
estado = "movendo"
#endregion

#region metodos
state_machine = function(){
	switch(estado){
		case "movendo":{
			if hspeed == 0 && vspeed = 0{
				estado = "carregando";
			}
		}break;
		
		case "carregando":{
			timer_tiro--;
			
			if timer_tiro < 0{
				estado = "atirando";
				timer_tiro = tempo_tiro;
			}
		}break;
		
		case "atirando":{
			var _tipo = choose(1,2);
			
			if _tipo == 1{
					var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro_inimigo_4);
				_tiro.vspeed = 2;
			
				estado = "carregando";
			}
			
			if _tipo == 2{
				var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro_inimigo_4b);
				_tiro.vspeed = 3;
			
				estado = "carregando";
			}
		}break;
	}
}

morrendo = function(){
	if vidas > 0{
		vidas--;
		screenshake(5);
	}
	
	if vidas == 0{
		sendo_destruido(obj_explosao_2);
		screenshake(10);
		global.pontos += 300;
		drop(60,obj_power_up);
	}
}
#endregion