#region variaveis
vidas = 4;
timer_explosao = game_get_speed(gamespeed_fps) * 4;
#endregion

#region metodos
seguir_player = function(){
	if instance_exists(obj_player){
		var _dir = point_direction(x,y,obj_player.x,obj_player.y);
	
		direction = _dir;
		image_angle = _dir+90
		
		timer_explosao--;
		
		if timer_explosao < 0 || place_meeting(x+20,y+20,obj_player) || place_meeting(x-20,y+20,obj_player){
			instance_create_layer(x,y,layer,obj_area_explosao);
			instance_destroy();
		}
	}
}

morrendo = function(){
	if vidas > 0{
		vidas--;
	}
	if vidas == 0{
		sendo_destruido(obj_explosao_1);		
	}
}
#region