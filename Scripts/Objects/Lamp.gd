extends Sprite

var lamp_on = false
var message_shown = false

func _ready():
	$LightSource.toggle_light()

func interact_object():
	if not message_shown and $Message != null:
		message_shown = true
		$Message.fade_to_view()

	$LightSource.toggle_light()
	lamp_on = !lamp_on
