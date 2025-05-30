//colidir com fogo ou bomba
if (place_meeting(x,y,obj_bomba)==true)
|| (place_meeting(x,y,obj_explosao) && !(place_meeting(x,y,obj_planta)))
   instance_destroy()
   
//colidir com o player
if place_meeting(x, y, obj_player) {
	with (instance_nearest(x, y, obj_player)) {
		if image_alpha == 1 {
			chutar_bomba = true
			instance_destroy(other)
		}
	}
}

//colidir com o oponente
if place_meeting(x, y, obj_oponente) 
	with (instance_nearest(x, y, obj_oponente)) {
		if visible	instance_destroy(other)
	}
  