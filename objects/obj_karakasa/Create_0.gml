#region variaveis
image_xscale = 2
image_yscale = 2

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
		sendo_destruido(obj_explosao_3);
		
		screenshake(10);
		global.pontos += 200;
		
		drop(50,obj_power_up);
	}
}
#endregion