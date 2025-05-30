window_set_caption("id: " + string(global.cliente_id) + " sala: " + string(global.sala) + " op: " + string(instance_number(obj_oponente)) + " jogador : " + string(global.controle_jogadores[global.cliente_id]))
//quando concluir a animacao de morte
if (sprite_index == imagem[9]) && (image_index>=4) && (visible) {
	scr_neutralizar_jogador()
	visible = false
	alarm[0] = 90		//tempo para voltar como fantasma
	//instance_destroy()
}	
//se a explosao atingir o player
if (place_meeting(x, y, obj_explosao)) && vivo	{									
	scr_enviar("morte")		//envia p o server que morreu
	script_execute(scr_jogador_morrendo)	//aciona o sprite de morte
	obj_cliente.alarm[0] = 60				//tempo para verificar jogadores mortos
}