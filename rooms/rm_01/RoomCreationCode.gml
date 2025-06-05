//destroi todas as instancias persistentes
if instance_exists(obj_player) instance_destroy(obj_player)
if instance_exists(obj_oponente) instance_destroy(obj_oponente)

if instance_exists(obj_bonus_bomba) instance_destroy(obj_bonus_bomba)
if instance_exists(obj_bonus_chutar_bomba) instance_destroy(obj_bonus_chutar_bomba)
if instance_exists(obj_bonus_luva) instance_destroy(obj_bonus_luva)
if instance_exists(obj_bonus_poder_bomba) instance_destroy(obj_bonus_poder_bomba)

//restaura as propriedades do obj_cliente
if instance_exists(obj_cliente) {
	with instance_find(obj_cliente, 0) {
		global.cliente_id = 0												//identificador do cliente
		global.sala = 0														//identificador da sala
		global.size = 1														//tamanho do pacote em bytes
		global.lider = false												//define se é lider da sala
		global.jogadores = []												//vetor para armazenar o id do oponente
		global.controle_jogadores = []										//controlar jogadores armazenando seu id definido pelo server
		global.jogadores_mortos = 0											//contar oponentes mortos na partida
		alarm[0] = noone													//desativa alarme[0]
		alarm[1] = noone													//desativa alarme[1]
	}
}