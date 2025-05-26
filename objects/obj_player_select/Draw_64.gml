draw_set_font(fnt_01);						//definir a fonte


	draw_set_halign(fa_left)								//orientcao do texto
	
	draw_set_color(c_yellow)
	
	draw_text(50, 20, "Sala: " + string(global.sala))	//desenhar o texto
	draw_text(115, 20, "Jogador: " + string(global.cliente_id))	//desenhar o texto
	if instance_exists(obj_oponente) {
		draw_text(200, 20, "jogadores: " + string(instance_number(obj_oponente) + 1))	//desenhar o texto
		draw_text(120, 40, "Iniciar: " + string(tempo))
		if tempo == 0 {
			switch (x) {
				case 144:
					switch (y) {
						case 128:
							global.player = "blue"
							break
						case 160:
							global.player = "pink"
							break
					}
					break
				case 176:
					switch (y) {
						case 128:
							global.player = "green"
							break
						case 160:
							global.player = "purple"
							break
					}
					break
				case 208:
					switch (y) {
						case 128:
							global.player = "orange"
							break
						case 160:
							global.player = "red"
							break
					}
					break
			}

			room_goto(r_fase_01)
		}
		
		if tempo > 0 tempo --
	} 
	