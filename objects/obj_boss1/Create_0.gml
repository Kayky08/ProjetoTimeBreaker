#region variaveis
//atributos
vel = 3;
vidas = 150;

//Tiro
timer_tiro = 0;
tempo_tiro = game_get_speed(gamespeed_fps) * 2;
direita = true;

//Estado
estado = "movendo";

#endregion

#region metodos
//State Machine
state_machine = function(){
	switch(estado){
		case "movendo":{
			vspeed = 1
			
			if y == 128{
				vspeed = 0;
				estado = "carregando";
			}
		}break
		
		case "carregando":{
			timer_tiro--;
			
			if timer_tiro <= 0{
				estado = "atirando";
			} 
		}break
		
		case "atirando":{
			var _tipo = choose(1,2,3);
			var _x = 20;
			var _contador = 0;
			
			if(_tipo = 1){
				repeat(5){
					var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro_boss1);
					_tiro.vspeed = random_range(3,6);
					_tiro.hspeed = random_range(-3,3);
				}
			
				timer_tiro = tempo_tiro;
				estado = "carregando";
			}
			
			if(_tipo = 2){
				var _x = 20;
				var _y = 0;
				
				repeat(3){
					if direita {
						repeat(3){
							var _tiro = instance_create_layer(x-_x,y-_y,"Tiro",obj_tiro_boss1)
							_tiro.vspeed = 3;
							_x += 20;
							}
					
							direita = false;
					}
					else{
						repeat(3){
							var _tiro = instance_create_layer(x+_x,y-_y,"Tiro",obj_tiro_boss1)
							_tiro.vspeed = 3;
							_x += 20;
						}
						
						direita = true
					}
					
					_x = 20;
					_y += 25;
				}
				
				timer_tiro = tempo_tiro;
				estado = "carregando";
			}
			
			if _tipo = 3{
				if instance_exists(obj_player){
					var _dir = point_direction(x,y,obj_player.x,obj_player.y);
					var _x = 0;
					var _y = 0;
				
				
					repeat(4){
						var _tiro = instance_create_layer(x+_x,y+_y,"Tiro",obj_tiro_boss1);
						_tiro.vspeed = 5.5;
						_tiro.direction = _dir;
						_x+=20;
						_y+=20;
					}
					
					timer_tiro = tempo_tiro;
					estado = "carregando";
				}
				else{
					timer_tiro = tempo_tiro;
					estado = "carregando";
				}
			}
			
		}break
	}
}

morrendo = function(){
	if vidas >= 1{
		vidas--;
	}
	else{
		sendo_destruido(obj_explosao_3);
		global.pontos += 1000;
		room_goto_next();
	}
}

#endregion