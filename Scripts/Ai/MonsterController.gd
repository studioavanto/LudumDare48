extends KinematicBody2D


# Declare member variables here. Examples:
var state = "Waiting"
var pause = false
# var b = "text"
export var speed = 300
export var attack_dist = 100
var look_dir = Vector2(1.0, 0.0)
var dist_to_light = 1.0
export var see_dist = 500
export var light_slowdown = 0.7
onready var target = get_parent().get_parent().get_parent().get_node("PlayerController/MoveController/PlayerBody")
onready var navi2d = get_parent().get_parent().get_node("Navigation2D")
var in_light = false
var in_intense_light = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout",self,"go_hunting")
	$AnimationPlayer.play("idle")

func destroy_monster():
	state = "Dying"
	$AnimationPlayer.play("Die")
	$Timer.connect("timeout",self,"queue_free")
	$Timer.start(1)

func go_hunting():
	state = "Hunting"

func pause_monster(pause_m):
	pause = pause_m

func in_line_of_sight():
	var in_los = 0
	if(global_position.distance_to(target.global_position) < see_dist):
		in_los = 1
	return(in_los)
func in_attack_distance():
	var in_range = 0
	if(global_position.distance_to(target.global_position) < attack_dist):
		in_range = 1
	return(in_range)

func _physics_process(delta):
	if pause:
		return

	if (state == "Dying"):
		return
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
			target.get_parent().get_parent().die()

	look_at(look_dir)
#	pass
