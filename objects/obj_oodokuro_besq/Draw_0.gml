draw_self();

if global.debug{
	draw_text(x-49,y+159,"e: " + string(estado))
	draw_text(x-49,y+174,"t: " + string(timer_tiro))
	draw_text(x-49,y+189,"v: " + string(vida))
	draw_text(x-49,y+204,"s/hs/vs: " + string(speed) + "/" + string(hspeed) + "/" + string(vspeed)) 
}