extends TextureRect

var fuel_textures = [
	preload("res://Grafiikka/UI/Lamppu/lamppu.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu2.png"),
	preload("res://Grafiikka/UI/Lamppu/lamppu3.png"),
	preload("res://Grafiikka/UI/Lamppu/lamppu4.png"),
	preload("res://Grafiikka/UI/Lamppu/lamppu5.png"),
	preload("res://Grafiikka/UI/Lamppu/lamppu6.png")]

func set_texture(fuel_amount):
	var ind = int(fuel_amount*5)
	texture = fuel_textures[ind]

