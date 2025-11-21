if (global.pause) exit;

//controlando o player
maquina_estado();

//trocando o nivel da arma
if(keyboard_check_pressed(ord("N"))) level_tiro += 1;
if(keyboard_check_pressed(ord("M"))) level_tiro -= 1;

//Tocando efeitos
retorna_mola(.3)
contador_efeito_dano()