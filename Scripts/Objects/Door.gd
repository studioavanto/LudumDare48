extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var door_open = false

func interact_object():
	if door_open:
		close_door()
	else:
		open_door()

func open_door():
	$Door.rotate(-5 * PI / 4)
	door_open = true

func close_door():
	$Door.rotate(5 * PI / 4)
	door_open = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
