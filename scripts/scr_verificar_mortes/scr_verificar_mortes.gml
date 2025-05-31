function scr_verificar_mortes() {
		// se todos estiverem mortos no momento da verificação
		if global.jogadores_mortos == (instance_number(obj_oponente) + instance_number(obj_player)) {
			scr_enviar("empate")			//envia p o server
			room_goto(rm_empate)			//tela de placar
			obj_cliente.alarm[1] = 90		//3 segundos mostrando placar
		}
		// se quase todos estiverem mortos, restando 1 vivo no momento da verificação
		else if global.jogadores_mortos == (instance_number(obj_oponente) + (instance_number(obj_player)) - 1) {
			scr_enviar("placar")			//envia p o server
			room_goto(rm_placar)			//tela de placar
			obj_cliente.alarm[1] = 90		//3 segundos mostrando placar
		}
		
}