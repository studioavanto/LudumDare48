extends Sprite

export var lamp_timer = 0.0
var lamp_on = false

func _ready():
	$LightSource.toggle_light()
	$Timer.connect("timeout", self, "close_lamp")
	$Timer.wait_time = lamp_timer

func interact_object():
	if $Message != null:
		$Message.fade_to_view()

	if not lamp_on:
		$LightSource.toggle_light()
		lamp_on = true
		
		if lamp_timer > 0.0:
			$Timer.start()
			
		get_parent().lit_lamp()

func close_lamp():
	$LightSource.toggle_light()
	lamp_on = false
	get_parent().close_lamp()

func permanent_light():
	$Timer.stop()
