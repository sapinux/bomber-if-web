//se esse objeto encontrar um local vago
if (place_free(x, y)) {
	
	var bomba = instance_create_layer(x + hspeed,y + vspeed, "Action", obj_bomba)
	with (bomba) {
		id_pai = other.id_pai							//recebe o id do player criador da bomba
		poder_bomba = other.poder_bomba					//recebe o poder de alcance da explosao	
		tempo = other.tempo								//recebe o tempo de duracao da bomba
	}
	instance_destroy();
}

if global.id_pai ==0 id_pai = 0						//verifica se o id possui valor

//se encontrar uma explosao o mesmo se destroi
if place_meeting(x + hspeed, y + vspeed, obj_explosao) {
		if (id_pai) != 0 id_pai.bombas ++					//devolve a bomba para o player
		instance_destroy()
} 


if (vspeed > 0) && (y + 5 >= room_height) y = 0		//bomba atravessa o limite inferior do cenario
if (vspeed < 0) && (y <= 0) y = room_height			//bomba atravessa o limite superior do cenario
if (hspeed > 0) && (x + 5 >= room_width) x = 0		//bomba atravessa o limite a direita do cenario
if (hspeed < 0) && (x <= 0) x = room_width			//bomba atravessa o limite a esquerda do cenario