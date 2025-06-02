function scr_posicionar_jogador(player, player_id, posicoes) {
	var posicao = 0
	//verifica a ordem do jogador em relação aos demais
	for (i = 1; i <= player_id; i ++) {
		if global.controle_jogadores[i] != 0 posicao ++
		
	}
	
	with (player) {
		switch (posicao) {
			case 1:
				x = posicoes[0, 0] 
				y = posicoes[0, 1] 
				break
			case 2:
				x = posicoes[1, 0]
				y = posicoes[1, 1]
				break
			case 3:
				x = posicoes[2, 0]
				y = posicoes[2, 1]
				break
			case 4:
				x = posicoes[3, 0]
				y = posicoes[3, 1]
				break
			case 5:
				x = posicoes[4, 0]
				y = posicoes[4, 1]
				break
			case 6:
				x = posicoes[5, 0]
				y = posicoes[5, 1]
				break
			case 7:
				x = posicoes[6, 0]
				y = posicoes[6, 1]
				break
			case 8:
				x = posicoes[7, 0]
				y = posicoes[7, 1]
				break
			case 9:
				x = posicoes[8, 0]
				y = posicoes[8, 1]
				break
			case 10:
				x = posicoes[9, 0]
				y = posicoes[9, 1]
				break
		}
	}
}     