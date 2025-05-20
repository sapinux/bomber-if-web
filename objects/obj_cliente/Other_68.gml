switch(async_load[?"type"]) {
	case network_type_non_blocking_connect:
		//código que é executado quando nos conectamos
			
		var buffer = buffer_create(global.size, buffer_grow, global.size)	//buffer da mensagem p o server
		var data = ds_map_create()			//criacao do mapa de valores
		data[? "eventName"] = "create_player_request"
		data[? "name"] = get_string_async("Digite o nome", "sem nome") 
		
		buffer_write(buffer , buffer_text  , json_encode(data));	//escrever conteudo do buffer
		network_send_raw(global.socket, buffer , buffer_tell(buffer));	//envio da msg
		ds_map_destroy(data);
		
		break
	case network_type_data:
		
		break
}