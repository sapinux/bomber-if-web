//obs: variaveis globais sao definidas no obj_game_config
vel = global.player_velocidade;				//velocidade em pixels
bombas = global.bombas						//quantidade  de bombas
poder_bomba = global.poder_bomba			//alcance da explosao
vivo = false								//situacao de vida
chutar_bomba = global.chutar_bomba			//poder para chutar a bomba
luva = global.luva							//poder para lancar a bomba
direcao = "baixo"							//direcao padrao do player
//global.jogadores[global.cliente_id] = id	//carrega o vetor com id
global.id_pai = id							//player criador da bomba
imagem = []									//vetor para alocar os sprites do player

pontos = 0	//guardar pontuacao do player