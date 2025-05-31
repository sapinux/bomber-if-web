function scr_verificar_mortes() {
	
		if (global.oponentes_mortos == instance_number(obj_oponente) && (global.id_pai.vivo)) ||						//todos oponentes mortos e o player vivo
			(global.oponentes_mortos == (instance_number(obj_oponente) - 1) && 
			(global.id_pai.image_alpha == 0.5 || global.id_pai.vivo == false)) 
			{	//todos os oponentes vivos -1 e o player morto
				global.oponentes_mortos = 0	//zera o contador de oponentes mortos
				scr_enviar("placar")	//envia p o server
				room_goto(rm_placar)	//tela de placar
				obj_cliente.alarm[1] = 90 //3 segundos mostrando placar
			}
		
		else if (global.oponentes_mortos == instance_number(obj_oponente) && ////////////////////PAREI AQUI ----
			(global.id_pai.image_alpha == 0.5 || global.id_pai.vivo == false)) {
				global.oponentes_mortos = 0	//zera o contador de oponentes mortos
				scr_enviar("empate")	//envia p o server
				room_goto(rm_empate)	//tela de placar
				obj_cliente.alarm[1] = 90 //3 segundos mostrando placar
			}
	
}