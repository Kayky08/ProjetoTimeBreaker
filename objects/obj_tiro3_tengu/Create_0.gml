#region variaveis
image_xscale = 2
image_yscale = 2

vidas = 2
#endregion

#region metodos
seguir_player = function(){
	if instance_exists(obj_player){
		var _dir = point_direction(x,y,obj_player.x,obj_player.y);
	
		direction = _dir;
		image_angle = _dir+90
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
#endregion