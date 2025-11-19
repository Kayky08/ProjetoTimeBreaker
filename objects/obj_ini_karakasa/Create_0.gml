#region variaveis
image_xscale = 1.3
image_yscale = 1.3

vidas = 10
estado = "movendo";
#endregion

#region metodos
morrendo = function(){
	if vidas > 0{
		vidas--;
		screenshake(5);
	}
	if vidas == 0{
		sendo_destruido(obj_mt_karakasa);
		
		screenshake(10);
		global.pontos += 200;
		
		drop(50,obj_power_up);
	}
}
#endregion