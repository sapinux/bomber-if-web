function scr_posicionar_campeao(player, player_id, posicoes) {
	var posicao = 1
	
	with (player) {
		//realiza uma vistoria em todos os jogadores
		for (i = 1; i < array_length(global.controle_jogadores); i ++) {	//PAREI AQUI
			if global.controle_jogadores[i] != 0 {							//se for diferente de zero é jogador ativo
				if global.jogadores[i].pontos > pontos						//se a pontuacao for maior
					posicao ++												//aumenta a posicao
				else if global.jogadores[i].pontos == pontos  				//se tiver a mesma pontuacao
					if i < player_id										//se o indice for menor 
						posicao ++											//aumenta a posicao
			}
		}
	
	
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