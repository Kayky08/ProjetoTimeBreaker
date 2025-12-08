global.pause = false;

display_set_gui_size(288,512);

desenha_pause = function(){
	var _h = display_get_gui_height();
	var _w = display_get_gui_width();
	
	draw_set_alpha(0.5);
	draw_rectangle_colour(
	0,0,_w,_h,
	make_color_rgb(64, 4, 178),
	make_color_rgb(64, 4, 178),
	make_color_rgb(64, 4, 178),
	make_color_rgb(64, 4, 178),
	false)
	draw_set_alpha(1);
	
	if(!layer_exists("pause")){
		layer_create(0, "pause")
	}
}
desenha_caixa = function(){
	var _h = display_get_gui_height();
	var _w = display_get_gui_width();
	
	draw_sprite(spr_caixa_pause,0,_w/2,_h/2)
}
pausa_sequencia = function(){
	var _ins = layer_get_all_elements("Seq_inimigos")

	for(var _i = 0; _i < array_length(_ins); _i++){
		if(layer_get_element_type(_ins[_i]) == layerelementtype_sequence){
			if(global.pause){
				layer_sequence_pause(_ins[_i])
			}
			else{
				layer_sequence_play(_ins[_i])
			}
		}
	}
}