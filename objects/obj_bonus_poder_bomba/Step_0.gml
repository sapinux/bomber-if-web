//colidir com fogo ou bomba
if (place_meeting(x,y,obj_bomba)==true)
|| (place_meeting(x,y,obj_explosao) && !(place_meeting(x,y,obj_planta)))
   instance_destroy()