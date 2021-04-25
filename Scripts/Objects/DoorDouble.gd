extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var door_closed_sprite = preload("res://Grafiikka/Kartta/Ovet/ovikiinni_pysty_vasen.png")
var door_open_sprite = preload("res://Grafiikka/Kartta/Ovet/oviauki_pysty_2.png")

var door_open = false

func interact_object():
	if door_open:
		close_door()
	else:
		open_door()

func open_door():
	$Door.texture = door_open_sprite
	$ovi_varjo.light_mask = 4
	$OviSB/ovi.disabled = true
	door_open = true

func close_door():
	$Door.texture = door_closed_sprite
	$ovi_varjo.light_mask = 1
	$OviSB/ovi.disabled = false
	door_open = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
