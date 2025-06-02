draw_set_font(fnt_01);						//definir a fonte
var jogador
for (var i = 0; i < instance_number(obj_oponente) ; i ++) {
	
	jogador = instance_find(obj_oponente, i)	//recebe jogador atual
	
	draw_set_halign(fa_center)					//orientcao do texto
		
	draw_set_color(c_white)						//cor do texto
	
	with (jogador) {
		draw_text(room_width / 2, (room_height / 2 - 25) + (20 * i), "Jogador " + string(array_get_index(global.jogadores, id)) + ": " + string(pontos)) 
	}
}
//jogador local
with (global.jogadores[global.cliente_id]) {
	draw_text(room_width / 2, (room_height / 2 - 25) + (20 * instance_number(obj_oponente)), "Jogador " + string(global.cliente_id) + ": " + string(pontos))
}