extends KinematicBody2D


# Declare member variables here. Examples:
var state = "Waiting"
# var b = "text"
export var speed = 300
export var attack_dist = 70
var look_dir = Vector2(1.0, 0.0)
var dist_to_light = 1.0
export var see_dist = 500
export var light_slowdown = 0.7
onready var target = get_parent().get_parent().get_node("PlayerController/MoveController/PlayerBody")
onready var navi2d = get_parent().get_node("Navigation2D")
var in_light = false
var in_intense_light = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout",self,"go_hunting")
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.

func go_hunting():
	state = "Hunting"

func in_line_of_sight():
	var in_los = 0
	if(position.distance_to(target.position) < see_dist):
		in_los = 1
	return(in_los)
func in_attack_distance():
	var in_range = 0
	if(position.distance_to(target.position) < attack_dist):
		in_range = 1
	return(in_range)

func _physics_process(delta):

	if(state == "Fleeing"):
		pass
	elif(in_attack_distance()==1):
		state = "Attacking"
	elif(in_line_of_sight()==1):
		state = "Hunting"

	in_light = false
	for area in $Area2D.get_overlapping_areas():
		if(area.collision_mask == 1):
			dist_to_light = position.distance_to(target.global_position)/400
			in_light = true
		if(area.collision_mask == 32 and state != "Fleeing"):
			$Timer.start()
			state = "Fleeing"
			in_light = true
	
	match state:
		"Waiting":
			pass
		"Fleeing":
			move_and_slide(target.position.direction_to(position)*speed)
		"Hunting":
			var path = navi2d.get_simple_path(position, target.position, true)
			
			if(in_light):
				if(path.size()>1):
					move_and_slide(position.direction_to(path[1])*speed*dist_to_light)
			else:
				if(path.size()>1):
					move_and_slide(position.direction_to(path[1])*speed)
		"Attacking":
			get_parent().get_parent().get_node("PlayerController").die()
	look_at(look_dir)
#	pass
