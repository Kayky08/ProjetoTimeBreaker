//Desenhando a area de debug
if (global.debug){
	draw_text(0,0, "Player");	
	
	//Debug do level do tiro
	draw_text(0,15, "Level do tiro:" + string(level_tiro));	
	
	//Debug da vida
	draw_text(0,30, "Vidas:" + string(vidas));
	
	draw_text(0,45, "Room:" + string(global.fase_anterior));
}
//Pegando a altura da interface
var _gui_height = display_get_gui_height();
var _gui_width = display_get_gui_width();	

//Desenhando as vidas
desenha_icone(vidas,spr_incone_vida,20,_gui_height - 40);

//Desenhando os escudos
desenha_icone(escudos,spr_icone_escudo,20,_gui_height - 80);

//Desenhando o pontos
draw_text(_gui_width/2,20,string(global.pontos));