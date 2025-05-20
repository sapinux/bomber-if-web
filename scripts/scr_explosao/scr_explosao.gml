function scr_explosao(){
	instance_create_layer(x, y, "Action", obj_explosao)
	
	cont_y = 0
	cont_x = 0
	
	repeat (poder_bomba) {	//para baixo
		cont_y += 16
		if place_free(x + cont_x, y + cont_y) == true instance_create_layer(x + cont_x, y + cont_y, "Action", obj_explosao)
		else {
			script_execute(scr_verificar)
			if !(place_meeting(x + cont_x, y + cont_y, obj_player))
				break
		}
	}
	
	cont_y = 0
	cont_x = 0
	
	repeat (poder_bomba) {	//para cima
		cont_y -= 16
		if place_free(x + cont_x, y + cont_y) == true instance_create_layer(x + cont_x, y + cont_y, "Action", obj_explosao)
		else {
			script_execute(scr_verificar)
			if !(place_meeting(x + cont_x, y + cont_y, obj_player))
				break
		}
	}
	
	cont_y = 0
	cont_x = 0
	
	repeat (poder_bomba) {	//para direita
		cont_x += 16
		if place_free(x + cont_x, y + cont_y) == true instance_create_layer(x + cont_x, y + cont_y, "Action", obj_explosao)
		else {
			script_execute(scr_verificar)
			if !(place_meeting(x + cont_x, y + cont_y, obj_player))
				break
		}
	}
	
	cont_y = 0
	cont_x = 0
	
	repeat (poder_bomba) {	//para esquerda
		cont_x -= 16
		if place_free(x + cont_x, y + cont_y) == true instance_create_layer(x + cont_x, y + cont_y, "Action", obj_explosao)
		else {
			script_execute(scr_verificar)
			if !(place_meeting(x + cont_x, y + cont_y, obj_player))
				break
		}
	}
}