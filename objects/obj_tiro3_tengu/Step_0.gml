if(global.pause){
	vspd = vspeed
	
	vspeed = 0;
	image_speed = 0
}
else{
	vspeed = vspd;
	image_speed = 1;	
}

seguir_player();