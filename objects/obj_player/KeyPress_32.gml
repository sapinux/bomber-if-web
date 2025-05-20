if vivo {	
	
	if !(place_meeting(x ,y ,obj_bomba)) && (bombas > 0) {	
		var bomba = instance_create_layer(x, y, "Action", obj_bomba)	//criar bomba
		with (bomba) {
			id_pai = global.id_pai							//recebe o id do player criador da bomba
			poder_bomba = other.poder_bomba					//recebe o poder de alcance da explosao
			other.bombas --									//diminui a quantidade de bombas
		}
	} else {
		//se estiver sobre uma bomba e possuir a luva
		if (place_meeting(x ,y , obj_bomba) && luva) {
			var bomba_pulando = instance_create_layer(x ,y , "Action", obj_bomba_pulando)
			with (bomba_pulando) {
				//verifica a direcao do player
				switch (other.direcao) {
					case "cima":
						vspeed = -4
						break
					case "baixo":
						vspeed = 4
						break
					case "esquerda":
						hspeed = -4
						break
					case "direita":
						hspeed = 4
						break
				}
			}
		}
	}
}