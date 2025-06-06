switch (opcoes[indice]) {
	case "INICIAR":
		room_goto(rm_player_select)		//encaminha para tela de selecao de jogador
		
		var buffer = buffer_create(global.size, buffer_grow, global.size)	//buffer da mensagem p o server
		var data = ds_map_create()											//criacao do mapa de valores
		data[? "event_name"] = "create_player_request"
		data[? "name"] = "sapinux"			//get_string_async("Digite o nome", "sem nome") 
				
		buffer_write(buffer , buffer_text  , json_encode(data));		//escrever conteudo do buffer
		network_send_raw(global.socket, buffer , buffer_tell(buffer));	//envio da msg
		ds_map_destroy(data);
		
		break
	case "CONFIGURAÇÕES":
		room_goto(rm_config)
		break
	case "SAIR":
		game_end()
		break
}