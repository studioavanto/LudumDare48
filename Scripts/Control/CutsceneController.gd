extends "res://Scripts/Control/Controllable.gd"

func _ready():
	control_id = 2

func handle_inputs():
	if Input.is_action_just_pressed("unpause"):
		get_parent().change_game_state(0)
	
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
