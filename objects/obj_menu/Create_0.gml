#region variaveis
opcoes_menu = ["Jogar","Tutorial","Sair"];
atual = 0;
#endregion

#region metodos
trocar_opcao = function(){
	//Criando as variaveis temporarias
	var _tecla1, _tecla2;
	
	//Definindo as teclas
	_tecla1 = keyboard_check_pressed(vk_up);
	_tecla2 = keyboard_check_pressed(vk_down);

	//Fazendo com que as teclas aumentem ou diminuam o valor do atual
	if _tecla1 atual--;
	if _tecla2 atual++;
	
	//Limitando os valores do atual
	atual = clamp(atual,0,array_length(opcoes_menu) - 1);
}
#endregion