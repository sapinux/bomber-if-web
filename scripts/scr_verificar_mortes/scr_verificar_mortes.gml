function scr_verificar_mortes() {
		// se todos estiverem mortos no momento da verificação
		if global.jogadores_mortos == (instance_number(obj_oponente) + instance_number(obj_player)) {
			scr_enviar("empate")			//envia p o server
			room_goto(rm_empate)			//tela de placar
			obj_cliente.alarm[1] = 90		//3 segundos mostrando placar
		}
		// se quase todos estiverem mortos, restando 1 vivo no momento da verificação
		else if global.jogadores_mortos == (instance_number(obj_oponente) + (instance_number(obj_player)) - 1) {
				
			scr_enviar("placar", "item", scr_verificar_vencedor())		//envia p o server o id do vencedor
			room_goto(rm_placar)										//tela de placar
			obj_cliente.alarm[1] = 150									//3 segundos mostrando placar
		}
}

function scr_verificar_vencedor() {
	var oponente
	var oponente_vivo = 0
	
	//realiza uma varredura em todos oponentes
	for (i = 0; i < instance_number(obj_oponente); i ++) {
		 oponente = instance_find(obj_oponente, i)	
		 if oponente.vivo														//verifica se está vivo
			 oponente_vivo = array_get_index(global.jogadores, oponente.id)		//pega o indice do oponente vivo
	}
	
	if oponente_vivo == 0 oponente_vivo = global.cliente_id						//pega o id do player
	
	with (global.jogadores[oponente_vivo]) {
		pontos ++																//incrementa ponto
	}
	return oponente_vivo
}