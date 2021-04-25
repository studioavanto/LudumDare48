extends TextureRect

# Declare member variables here. Examples:
var fuel_textures = [
	preload("res://Grafiikka/UI/Lamppu/lamppu.png"), 
	preload("res://Grafiikka/UI/Lamppu/lamppu2.png"),
	preload("res://Grafiikka/UI/Lamppu/lamppu3.png"),
	preload("res://Grafiikka/UI/Lamppu/lamppu4.png"),
	preload("res://Grafiikka/UI/Lamppu/lamppu5.png"),
	preload("res://Grafiikka/UI/Lamppu/lamppu6.png")]
# var b = "text"

func set_texture(fuel_amount):
	var ind = int(fuel_amount*5)
	texture = fuel_textures[ind]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
