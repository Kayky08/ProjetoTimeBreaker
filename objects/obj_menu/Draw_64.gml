//Pegando o valor da altura do display da tela
var _meio= display_get_gui_height()/2;

//Pegando a altura da fonte
var _alt = string_height("I");

//Alinha o texto verticalmente
draw_set_valign(1);

//Definindo a fonte
draw_set_font(fnt_menu);

//Desenhando as 3 opções no display da tela
for(var _i = 0; _i < array_length(opcoes_menu); _i++){
	//Variavel da cor do texto
	var _cor = c_white;
	
	if _i == atual{
		_cor = c_red;
	}
	
	//Desenhando as opções
	draw_set_color(_cor);
	draw_text(10,_meio + _i * _alt,opcoes_menu[_i]);
	draw_set_color(-1)
	
}

//Resetando o alinhamento
draw_set_valign(0);

//Resetando a fonte
draw_set_font(fnt_menu);

#region teste
//Usando o repeat para desenhar as opções
//repeat(3){
//	//Desenhando
//	draw_text(10,_meio + _espaco,opcoes_menu[_i]);
	
//	//Definindo um espaço entre elas
//	_espaco += 20;
//	//Aumentando o indice
//	_i += 1;
//}
#endregion