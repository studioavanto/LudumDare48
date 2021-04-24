extends "res://Scripts/Control/Controllable.gd"

export var speed = 1000
var velocity = Vector2(0.0, 0.0)
var look_dir = Vector2(1.0, 0.0)
export var aim_distance  = 100.0

func _ready():
	control_id = 0

func handle_inputs():
	if Input.is_action_just_pressed("pause"):	
		get_parent().change_game_state(1)
		return
	
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	velocity = speed*velocity.normalized()
	
	$PlayerBody.move_and_slide(velocity)
	$PlayerBody.look_at(get_viewport().get_mouse_position() - get_viewport().size / 2 +$PlayerBody.position)
