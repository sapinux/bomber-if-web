//room empate
if instance_exists(obj_player) {
	with (global.jogadores[global.cliente_id]) {
		visible = true				//torna visivel
		sprite_index = imagem[0]	//imagem básica
		alarm[0] = noone			//cancela alarm[0]
		image_alpha = 1				//recupera a opacidade
		vivo = false				
	}
}

if instance_exists(obj_oponente) {
	var oponente
	for (i = 0; i < instance_number(obj_oponente); i ++) {
		oponente = instance_find(obj_oponente, i)
		with (oponente) {
			oponente.visible = true					//torna visivel
			oponente.sprite_index = imagem[0]		//imagem básica
		}
	}
}

//posicoes na fase 01
var posicoes = [[144, 176], [176, 176], [112, 176], [208, 176], [80, 176], [240, 176], [48, 176], [272, 176], [16, 176], [304, 176]] 
scr_posicionar_jogador(obj_player, global.cliente_id, posicoes)						//posicionar jogador na arena
scr_enviar("position_update", "x", obj_player.x ,"y", obj_player.y, "s", 0)			//envia para o server sua posicao