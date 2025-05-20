global.socket = network_create_socket(network_socket_ws)		//tipo de conexao com o server
global.ip = "127.0.0.1"											//ip do server
global.porta = 3000												//porta utilizada no server
network_connect_raw(global.socket, global.ip, global.porta)		//conexao com o server