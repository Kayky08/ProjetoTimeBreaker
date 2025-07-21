//Criando a primeira onda
layer_sequence_create("Seq_inimigos",0,0,ondas[wave]);

//Veriricando se chegou no final da wave
if(wave < array_length(ondas) - 1){
	wave++;
	
	//Reiniciando o alarme
	alarm[0] = 400
}
else{
	alarm[1] = game_get_speed(gamespeed_fps) * 8;
}