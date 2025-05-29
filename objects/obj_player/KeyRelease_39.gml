if vivo {
	direcao = "direita"
	//carregar sprite
	if !(sprite_index == imagem[3]) sprite_index = imagem[3]
	scr_enviar("position_update", "s", 3)	//enviar sprite p o server
}