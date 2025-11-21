if(global.pause){
	vspeed = 0;	
	hspeed = 0;
	image_speed = 0;
}
else{
	//Pegando a localização do player
	dir = point_direction(x,y,obj_player.x,obj_player.y)
				
	//Fazendo com que o tiro siga o player
	direction = dir
	image_angle = dir + 90;
	
	vspeed = vspd;
	image_speed = 1;
}