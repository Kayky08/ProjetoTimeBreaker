#region variaveis
//
image_xscale = 1.5;
image_yscale = 1.5;

//Dano
dano = 1;

//velocidade do player
vel = 3;

//Vidas
vidas = 3;

//Escudos
escudos = 3;
meu_escudo = noone;

//Variavel da espera do tiro
espera_tiro = 20;

//Variavel do timer do tiro
timer_tiro = 0;

//Level do meu tiro
level_tiro = 1;

//Varivel de invencibilidade
tempo_invensivel = game_get_speed(gamespeed_fps);
timer_invensivel = 0;

#endregion

#region metodos
controla_player = function(){
	//diminundo o timer do tiro
	timer_tiro--;
	
	//diminuindo o timer da invencibilidade
	timer_invensivel--;
	
	//definindo os botoes das teclas
	var _cima, _baixo, _esq, _dir, _atirar;

	_cima = keyboard_check(ord("W"));
	_baixo = keyboard_check(ord("S"));
	_esq = keyboard_check(ord("A")) || keyboard_check(vk_left);
	_dir = keyboard_check(ord("D")) || keyboard_check(vk_right);
	_atirar = keyboard_check(vk_space) || mouse_check_button(mb_left);
	
	//fazendo o player usar o escudo
	if keyboard_check_pressed(ord("E")) usa_escudo();
	
	//chamando o metodo de criar o escudo
	com_escudo()
	
	//fazendo o player mover
	//Horizontal
	var _velh = _dir - _esq;
	x += _velh * vel;
	
	//if(x <= sprite_width/2) x = sprite_width/2;
	//if(x >= room_width - sprite_width/2) x = room_width - sprite_width/2;
	
	x = clamp(x, sprite_width/2, room_width - sprite_width/2)
	
	//Vertical
	var _velv = _baixo - _cima;
	y += _velv * vel;
	
	//Limitando a posição vertical
	y = clamp(y,0, room_height - 19);
	
	//Atirando
	if (_atirar && timer_tiro <= 0){
		
		if(level_tiro == 1){
			//Chama a função do tiro
			tiro_1();
			
			//Toca o som
			audio_play_sound(snd_tiro_1,1,false);
			
			//Define o tempo de disparo
			timer_tiro = espera_tiro;
			
			//Troca a sprite do player
			sprite_index = spr_player_level1
		}
		if(level_tiro == 2){
			tiro_2();
			audio_play_sound(snd_tiro_1,1,false);
			
			timer_tiro = espera_tiro * .7;
			
			//Troca a sprite do player
			sprite_index = spr_player_level2
		}
		if(level_tiro == 3){
			tiro_3();
			audio_play_sound(snd_tiro_1,1,false);
			
			timer_tiro = espera_tiro * .5;
			
			//Troca a sprite do player
			sprite_index = spr_player_level3
		}
	}
}

tiro_1 = function(){
	//Criando o tiro na camada dele
	//Salvando a identidade (id) desse tiro
	var _tiro = instance_create_layer(x,y,"Tiro",obj_tiro);
		
	//Personalizando o tiro
	//Fazendo o tiro ir para frente
	_tiro.vspeed = -10;

	//Fazendo reproduzir o audio
}

tiro_2 = function(){
	var _tiro = instance_create_layer(x - 12,y,"Tiro",obj_tiro);
	_tiro.vspeed = -10;
	
	_tiro = instance_create_layer(x + 12,y,"Tiro",obj_tiro);
	_tiro.vspeed = -10;
}

tiro_3 = function(){
	tiro_1();
	tiro_2()
}

ganha_level_tiro = function(){
	//fazendo com que o player n passe do level 3 
	if(level_tiro < 3){
		level_tiro++;
	}
}

desenha_icone = function(_qtd,_sprite,_x,_y){
	var _espaco = 0;

	//desenhando a vida
	//Usando um laço de repetição para desenhar as vidas
	repeat(_qtd){	
		draw_sprite_ext(_sprite,0,_x + _espaco,_y, 1, 1, 0, c_white, 0.5);
		_espaco += 45;
	}
}

perde_vida = function(){
	//Dando play no som
	audio_play_sound(snd_hit,1,false);
	
	//Fazendo a tela tremer quando leva um dano
	screenshake(20); 
	
	//verificando se o player esta invensivel
	if(timer_invensivel > 0) return;
	
	//checando se o player ainda tem vida
	if(vidas > 0){
		//fazendo a qtd de vida diminuir
		vidas--;
		
		//Perdendo vida e definindo o tempo de invencibilidade
		timer_invensivel = tempo_invensivel;
	}
	if vidas <= 0{
		//chamando a função de se autodestruir
		sendo_destruido(obj_explosao);
		
		//Fazendo a tela tremer quando leva um dano
		screenshake(50); 
	}
}

usa_escudo = function(){
	//verificando se é possivel criar um escudo
	if(escudos >= 0 && meu_escudo == noone){
		//diminuindo a qtd de escudos
		escudos--;
		
		//Criando a instancia do escutdo
		meu_escudo = instance_create_layer(x,y,"Escudo",obj_escudo);
	}
}

com_escudo = function(){
	//checando se o escudo existe
	if(instance_exists(meu_escudo)){
		//fazendo com que o escudo siga o player
		meu_escudo.x = x;
		meu_escudo.y = y;
		
		//definindo o tempo de invencivencibilidade
		tempo_invensivel = game_get_speed(gamespeed_fps) * 2;
	}
	else{
		//voltando a variavel para o estado de vazio
		meu_escudo = noone;
	}
}
	
morrendo = function(){
	sendo_destruido(obj_explosao_1);
}

#endregion