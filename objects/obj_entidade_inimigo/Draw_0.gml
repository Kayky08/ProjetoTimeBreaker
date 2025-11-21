desenha_efeito_dano(desenha_efeito_mola)

if global.debug{
	draw_text(x,y,"estado: " + string(estado))
	draw_text(x,y+15,"timer: " + string(timer_tiro))
	draw_text(x,y+30,"vida: " + string(vida))
	draw_text(x,y+45,"speed/hspeed/vspeed: " + string(speed) + "/" + string(hspeed) + "/" + string(vspeed))
	draw_text(x,y+60,"image_speed: " + string(image_speed))
}