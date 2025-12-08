#region variaveis
image_xscale = 1.3
image_yscale = 1.3

vidas = 10
estado = "movendo";
timer_tiro = 0;

//Iniciando efeitos
inicia_efeito_dano()
inicia_efeito_mola()
#endregion

#region metodos
morrendo = function(){
	if vidas > 0{
		vidas--;
		
		screenshake(5);
		
		//Definindo valores dos efeitos
		efeito_mola(2,.5)
		timer_efeito_dano(5);
	}
	if vidas == 0{
		sendo_destruido(obj_mt_karakasa);
		
		screenshake(10);
		global.pontos += pontos;
		
		drop(chance_drop,obj_power_up);
	}
}
#endregion