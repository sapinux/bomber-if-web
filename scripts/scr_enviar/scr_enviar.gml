function scr_enviar(event_name, tipo = "", conteudo = "", tipo_2 = "", conteudo_2 = ""){
		var buffer = buffer_create(global.size, buffer_grow, global.size)	//buffer da mensagem p o server
		var data = ds_map_create()			//criacao do mapa de valores
		data[? "event_name"] = event_name
		if (tipo != "") && (conteudo != "") data[? tipo] = conteudo				
		if (tipo_2 != "") && (conteudo_2 != "") data[? tipo_2] = conteudo_2
		data[? "id"] = global.cliente_id	//a identificação do jogador
				
		buffer_write(buffer , buffer_text  , json_encode(data));	//escrever conteudo do buffer
		network_send_raw(global.socket, buffer , buffer_tell(buffer));	//envio da msg
		ds_map_destroy(data);
}

