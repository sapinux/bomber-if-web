switch(async_load[?"type"]) {
	case network_type_non_blocking_connect:
		//código que é executado quando nos conectamos
		show_debug_message("Conectamos com o server")		
		
		break
	case network_type_data: 
		
		//código que é executado quando recebemos qualquer dado do server
		var buffer_raw = async_load[? "buffer"];
		var buffer_processed = buffer_read(buffer_raw, buffer_text)
		var real_data = json_decode(buffer_processed)
		var event_name = real_data[? "event_name"]
		show_debug_message("O server nos enviou: " + buffer_processed)	//depuração
		
		var bomba
		var oponente
		
		switch (event_name) {
			case "Você foi criado!":
				global.cliente_id = (real_data[? "id"])
				global.sala = (real_data[? "sala"])
				if global.cliente_id == 1 global.lider = true //se for o primeiro da sala, assumira a lideranca
				show_debug_message("ID definido pelo server: " + string(global.cliente_id))	//depuração
				break
			case "Jogador na sala!":
				//cria um oponente para representar o jogador que entrou na sala
				oponente = instance_create_layer(0, 0, "Players", obj_oponente)
				with (oponente) {
					global.jogadores[(real_data[? "jogador"])] = id
					scr_posicionar_jogador(oponente, (real_data[? "jogador"]))
				}
				
				scr_enviar("Create oponente")	//envia para o jogador que voce está na sala
				
				//cronometrar inicio da partida
				if !(global.lider) obj_player_select.tempo = 300			
				else obj_player_select.tempo = 310	//se for o lider
				
				break
			case "Oponente criado!":
				//cronometrar inicio da partida
				if !(global.lider) obj_player_select.tempo = 300		
				else obj_player_select.tempo = 310	//se for o lider
				
				if (global.jogadores[(real_data[? "jogador"])] == noone) {	//verifica se o oponente já foi criado
					oponente = instance_create_layer(0, 0, "Players", obj_oponente)
					with (oponente) {
						global.jogadores[(real_data[? "jogador"])] = id
						scr_posicionar_jogador(oponente, (real_data[? "jogador"]))
					}
				}				
				break
			case "Position update!":
				if (real_data[? "x"]) global.jogadores[(real_data[? "jogador"])].x = (real_data[? "x"])
				if (real_data[? "y"]) global.jogadores[(real_data[? "jogador"])].y = (real_data[? "y"])
				break
			case "Create bomba!":
				if (real_data[? "item"]) == "bomba"
					bomba = instance_create_layer(global.jogadores[(real_data[? "jogador"])].x, global.jogadores[(real_data[? "jogador"])].y, "Action", obj_bomba)	//criar bomba
					bomba.poder_bomba = (real_data[? "poder_bomba"])
				break
			case "Chutar bomba!":
				if ((real_data[? "x"] < 0) || (real_data[? "x"] > 0)) {
					with (instance_nearest(global.jogadores[(real_data[? "jogador"])].x + (real_data[? "x"]), global.jogadores[(real_data[? "jogador"])].y, obj_bomba))
						hspeed = 4 * sign(real_data[? "x"])
				}
				if ((real_data[? "y"] < 0) || (real_data[? "y"] > 0)) {
					with (instance_nearest(global.jogadores[(real_data[? "jogador"])].x , global.jogadores[(real_data[? "jogador"])].y + (real_data[? "y"]), obj_bomba))
						vspeed = 4 * sign(real_data[? "y"])
				}
				
				break
			case "Lancar bomba!":
				if (real_data[? "item"]) == "bomba"
					bomba = instance_create_layer(global.jogadores[(real_data[? "jogador"])].x, global.jogadores[(real_data[? "jogador"])].y, "Action", obj_bomba_pulando)	//criar bomba pulando
					with (bomba){
						switch (real_data[? "direcao"]) {
							case "cima":
								vspeed = -4
								break
							case "baixo":
								vspeed = 4
								break
							case "esquerda":
								hspeed = -4
								break
							case "direita":
								hspeed = 4
								break
						}
					}
				break
			case "Create bonus!":
				switch (real_data[? "item"]) {
					case "bomba":
						instance_create_layer(real_data[? "x"], real_data[? "y"], "Bonus", obj_bonus_bomba)
						break
					case "poder_bomba":
						instance_create_layer(real_data[? "x"], real_data[? "y"], "Bonus", obj_bonus_poder_bomba)
						break
					case "chutar_bomba":
						instance_create_layer(real_data[? "x"], real_data[? "y"], "Bonus", obj_bonus_chutar_bomba)
						break
					case "luva":
						instance_create_layer(real_data[? "x"], real_data[? "y"], "Bonus", obj_bonus_luva)
						break
				}
				break
		}
		break
}