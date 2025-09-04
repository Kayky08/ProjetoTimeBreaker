draw_self();

if global.debug{
	draw_text(x,y,estado)
	draw_text(x,y+15,timer_tiro)
	draw_text(x,y+30,"vida: " + string(vida))
}