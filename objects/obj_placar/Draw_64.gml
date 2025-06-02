draw_set_font(fnt_01);						//definir a fonte
var oponente
//var cont = 0

for (var i = 0; i < instance_number(obj_oponente) ; i ++) {
	
	oponente = instance_find(obj_oponente, i)	//recebe jogador atual
	
	draw_set_halign(fa_center)					//orientcao do texto
		
	draw_set_color(c_white)						//cor do texto
	
	with (oponente) {
//		if cont < 5 {
			draw_text(x + 5, y, "Jogador " + string(array_get_index(global.jogadores, id)) + ": " + string(pontos)) 
			
//		} else 
//			draw_text(200, (room_height / 2 - 25) + (20 * cont), "Jogador " + string(array_get_index(global.jogadores, id)) + ": " + string(pontos)) 
				
//		cont ++
		// if cont == 5 cont = 0 PAREI AQUI
	}
}
//jogador local
with (global.jogadores[global.cliente_id]) {
//	if cont < 2
		draw_text(x + 5, y, "Jogador " + string(global.cliente_id) + ": " + string(pontos))
//	else
//		draw_text(200, (room_height / 2 - 25) + (20 * cont), "Jogador " + string(global.cliente_id) + ": " + string(pontos))
}