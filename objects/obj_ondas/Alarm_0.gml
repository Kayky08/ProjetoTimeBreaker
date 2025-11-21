//Criando a primeira onda
layer_sequence_create("seq_inimigos",0,0,ondas[wave]);

if(global.pause){
	layer_sequence_pause("seq_inimigos")
}
else{
	//Veriricando se chegou no final da wave
	if(wave < array_length(ondas) - 1){
		//fazendo ir para a proxima wave
		wave++;
	
		//Reiniciando o alarme
		alarm[0] = 460
	}
	else{
		room_goto_next();
	}
}
