draw_self();

if global.debug{
	draw_text(x-20,y,"estado: " + string(estado))
	draw_text(x-20,y+15,"timer: " + string(timer_tiro))
	draw_text(x-20,y+30,"vida: " + string(vida))
	draw_text(x-20,y+45,"x/y: " + string(x) + "/" + string(y)) 
}