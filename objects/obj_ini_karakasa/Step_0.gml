if(global.pause) exit;

//Verificando se o inimigo não esta mais na sequencia e o destruindo
if(!in_sequence){
	instance_destroy()
	global.qtd_inimigos -= 1;
}

retorna_mola()
contador_efeito_dano()