global.pause = false;

desenha_pause = function(){
	var _h = display_get_gui_height();
	var _w = display_get_gui_width();
	
	draw_set_alpha(0.5);
	draw_rectangle_colour(0,0,_w,_h,c_purple,c_purple,c_purple,c_purple,false)
	draw_set_alpha(1);
	
	if(!layer_exists("pause")){
		layer_create(0, "pause")
		
		instance_create_layer(288/2,512/2,"pause",obj_btn_restart);
	}
}