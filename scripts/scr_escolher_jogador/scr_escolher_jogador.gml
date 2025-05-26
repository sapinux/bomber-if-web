function scr_escolher_jogador(x, y) {
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
		scr_enviar("jogador_escolhido", "item", global.player)			//envia para o server o sprite definido
		room_goto(r_fase_01)
}
