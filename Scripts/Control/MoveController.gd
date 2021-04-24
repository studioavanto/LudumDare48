extends "res://Scripts/Control/Controllable.gd"

export var speed = 400
var velocity = Vector2(0.0, 0.0)
var look_dir = Vector2(1.0, 0.0)
export var aim_distance  = 100.0

func _ready():
	control_id = 0

func handle_inputs():
	if Input.is_action_just_pressed("pause"):	
		get_parent().change_game_state(1)
		return
	
	velocity.x = speed * (Input.get_action_strength("move_right") - Input.get_action_strength("move_left"))
	velocity.y = speed * (Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))
	
	if Input.is_action_pressed("aim"):
		$PointDirection.position = $PlayerBody.position + aim_distance * (get_viewport().get_mouse_position() - get_viewport().size / 2).normalized()
	else:
		$PointDirection.position = $PlayerBody.position + velocity / 10.0
		
	$PlayerBody.move_and_slide(velocity)
	$PlayerBody.look_at($PointDirection.position)
