extends "res://Scripts/Control/Controllable.gd"

func _ready():
	control_id = 2

func handle_inputs():
	if Input.is_action_just_pressed("interact"):
		get_parent().get_parent().get_node("UIContainer/ChangeSceneRect").fade_out_active()
	
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
