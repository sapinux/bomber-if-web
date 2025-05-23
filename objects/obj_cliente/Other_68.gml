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
				//cria um oponente para representar o jogador
				oponente = instance_create_layer(0, 0, "Players", obj_oponente)
				with (oponente) {
					global.jogadores[(real_data[? "jogador"])] = id
					scr_posicionar_jogador(oponente, (real_data[? "jogador"]))
				}
				
				var buffer = buffer_create(global.size, buffer_grow, global.size)	//buffer da mensagem p o server
				var data = ds_map_create()			//criacao do mapa de valores
				data[? "event_name"] = "Create oponente"
				data[? "id"] = global.cliente_id	//envia o numero do jogador
				
				buffer_write(buffer , buffer_text  , json_encode(data));	//escrever conteudo do buffer
				network_send_raw(global.socket, buffer , buffer_tell(buffer));	//envio da msg
				ds_map_destroy(data);
				
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
		}
		break
}