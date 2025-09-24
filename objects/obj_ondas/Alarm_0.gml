//Criando a primeira onda
layer_sequence_create("Seq_inimigos",0,0,ondas[wave]);

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