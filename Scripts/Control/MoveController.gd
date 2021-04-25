extends "res://Scripts/Control/Controllable.gd"

export var speed = 1000
var velocity = Vector2(0.0, 0.0)
var look_dir = Vector2(1.0, 0.0)
var previous_look_dir = Vector2(1.0, 0.0)
var angle = 0.0
export var aim_distance  = 100.0

func _ready():
	control_id = 0

func interact_with_interactable():
	for area in $PlayerBody/InteractArea.get_overlapping_areas():
		print(area)
		area.get_parent().interact_object()

func handle_inputs():
	if Input.is_action_just_pressed("pause"):	
		get_parent().change_game_state(1)
		return
	
	if Input.is_action_just_pressed("interact"):
		interact_with_interactable()
	
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	velocity = speed*velocity.normalized()
	
	if(velocity.length() > 0.01):
		$PlayerBody/Sprite.rotation = lerp_angle($PlayerBody/Sprite.rotation, 3.14159/2 + velocity.angle(), 0.1)
	$PlayerBody.move_and_slide(velocity)
