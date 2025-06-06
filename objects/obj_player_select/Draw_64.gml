draw_set_font(fnt_01)						//definir a fonte

draw_set_halign(fa_left)					//orientcao do texto
draw_set_color(c_white)					//cor do texto
	
draw_text(90, 10, "SELEÇÃO DE JOGADORES")					//desenhar o texto
draw_text(30, 40, "Sala: " + string(global.sala))			//desenhar o texto
draw_text(115, 40, "Jogador: " + string(global.cliente_id))	//desenhar o texto


if instance_exists(obj_oponente) {
	draw_text(220, 40, "jogadores: " + string(instance_number(obj_oponente) + 1))	//desenhar o texto
	draw_text(140, 220, "Iniciar: " + string(round( tempo / 30 )))
	if (tempo == 0 && global.lider) {
		scr_enviar("iniciar_partida")	//envia para os jogadores
		scr_escolher_jogador(x, y)		//definir o personagem
		room_goto(r_fase_01)			//carrega a fase de batalha
	}
	if tempo > 0 tempo --
} 
	