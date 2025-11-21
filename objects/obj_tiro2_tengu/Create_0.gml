timer_explosao = 0;
espera_explosao = 60

explodir = function(){
	timer_explosao++
	
	if(timer_explosao >= espera_explosao){
		instance_destroy()

		var _angulo;

		if (instance_exists(obj_player)){ 
			_angulo = point_direction(x,y,obj_player.x,obj_player.y);
		}
		else{
			_angulo = 0;
		}

		repeat(5){

			var _tiro = instance_create_layer(x,y,"Tiro",obj_subtiro_tengu)
	
			_tiro.speed = 5;
			_tiro.direction = _angulo
			_tiro.image_angle = _angulo + 90
			_angulo += 72;
		}
	}
}