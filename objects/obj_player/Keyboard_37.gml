if vivo {
	direcao = "esquerda"
	sprite_index = imagem[4]
	
	//esquerda
	if !place_meeting(x - vel, y, obj_planta) 		//se não houver planta
		if (place_free(x - vel, y)) || (place_meeting(x - vel, y, obj_explosao)) { 
			x -= vel								
			sprite_index = imagem[8]	//carregar sprite
			scr_enviar("position_update", "x", x)
		} 
		
	//deslizar na quina da parede
	if (keyboard_check(vk_up) == false) && (keyboard_check(vk_down) == false) && (place_meeting(x - vel, y, obj_parede)) {
		if (y - (floor(y / global.altura) * global.altura)<=10) && (frac(floor(y/global.altura)/2)==0) {
			y-=vel
			scr_enviar("position_update", "y", y)
		}
		if (y - (floor(y / global.altura) * global.altura)>=05) && (frac(floor(y/global.altura)/2)!=0) {
			y+=vel
			scr_enviar("position_update", "y", y)
		}
	}
	
	//chutar a bomba
	if (place_meeting(x - vel, y, obj_bomba) && (chutar_bomba))
		
		with (instance_nearest(x - vel, y, obj_bomba))
			if solid {
				scr_enviar("chutar_bomba", "x", (-other.vel))
				hspeed = -4
			}
}