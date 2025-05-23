function scr_posicionar_jogador() {
	with (obj_player) {
		switch (global.cliente_id) {
			case 1:
				x = 48
				y = 32
			case 2:
				x = 256
				y = 224
			case 3:
				x = 32
				y = 208
			case 4:
				x = 288
				y = 64
			case 5:
				x = 112
				y = 160
			case 6:
				x = 208
				y = 96
			case 7:
				x = 256
				y = 144
			case 8:
				x = 64
				y = 112
			case 9:
				x = 160
				y = 208
			case 10:
				x = 160
				y = 48
		}
	}
}     