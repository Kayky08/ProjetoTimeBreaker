instance_destroy()

var _angulo;

if (instance_exists(obj_player)){ 
	_angulo = point_direction(x,y,obj_player.x,obj_player.y);
}
else{
	_angulo = 0;
}

repeat(5){

	var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro1_tengu)
	
	_tiro.speed = 5;
	_tiro.image_angle = _angulo
	_tiro.direction = _angulo
	
	_angulo += 72;
}