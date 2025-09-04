#region globais
global.debug = false;
global.pontos = 0;
global.musica = false;

#endregion

#region funções
function sendo_destruido(particula = obj_explosao){
	//se destruindo
	instance_destroy();
	
	//criando uma marticula
	instance_create_layer(x,y,"Particulas",particula); 
}

function screenshake(_tremer = 1){
	if instance_exists(obj_screenshake){
		//Passando se a instancia do objeto screenshake existe
		if instance_exists(obj_screenshake){
			with(obj_screenshake){
				if _tremer > treme{
					treme = _tremer;
				}
			}
		}
	}
}

function drop(chance,powerup){
	//Criando a chance de drop
	var _chance = random(100);
	
	//Verificando se tem a chance de dropar
	if(_chance > chance){
		//Criando o power up
		var _powerup = instance_create_layer(x,y,layer,powerup);
		_powerup.vspeed = 3;
	}
}
	
function atirar(tiro,tiro_velocidade,tiro_som,_x = 0,_y = 0){			
	//criando o tiro
	var _tiro = instance_create_layer(x+_x,y+_y,"Tiro",tiro)
	
	//definindo a velocidade do tiro
	_tiro.vspeed = tiro_velocidade;
	
	//Dando play no som
	audio_play_sound(tiro_som,1,false);
}

#endregion