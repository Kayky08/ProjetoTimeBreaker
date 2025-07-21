//colidindo com o player e se autodestruindo
instance_destroy();

//Dando play no som
audio_play_sound(snd_powerup,1,false);

//pegando o metodo do player e rodando-o
other.ganha_level_tiro();

//Criando particulas ao pegar o power up
var _part = instance_create_layer(x,y,layer,obj_explosao);

//Fazendo com que o angulo da imagem seja aleatorio
_part.image_angle = random(359);
