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
	$Door.rotate(Vector3(0, 0, 0), -5 * PI / 4)

func close_door():
	$Door.rotate(Vector3(0, 0, 0), 5 * PI / 4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
