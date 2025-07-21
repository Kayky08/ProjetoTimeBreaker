timer = 60

if keyboard_check_pressed(ord("R")) game_restart();
if keyboard_check_pressed(ord("T")) room_restart();

if keyboard_check_pressed(ord("K")){
	obj_inimigo_2.vidas=0;
	obj_inimigo_2.morrendo();
}

if keyboard_check_pressed(vk_numpad1) room_goto(rm_fase_1);
if keyboard_check_pressed(vk_numpad2) room_goto(rm_fase_2);
if keyboard_check_pressed(vk_numpad3) room_goto(rm_fase_3);
if keyboard_check_pressed(vk_numpad4) room_goto(rm_fase_4);

if keyboard_check_pressed(ord("I")){
	obj_player.timer_invensivel = game_get_speed(gamespeed_fps) * 1000000000000000000000;
	obj_player.vidas = 10
	obj_explosao.matar = false;
}

if !instance_exists(obj_player){
	room_restart();
};