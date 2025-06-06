//tempo que será exibido o placar
if room == rm_campeao {
	scr_enviar("sair")								//se não houver mais ninguem na partida - envia p o server sair da sala
	room_goto(rm_01)
}
else {
	scr_enviar("iniciar_partida")	//envia para os jogadores
	room_goto(r_fase_01)
}
