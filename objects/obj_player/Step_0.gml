//Mostrando a parte de Debug
if keyboard_check_released(vk_tab) global.debug = !global.debug;

//controlando o player
controla_player();

//fazendo o player perder 1 de vida
if keyboard_check_pressed(vk_enter) perde_vida();

//trocando o nivel da arma
if(keyboard_check_pressed(vk_up)) level_tiro += 1;
if(keyboard_check_pressed(vk_down)) level_tiro -= 1;