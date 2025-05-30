function scr_verificar_mortes() {
	if global.lider {
		if (global.oponentes_mortos == instance_number(obj_oponente) && (global.id_pai.vivo)) ||		//todos oponentes mortos e o player vivo
			(global.oponentes_mortos == instance_number(obj_oponente) - 1 && 
			(!(global.id_pai.vivo)) || global.id_pai.image_alpha = 0.5)	{	//todos os oponentes vivos -1 e o player morto
				scr_enviar("placar")	//envia p o server
				room_goto(rm_placar)	//tela de placar
				alarm[1] = 90 //3 segundos mostrando placar
			}
	}
}