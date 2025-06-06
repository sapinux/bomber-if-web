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
		
		show_debug_message("O server nos enviou: " + buffer_processed)	//-------------------depuração
		
		var player
		var bomba
		var oponente
		
		switch (event_name) {
			case "Você foi criado!":
				global.cliente_id = (real_data[? "jogador"])	//recebe o id definido pelo server
				global.sala = (real_data[? "sala"])				//recebe a sala definida pelo server
				if global.cliente_id == 1 {
					global.lider = true		//se for o primeiro da sala, assumira a lideranca
					scr_enviar("lider");	//notifica o server a sua liderança
				}
				player = instance_create_layer(0, 0, "Players", obj_player)
				with (player) {
					global.jogadores[(real_data[? "jogador"])] = id								//atribui ao vetor o numero do jogador
					global.controle_jogadores[(real_data[? "jogador"])] = global.cliente_id		//atribui ao vetor o numero do jogador
				}
				
				show_debug_message("ID definido pelo server: " + string(global.cliente_id))		//---------------------------depuração
				break
			
			case "Jogador na sala!":
				
				//cria um oponente para representar o jogador que entrou na sala
				oponente = instance_create_layer(0, 0, "Players", obj_oponente)
				with (oponente) {
					global.jogadores[(real_data[? "jogador"])] = id										//armazena id
					global.controle_jogadores[(real_data[? "jogador"])] = (real_data[? "jogador"])		//atribui no vetor o numero do jogador
				}
				
				scr_enviar("Create oponente")	//envia para o jogador que voce está na sala
				
				//cronometrar inicio da partida após jogador entrar na sala
				obj_player_select.tempo = 300		//10 segundos		
								
				break
				
			case "Oponente criado!":
										
				if !(array_contains(global.controle_jogadores, (real_data[? "jogador"]))) {
					oponente = instance_create_layer(0, 0, "Players", obj_oponente)
					with (oponente) {
						global.jogadores[(real_data[? "jogador"])] = id									//armazena id
						global.controle_jogadores[(real_data[? "jogador"])] = (real_data[? "jogador"])	//atribui no vetor o numero do jogador
					}
					
				}
				
				//cronometrar inicio da partida	após jogador entrar na sala
				obj_player_select.tempo = 300		//10 segundos
				
				break
						
			case "Iniciar partida!":
				//se estiver na tela de selecao de personagem
				if room == rm_player_select scr_escolher_jogador(obj_player_select.x, obj_player_select.y)	//definir o personagem
				
				room_goto(r_fase_01)	//carrega a fase de batalha
				break
			
			case "Jogador escolhido!":
				scr_carregar_sprites(global.jogadores[(real_data[? "jogador"])], real_data[? "item"])	//carrega sprites dos oponentes
				show_debug_message(real_data[? "item"])													//---------depuracao
				break
			
			case "Position update!":
				with (global.jogadores[(real_data[? "jogador"])]) {
					if (real_data[? "x"]) x = (real_data[? "x"])		//recebe o x do server
					if (real_data[? "y"]) y = (real_data[? "y"])		//recebe o y do server
					sprite_index = imagem[(real_data[? "s"])]			//recebe o sprite do server
				}
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
			
			case "Morreu!":
				with (global.jogadores[(real_data[? "jogador"])]) {
					vivo = false
					sprite_index = imagem[9]						//carrega sprite de morte
				}
				
				global.jogadores_mortos ++							//conta a morte do oponente
				if global.lider obj_cliente.alarm[0] = 20			//se for lider aciona alarm[0] para verificar jogadores mortos, (0,7 seg)
				break
			
			case "Oponente saiu!":
				
				with (global.jogadores[(real_data[? "jogador"])]) {
					if vivo == false								//se o morto saiu
						global.jogadores_mortos --					//equilibra o contador de morte do oponente
					instance_destroy()								//destroi o obj_oponente
				}
								
				
				global.jogadores[(real_data[? "jogador"])] = 0						//atribui 0 para o vetor do jogador que saiu
				global.controle_jogadores[(real_data[? "jogador"])] = 0				//atribui 0 para o vetor do jogador que saiu
				
				if !instance_exists(obj_oponente)	{
					scr_enviar("sair")								//se não houver mais ninguem na partida - envia p o server sair da sala
					room_goto(rm_01)								//retorna para a tela inicial do jogo
				}
				break
			
			case "Novo lider!":
				global.lider = true														//vc assume a liderança
				scr_enviar("lider");													//notifica o server a liderança
				if (room == rm_placar || room == rm_empate) obj_cliente.alarm[1] = 30	//se estiver na tela de placar, assume o alarm[1]
				if (room == r_fase_01)	obj_cliente.alarm[0] = 20						//se for lider inicia alarm[0] do obj_cliente para verificar jogadores mortos (0,7 segundos)							//verifica mortes
				break
				
			case "Placar!":
				//atribui pontuacao ao jogador informado no "item"
				with (global.jogadores[(real_data[? "item"])]) {
					pontos ++
				}
				
				room_goto(rm_placar)		//carrega tela de placar
				break
				
			case "Empate!":
				room_goto(rm_empate)		//carrega tela de empate
				break
			
			case "Campeao!":
				room_goto(rm_campeao)		//carrega tela de campeao
				obj_cliente.alarm[1] = global.tempo_placar	
				break
				
		}
		break
}