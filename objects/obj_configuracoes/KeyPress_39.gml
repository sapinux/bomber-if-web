switch (opcoes[indice]) {
		case "Bombas":
			if global.bombas < 10 global.bombas ++
			break
		case "Luva":
			if !global.luva global.luva = true
			break
		case "Chutar Bomba":
			if !global.chutar_bomba global.chutar_bomba = true
			break
		case "Poder da Bomba":
			if global.poder_bomba < 10 global.poder_bomba ++
			break
}