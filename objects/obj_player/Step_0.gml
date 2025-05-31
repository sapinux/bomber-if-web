window_set_caption("id: " + string(global.cliente_id) + " op mortos " + string(global.oponentes_mortos) + " op: " + string(instance_number(obj_oponente)) + " vivo : " + string(visible) + " image : " + string(image_alpha))
//quando concluir a animacao de morte

if (sprite_index == imagem[9]) && (image_index>=4) && (visible) {
	scr_jogador_fantasma()
	visible = false
	alarm[0] = 90		//tempo para voltar como fantasma
	
}	

//se a explosao atingir o player
if (place_meeting(x, y, obj_explosao)) && vivo	{									
	if image_alpha == 1 scr_enviar("morte")		//envia p o server que morreu
	script_execute(scr_jogador_morrendo)		//aciona o sprite de morte
	if global.lider obj_cliente.alarm[0] = 30	//tempo para verificar jogadores mortos
}