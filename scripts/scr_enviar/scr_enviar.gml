function scr_enviar(event_name, tipo = noone, conteudo = noone, tipo_2 = noone, conteudo_2 = noone){
		var buffer = buffer_create(global.size, buffer_grow, global.size)	//buffer da mensagem p o server
		var data = ds_map_create()			//criacao do mapa de valores
		data[? "event_name"] = event_name
		if (tipo != noone) && (conteudo != noone) data[? tipo] = conteudo				
		if (tipo_2 != noone) && (conteudo_2 != noone) data[? tipo_2] = conteudo_2
		data[? "id"] = global.cliente_id	//a identificação do jogador
				
		buffer_write(buffer , buffer_text  , json_encode(data));	//escrever conteudo do buffer
		network_send_raw(global.socket, buffer , buffer_tell(buffer));	//envio da msg
		ds_map_destroy(data);
}

