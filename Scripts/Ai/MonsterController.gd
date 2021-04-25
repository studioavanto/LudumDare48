extends KinematicBody2D


# Declare member variables here. Examples:
var state = "Waiting"
# var b = "text"
export var speed = 300
export var attack_dist = 100
var look_dir = Vector2(1.0, 0.0)
export var see_dist = 500
onready var target = get_parent().get_parent().get_node("PlayerController/MoveController/PlayerBody")
onready var navi2d = get_parent().get_node("Navigation2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

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

	if(in_attack_distance()==1):
		state = "Attacking"
	elif(in_line_of_sight()==1):
		state = "Hunting"

	match state:
		"Waiting":
			pass
		"Hunting":
			var path = navi2d.get_simple_path(position, target.position, true)
			move_and_slide(position.direction_to(path[1])*speed)
			
		"Attacking":
			pass

	look_at(look_dir)
#	pass
