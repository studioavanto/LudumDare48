extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var door_closed_sprite = preload("res://Grafiikka/Kartta/ovi kiinni.png")
var door_open_sprite = preload("res://Grafiikka/Kartta/oviauki.png")

var door_open = false

func interact_object():
	if door_open:
		close_door()
	else:
		open_door()

func open_door():
	get_tree().root.get_node("Game/GeneralSoundEffects").play_sound("door_open")
	$Door.texture = door_open_sprite
	$Door.position -= Vector2(130, -20)
	$ovi_varjo.light_mask = 4
	$OviSB/ovi.disabled = true
	door_open = true

func close_door():
	get_tree().root.get_node("Game/GeneralSoundEffects").play_sound("door_close")
	$Door.texture = door_closed_sprite
	$Door.position += Vector2(130, -20)
	$ovi_varjo.light_mask = 1
	$OviSB/ovi.disabled = false
	door_open = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
