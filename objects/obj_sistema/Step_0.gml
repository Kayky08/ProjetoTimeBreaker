//Estados do jogo
if keyboard_check_pressed(ord("R")) game_restart();
if keyboard_check_pressed(ord("T")) room_restart();

//Ativando as informações de debug
if keyboard_check_pressed(vk_tab) global.debug = !global.debug;

//Selecionando as fases
if keyboard_check_pressed(vk_numpad1) room_goto(rm_fase1_jp);
if keyboard_check_pressed(vk_numpad2) room_goto(rm_fase1_rs);
if keyboard_check_pressed(vk_numpad3) room_goto(rm_fase1_br);
if keyboard_check_pressed(vk_numpad4) room_goto_next();

//Modo Deus
if keyboard_check_pressed(ord("I")){
	obj_player.timer_invensivel = game_get_speed(gamespeed_fps) * 1000000000000000000000;
}

if !instance_exists(obj_player){
layer_sequence_create("transicao",room_width/2,room_height/2,sq_transicao1)
room_goto(rm_morte)
}