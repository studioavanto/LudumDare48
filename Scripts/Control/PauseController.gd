extends "res://Scripts/Control/Controllable.gd"

func _ready():
	control_id = 1

func handle_inputs():
	if Input.is_action_just_pressed("pause"):	
		get_parent().change_game_state(0)
		
	if Input.is_action_just_pressed("number_1"):
		get_parent().get_parent().change_state(0)
		
	if Input.is_action_just_pressed("number_2"):
		get_parent().get_parent().change_state(1)

	if Input.is_action_just_pressed("number_3"):
		get_parent().get_parent().change_state(2)

	if Input.is_action_just_pressed("number_4"):
		get_parent().get_parent().change_state(3)

