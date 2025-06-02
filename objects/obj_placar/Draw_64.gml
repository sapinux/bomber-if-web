draw_set_font(fnt_01);						//definir a fonte
var oponente

for (var i = 0; i < instance_number(obj_oponente) ; i ++) {
	
	oponente = instance_find(obj_oponente, i)	//recebe jogador atual
	
	draw_set_halign(fa_center)					//orientcao do texto
		
	draw_set_color(c_white)						//cor do texto
	
	with (oponente) {
			//draw_text(x + 25, y, string(array_get_index(global.jogadores, id)) + "   " + string(pontos)) 
			draw_text(x + 20, y, "   " + string(pontos))
	}
}

//jogador local
with (global.jogadores[global.cliente_id]) {
	//draw_text(x + 25, y, string(global.cliente_id) + "   " + string(pontos))
	draw_text(x + 20, y, "   " + string(pontos))
}