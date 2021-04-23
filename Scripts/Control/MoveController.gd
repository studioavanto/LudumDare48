extends "res://Scripts/Control/Controllable.gd"

export var speed = 400
var velocity = Vector2(0.0, 0.0)

func _ready():
	control_id = 0

func handle_inputs():
	if Input.is_action_just_pressed("pause"):	
		get_parent().change_game_state(1)
		return
	
	velocity.x = speed * (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	velocity.y = speed * (Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
	
	$KinematicBody2D.move_and_slide(velocity)
