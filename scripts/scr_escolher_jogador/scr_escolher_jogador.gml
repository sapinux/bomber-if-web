function scr_escolher_jogador(x, y) {
	switch (x) {
		case 96:
			switch (y) {
				case 128:
					global.player = "blue"
					break
				case 160:
					global.player = "pink"
					break
			}
			break
		case 128:
			switch (y) {
				case 128:
					global.player = "brown"
					break
				case 160:
					global.player = "ice"
					break
			}
			break
		case 160:
			switch (y) {
				case 128:
					global.player = "green"
					break
				case 160:
					global.player = "purple"
					break
				}
			break
		case 192:
			switch (y) {
				case 128:
					global.player = "orange"
					break
				case 160:
					global.player = "red"
					break
				}
			break
		case 224:
			switch (y) {
				case 128:
					global.player = "gray"
					break
				case 160:
					global.player = "yellow"
					break
				}
			break
		}
		scr_enviar("jogador_escolhido", "item", global.player)			//envia para o server o sprite definido
		
		room_goto(r_fase_01)
}
