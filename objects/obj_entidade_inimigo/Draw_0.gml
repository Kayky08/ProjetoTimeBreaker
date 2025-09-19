draw_self();

if global.debug{
	draw_text(x,y,"estado: " + string(estado))
	draw_text(x,y+15,"timer: " + string(timer_tiro))
	draw_text(x,y+30,"vida: " + string(vida))
	draw_text(x,y+45,"speed/hspeed/vspeed: " + string(speed) + "/" + string(hspeed) + "/" + string(vspeed)) 
}