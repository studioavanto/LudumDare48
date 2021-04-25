extends Sprite

var lamp_on = false

func _ready():
	$LightSource.toggle_light()

func interact_object():
	$LightSource.toggle_light()
	lamp_on = !lamp_on
