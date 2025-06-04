if vivo {
	direcao = "cima"
	sprite_index = imagem[2]
	//cima
	if !place_meeting(x , y - vel, obj_planta) && !place_meeting(x , y - vel, obj_limite) && !place_meeting(x , y - vel, obj_parede)		//se não houver planta
		if (place_free(x, y - vel)) || (place_meeting(x, y - vel, obj_explosao)) || (place_meeting(x, y - vel, obj_oponente)) 
			|| (place_meeting(x, y - vel, obj_bonus_bomba)){
			y -= vel
			sprite_index = imagem[6]	//carregar sprite
			scr_enviar("position_update", "y", y, "s", 6)	//enviar posicao p o server
		}
	
	//deslizar na quina da parede
	if (keyboard_check(vk_left)==false) && (keyboard_check(vk_right)==false) && (place_meeting(x, y - vel, obj_parede)) {
		if (x - (floor(x / global.largura) * global.largura) <= 10) && (frac(floor(x / global.largura) / 2) == 0) {
			x -= vel
			scr_enviar("position_update", "x", x, "s", 8)	//enviar posicao p o server
		}
		if (x - (floor(x / global.largura) * global.largura) >= 05) && (frac(floor(x / global.largura) / 2) != 0) {
			x += vel
			scr_enviar("position_update", "x", x, "s", 7)	//enviar posicao p o server
		}
	}	
	
	//chutar a bomba
	if (place_meeting(x, y - vel, obj_bomba) && (chutar_bomba))
		with (instance_nearest(x, y - vel, obj_bomba))
			if solid {
				scr_enviar("chutar_bomba", "y", (-other.vel))	
				vspeed = -4
			}
}