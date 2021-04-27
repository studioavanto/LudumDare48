extends TextureRect

var fuel_textures = [
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI00.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI01.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI02.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI03.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI04.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI05.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI06.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI07.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI08.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI09.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI10.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu_UI11.png"), 
	]

func set_texture(fuel_amount):
	var ind = int(fuel_amount*11)
	texture = fuel_textures[ind]

