switch(async_load[?"type"]) {
	case network_type_non_blocking_connect:
		//código que é executado quando nos conectamos
			
		var buffer = buffer_create(global.size, buffer_grow, global.size)	//buffer da mensagem p o server
		var data = ds_map_create()			//criacao do mapa de valores
		data[? "event_name"] = "create_player_request"
		data[? "name"] = "sapinux" //get_string_async("Digite o nome", "sem nome") 
				
		buffer_write(buffer , buffer_text  , json_encode(data));	//escrever conteudo do buffer
		network_send_raw(global.socket, buffer , buffer_tell(buffer));	//envio da msg
		ds_map_destroy(data);
					
		
		
		break
	case network_type_data: 
		//código que é executado quando recebemos qualquer dado do server
		var buffer_raw = async_load[? "buffer"];
		var buffer_processed = buffer_read(buffer_raw, buffer_text)
		var real_data = json_decode(buffer_processed)
		var event_name = real_data[? "event_name"]
		show_debug_message("O server nos enviou: " + buffer_processed)	//depuração
		
		switch (event_name) {
			case "Você foi criado!":
				global.cliente_id = (real_data[? "id"])
				show_debug_message("ID definido pelo server: " + string(global.cliente_id))	//depuração
				break
			case "Jogador na sala!":
				var oponente = instance_create_layer(0, 0, "Players", obj_oponente)
				with (oponente) {
					
				}
				break
		}
		break
}