if vivo {
	direcao = "cima"
	//carregar sprite
	if !(sprite_index == imagem[2]) sprite_index = imagem[2]
	scr_enviar("position_update", "s", 2)	//enviar sprite p o server
}