if(global.pause){
	image_speed = 0;
	exit;	
}
else{
	image_speed = 1;
}

maquina_estado();

retorna_mola();
contador_efeito_dano();