#region globais
global.debug = false;
global.pontos = 0;
global.musica = false;
global.fase_anterior = room;
global.qtd_inimigos = 0;
global.destino = rm_teste;
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
function atirar(tiro,tiro_som,_x = 0,_y = 0){			
	//criando o tiro
	var _tiro = instance_create_layer(x+_x,y+_y,"Tiro",tiro)
	
	//definindo a velocidade do tiro
	
	//Dando play no som
	audio_play_sound(tiro_som,1,false);
}
function mudar_room(){
	room_goto(global.destino);
}
	
//Funções de efeitos
function inicia_efeito_mola(){
	xscale = 1;
	yscale = 1;
}
function efeito_mola(_xscale = 1,_yscale = 1){
	xscale = _xscale;
	yscale = _yscale;
}
function retorna_mola(_qtd = .1){
	xscale = lerp(xscale,1,_qtd);
	yscale = lerp(yscale,1,_qtd);
}
function desenha_efeito_mola(){
	draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	xscale,
	yscale,
	image_angle,
	image_blend,
	1
	)
}
function inicia_efeito_dano(){
	tomei_dano = false;
}
function timer_efeito_dano(_tempo = 1){
	tomei_dano = _tempo;
}
function contador_efeito_dano(){
	if(tomei_dano > 0) tomei_dano--;
}
function desenha_efeito_dano(_funcao_desenho = draw_self){
	if(tomei_dano){
		shader_set(sh_branco);
		_funcao_desenho();
		shader_reset();
	}
	else{
		_funcao_desenho();
	}
}
#endregion