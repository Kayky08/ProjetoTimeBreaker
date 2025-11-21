draw_text(10,10,global.pause);

if(global.pause){
	desenha_pause();
}
else{
	if(layer_exists("pause")){
		layer_destroy("pause");
	}
}