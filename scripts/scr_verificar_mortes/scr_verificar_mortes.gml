function scr_verificar_mortes() {
	if global.lider {
		if (global.oponentes_mortos == instance_number(obj_oponente) && (global.id_pai.vivo)) ||	//todos oponentes mortos e o player vivo
			(global.oponentes_mortos == instance_number(obj_oponente) - 1 && !(global.id_pai.vivo))		//todos os oponentes vivos -1 e o player morto
			room_goto(rm_placar)
	}
}