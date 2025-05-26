global.cliente_id = 0												//identificador do cliente
global.sala = 0														//identificador da sala
global.size = 1														//tamanho do pacote em bytes
global.socket = network_create_socket(network_socket_ws)			//tipo de conexao com o server
global.ip = "200.131.5.41"											//ip do server
global.porta = 3000													//porta utilizada no server
global.lider = false												//define se é lider da sala
global.jogadores = []												//vetor para armazenar o id do oponente
network_connect_raw_async(global.socket, global.ip, global.porta)	//conexao com o server

for (i = 0;i < 11; i ++) global.jogadores[i] = noone				//guardará os id dos oponentes