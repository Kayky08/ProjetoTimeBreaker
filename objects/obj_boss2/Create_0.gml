#region variavies
vidas = 150;
tempo_tiro = game_get_speed(gamespeed_fps) * 2;
timer_tiro = 0;
estado = "movendo";
#endregion

#region metodos
state_machine = function(){
	switch(estado){
		case "movendo":{
			if hspeed == 0 && vspeed == 0{
				estado = "carregando";
				timer_tiro = tempo_tiro;
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
			var _tipo = choose("1","2","3");
			
			switch(_tipo){
				case "1":{
					var _x = 20;
					
					repeat(2){
						var _tiro = instance_create_layer(x + _x,y,"Tiro",obj_tiro_inimigo_4);
						_tiro.vspeed = 2;
						_x += 20;
					}
					
					_x = 20
					
					repeat(2){
						var _tiro = instance_create_layer(x - _x,y,"Tiro",obj_tiro_inimigo_4);
						_tiro.vspeed = 2;
						_tiro.vidas = 2;
						_x -= 20;
					}
					estado = "carregando";
				}break;
				
				case "2":{
					repeat(5){
						var _tiro = instance_create_layer(x,y,"Tiro",obj_inimigo_5);
					}
					
					estado = "carregando";
				}break;
				
				case "3":{
					var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro_inimigo_4b);
					_tiro.vspeed = 3
					
					var _tiro = instance_create_layer(x - 20,y,"Tiro",obj_tiro_inimigo_4b);
					_tiro.vspeed = 3
					
					var _tiro = instance_create_layer(x + 20,y,"Tiro",obj_tiro_inimigo_4b);
					_tiro.vspeed = 3
					
					estado = "carregando";
				}break;
			}
		}
	}
}
morrendo = function(){
	if vidas > 0{
		vidas--;
	} 
	if vidas == 0{
		sendo_destruido(obj_explosao_3);
		global.pontos += 1000;
	}
}
#endregion