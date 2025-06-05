draw_set_font(fnt_01);						//definir a fonte
draw_set_halign(fa_center)					//orientcao do texto
draw_set_color(c_white)						//cor da fonte
draw_text(room_width / 2, y + 5, " -- PROTÓTIPO BOMBER IF --")	//desenhar o texto
draw_text(room_width / 2, y + 20, " -- TESTE JUNHO 25 --")	//desenhar o texto

for (var i = 0; i < opcoes_max; i ++) {
	
	
	if (i == indice) draw_set_color(c_yellow)
	else draw_set_color(c_white)
	
	draw_text(room_width / 2, (room_height / 2 - 25) + (20 * i), opcoes[i])	//desenhar o texto
	
	 
	
}