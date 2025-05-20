draw_set_font(fnt_01);						//definir a fonte

for (var i = 0; i < opcoes_max; i ++) {
	draw_set_halign(fa_right)								//orientcao do texto
	
	if (i == indice) draw_set_color(c_yellow)
	else draw_set_color(c_white)
	
	switch (opcoes[i]) {
		case "Bombas":
			valor = " < " + string(global.bombas) + " >"
			break
		case "Luva":
			valor = " < " + string(global.luva) + " >"
			break
		case "Chutar Bomba":
			valor = " < " + string(global.chutar_bomba) + " >"
			break
		case "Poder da Bomba":
			valor = " < " + string(global.poder_bomba) + " >"
			break
		case "Voltar":
			valor = " <---  "
			break
	}
	
	draw_text(room_width / 2 + 20, (room_height / 2 - 35) + (20 * i), opcoes[i] + valor)	//desenhar o texto
}