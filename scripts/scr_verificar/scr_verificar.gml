function scr_verificar(){
	if (place_meeting(x + cont_x, y + cont_y, obj_player)) ||	//se o player estiver na rota
		(place_meeting(x + cont_x, y + cont_y, obj_bomba)) ||	//se a bomba estiver na rota
		(place_meeting(x + cont_x, y + cont_y, obj_planta)) {	//se a planta estiver na rota
			instance_create_layer(x + cont_x, y + cont_y, "Action", obj_explosao)
		}
}