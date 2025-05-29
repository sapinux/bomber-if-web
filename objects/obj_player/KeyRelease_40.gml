if vivo {
	direcao = "baixo"
	//carregar sprite
	if !(sprite_index == imagem[1]) sprite_index = imagem[1]
	scr_enviar("position_update", "s", 1)	//enviar sprite p o server
}