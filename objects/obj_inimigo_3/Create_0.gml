#region variaveis
vidas = 10
vel = 4
tempo_dash = game_get_speed(gamespeed_fps) * .25;
estado = "movendo";
#endregion

#region metodos
ataque = function(){
	switch(estado){
		case "movendo":{
			if hspeed == 0 && vspeed == 0{
				estado = "dash"
			}
		}break;
		
		case "dash":{
			tempo_dash--;
		
			if tempo_dash <= 0{
				vspeed = 20;
				
				if(y > room_height + 30){
					instance_destroy();
				}
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
		sendo_destruido(obj_explosao_3);
		
		screenshake(10);
		global.pontos += 200;
		
		drop(50,obj_power_up);
	}
}
#endregion