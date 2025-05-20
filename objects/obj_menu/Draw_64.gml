draw_set_font(fnt_01);						//definir a fonte

for (var i = 0; i < opcoes_max; i ++) {
	draw_set_halign(fa_center)								//orientcao do texto
	
	if (i == indice) draw_set_color(c_yellow)
	else draw_set_color(c_white)
	
	draw_text(room_width / 2, (room_height / 2 - 25) + (20 * i), opcoes[i])	//desenhar o texto
	
	 
	
}