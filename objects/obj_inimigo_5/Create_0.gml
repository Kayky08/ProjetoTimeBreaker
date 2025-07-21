#region variaveis
estado = "movendo";
vidas = 5;
_x = choose(32,64,96,128,160,192,224,256);
_y = choose(320,352,384);
#endregion

#region metodos
state_machine = function(){
	switch(estado){
		case "movendo":{			
			if x > _x || x < _x{
				x = _x
			}
			
			if y < _y{
				vspeed = 3;
			}
			else{
				estado = "parado";
			}
		}break;
		
		case "parado":{
			vspeed = 0;
		}
	}
}

morrendo = function(){
	if vidas > 0{
		vidas--;
	} 
	if vidas == 0{
		global.pontos += 300;
		sendo_destruido(obj_explosao);
		drop(90,obj_power_up);
	}
}

#endregion