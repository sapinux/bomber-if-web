function scr_verificar_mortes() {
		// se todos estiverem mortos no momento da verificação
		if global.jogadores_mortos == (instance_number(obj_oponente) + instance_number(obj_player)) {
			scr_enviar("empate")			//envia p o server
			room_goto(rm_empate)			//tela de placar
			obj_cliente.alarm[1] = 90		//3 segundos mostrando placar
		}
		// se quase todos estiverem mortos, restando 1 vivo no momento da verificação
		else if global.jogadores_mortos == (instance_number(obj_oponente) + (instance_number(obj_player)) - 1) {
			//scr_verificar_vencedor()		
			scr_enviar("placar")			//envia p o server
			room_goto(rm_placar)			//tela de placar
			obj_cliente.alarm[1] = 90		//3 segundos mostrando placar
		}
}

function scr_verificar_vencedor() {	//PAREI AQUI DAR CONTINUIDADE!!!!!!!!!!!!
	var oponente
	for (i = 0; i < instance_number(obj_oponente); i ++) {
		 oponente = instance_find(obj_oponente, i)
		 if oponente.vivo 
			 a = array_get_index(global.jogadores, oponente.id)
	}
}