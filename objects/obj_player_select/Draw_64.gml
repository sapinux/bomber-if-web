draw_set_font(fnt_01);						//definir a fonte


	draw_set_halign(fa_left)								//orientcao do texto
	
	draw_set_color(c_yellow)
	
	draw_text(50, 20, "Sala: " + string(global.sala))	//desenhar o texto
	draw_text(115, 20, "Jogador: " + string(global.cliente_id))	//desenhar o texto
	if instance_exists(obj_oponente) {
		draw_text(200, 20, "jogadores: " + string(instance_number(obj_oponente) + 1))	//desenhar o texto
		draw_text(120, 40, "Iniciar: " + string(tempo))
		if (tempo == 0 && global.lider) {
			scr_enviar("iniciar_partida")	//envia para os jogadores
			scr_escolher_jogador(x, y)		//definir o personagem
		}
		if tempo > 0 tempo --
	} 
	