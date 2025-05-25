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
		
		var oponente
		
		switch (event_name) {
			case "Você foi criado!":
				global.cliente_id = (real_data[? "id"])
				show_debug_message("ID definido pelo server: " + string(global.cliente_id))	//depuração
				break
			case "Jogador na sala!":
				//cria um oponente para representar o jogador que entrou na sala
				oponente = instance_create_layer(0, 0, "Players", obj_oponente)
				with (oponente) {
					global.jogadores[(real_data[? "jogador"])] = id
					scr_posicionar_jogador(oponente, (real_data[? "jogador"]))
				}
				
				scr_enviar("Create oponente")	//envia para o jogador que tambem estou na sala
								
				break
			case "Oponente criado!":
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
			case "Create item!":
				if (real_data[? "item"]) == "bomba"
					var bomba = instance_create_layer(global.jogadores[(real_data[? "jogador"])].x, global.jogadores[(real_data[? "jogador"])].y, "Action", obj_bomba)	//criar bomba
					bomba.poder_bomba = (real_data[? "poder_bomba"])
				break
			case "Chutar bomba!":
				if ((real_data[? "x"] < 0) || (real_data[? "x"] > 0)) {
					with (instance_nearest(global.jogadores[(real_data[? "jogador"])].x + (real_data[? "x"]), global.jogadores[(real_data[? "jogador"])].y, obj_bomba))
						hspeed = 4 * sign(real_data[? "x"])
						show_debug_message("valor x " +  string(sign(real_data[? "x"])))	//depuração
				}
				if ((real_data[? "y"] < 0) || (real_data[? "y"] > 0)) {
					with (instance_nearest(global.jogadores[(real_data[? "jogador"])].x , global.jogadores[(real_data[? "jogador"])].y + (real_data[? "y"]), obj_bomba))
						vspeed = 4 * sign(real_data[? "y"])
						show_debug_message("valor y" +  string(sign(real_data[? "y"])))	//depuração
				}
				
				break
		}
		break
}