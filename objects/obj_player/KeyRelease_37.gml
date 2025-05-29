if vivo {
	direcao = "esquerda"
	//carregar sprite
	if !(sprite_index == imagem[4]) sprite_index = imagem[4]
	scr_enviar("position_update", "s", 4)	//enviar sprite p o server
}