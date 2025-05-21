function scr_enviar(){
		var buffer = buffer_create(global.size, buffer_grow, global.size)	//buffer da mensagem p o server
		var data = ds_map_create()			//criacao do mapa de valores
		data[? "event_name"] = "position_update"
		data[? "x"] = x 
		data[? "y"] = y
				
		buffer_write(buffer , buffer_text  , json_encode(data));	//escrever conteudo do buffer
		network_send_raw(global.socket, buffer , buffer_tell(buffer));	//envio da msg
		ds_map_destroy(data);
}