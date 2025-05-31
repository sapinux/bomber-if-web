scr_limpar_bonus()				//realizar lipeza dos bonus
global.jogadores_mortos = 0		//zera o contador de mortos

if global.lider {
		
	//distribuir icones de bonus
	randomize()												//evitar que o random repita os mesmos valores

	//preencher a variavel cont_i[i] com o valor 'false' com base na quantidade de objetos 'obj_planta'
	for (i = 0; i < (instance_number(obj_planta)); i++) cont_i[i] = false

	//distribuir icones de bombas
	cont = 0
	do {
		i = irandom(instance_number(obj_planta)-1)
		if !cont_i[i] {
			cont_i[i] = true								//verifica se o vetor ainda nao recebeu valor true
			obj = (instance_find(obj_planta, i))
			scr_enviar("create_bonus", "item", "bomba", "x", obj.x, "y", obj.y)
			instance_create_layer(obj.x, obj.y, "Bonus", obj_bonus_bomba)
			cont ++
		}	
	}
	until (cont == 10)										//quantidade de icones de bombas

	//distribuir icones de poder bomba
	cont = 0
	do {
		i = irandom(instance_number(obj_planta)-1)
		if !cont_i[i] {										//verifica se o vetor ainda nao recebeu valor true
			cont_i[i] = true
			obj = instance_find(obj_planta, i)
			scr_enviar("create_bonus", "item", "poder_bomba", "x", obj.x, "y", obj.y)
			instance_create_layer(obj.x, obj.y, "Bonus", obj_bonus_poder_bomba)
			cont ++
		}	
	}
	until (cont == 10)										//quantidade de icones de poder bomba

	//distribuir icones de chutar bomba
	cont = 0
	do {
		i = irandom(instance_number(obj_planta)-1)
		if !cont_i[i] {										//verifica se o vetor ainda nao recebeu valor true
			cont_i[i] = true
			obj = instance_find(obj_planta, i)
			scr_enviar("create_bonus", "item", "chutar_bomba", "x", obj.x, "y", obj.y)
			instance_create_layer(obj.x, obj.y, "Bonus", obj_bonus_chutar_bomba)
			cont ++
		}	
	}
	until (cont == 4)										//quantidade de icones de chutar bomba

	//distribuir icones de luva
	cont = 0
	do {
		i = irandom(instance_number(obj_planta)-1)
		if !cont_i[i] {										//verifica se o vetor ainda nao recebeu valor true
			cont_i[i] = true
			obj = instance_find(obj_planta, i)
			scr_enviar("create_bonus", "item", "luva", "x", obj.x, "y", obj.y)
			instance_create_layer(obj.x, obj.y, "Bonus", obj_bonus_luva)
			cont ++
		}	
	}
	until (cont == 2)										//quantidade de icones de chutar bomba
}
if instance_exists(obj_oponente) obj_oponente.visible = true
if instance_exists(obj_bonus_bomba) obj_bonus_bomba.visible = true
if instance_exists(obj_bonus_chutar_bomba) obj_bonus_chutar_bomba.visible = true
if instance_exists(obj_bonus_luva) obj_bonus_luva.visible = true
if instance_exists(obj_bonus_poder_bomba) obj_bonus_poder_bomba.visible = true

scr_posicionar_jogador(obj_player, global.cliente_id)				//posicionar jogador na arena
scr_enviar("position_update", "x", obj_player.x ,"y", obj_player.y, "s", 0)	//envia para o server sua posicao