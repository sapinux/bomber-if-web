//distribuir icones de bonus
randomize()												//evitar que o random repita os mesmos valores

//preencher a variavel cont_i[i] com o valor 'false' com base na quantidade de objetos 'obj_planta'
for (i = 0; i < (instance_number(obj_planta)); i++) cont_i[i] = false

//distribuir icones de bombas
cont = 0
do {
	i = irandom(instance_number(obj_planta)-1)
	if !cont_i[i] {
		cont_i[i] = true								//verifica se o vetor ainda nao recebeu valor true
		obj = (instance_find(obj_planta, i))
		instance_create_layer(obj.x, obj.y, "Bonus", obj_bonus_bomba)
		cont ++
	}	
}
until (cont == 10)										//quantidade de icones de bombas

//distribuir icones de poder bomba
cont = 0
do {
	i = irandom(instance_number(obj_planta)-1)
	if !cont_i[i] {										//verifica se o vetor ainda nao recebeu valor true
		cont_i[i] = true
		obj = instance_find(obj_planta, i)
		instance_create_layer(obj.x, obj.y, "Bonus", obj_bonus_poder_bomba)
		cont ++
	}	
}
until (cont == 10)										//quantidade de icones de poder bomba

//distribuir icones de chutar bomba
cont = 0
do {
	i = irandom(instance_number(obj_planta)-1)
	if !cont_i[i] {										//verifica se o vetor ainda nao recebeu valor true
		cont_i[i] = true
		obj = instance_find(obj_planta, i)
		instance_create_layer(obj.x, obj.y, "Bonus", obj_bonus_chutar_bomba)
		cont ++
	}	
}
until (cont == 4)										//quantidade de icones de chutar bomba

//distribuir icones de luva
cont = 0
do {
	i = irandom(instance_number(obj_planta)-1)
	if !cont_i[i] {										//verifica se o vetor ainda nao recebeu valor true
		cont_i[i] = true
		obj = instance_find(obj_planta, i)
		instance_create_layer(obj.x, obj.y, "Bonus", obj_bonus_luva)
		cont ++
	}	
}
until (cont == 2)										//quantidade de icones de chutar bomba
