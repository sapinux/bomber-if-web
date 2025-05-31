function scr_limpar_bonus(){
	if instance_exists(obj_bonus_bomba) instance_destroy(obj_bonus_bomba)
	if instance_exists(obj_bonus_chutar_bomba) instance_destroy(obj_bonus_chutar_bomba)
	if instance_exists(obj_bonus_luva) instance_destroy(obj_bonus_luva)
	if instance_exists(obj_bonus_poder_bomba) instance_destroy(obj_bonus_poder_bomba)
}