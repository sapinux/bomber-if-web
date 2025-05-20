if vivo {	
	direcao = "direita"
	sprite_index = imagem[3]
	
	//direita
	if !place_meeting(x + vel, y, obj_planta)		//se não houver planta	
		if (place_free(x + vel , y)) || (place_meeting(x + vel, y, obj_explosao)) {
			x += vel
			sprite_index = imagem[7]	//carregar sprite
		}
	   
   //deslizar na quina da parede
	if (keyboard_check(vk_up)==false) && (keyboard_check(vk_down)==false) && (place_meeting(x + vel, y, obj_parede)) {
		if (y - (floor(y / global.largura) * global.largura) <= 10) && (frac(floor(y / global.altura) / 2) == 0) y -= vel
		if (y - (floor(y / global.largura) * global.largura) >= 05) && (frac(floor(y / global.largura) / 2) != 0) y += vel
	}

	//chutar a bomba
	if (place_meeting(x + vel, y, obj_bomba) && (chutar_bomba))
		with (instance_nearest(x + vel, y, obj_bomba))
			if solid hspeed = 4
}