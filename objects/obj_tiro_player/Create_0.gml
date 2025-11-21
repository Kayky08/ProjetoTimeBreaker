#region variaveis
image_xscale = 2
image_yscale = 2
vspeed = -1
#endregion
#region metodos
morrendo = function(){
	instance_destroy();
	
	instance_create_layer(x,y,layer,obj_exp_tiro_player);
}
#endregion