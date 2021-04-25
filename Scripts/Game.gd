extends Node2D

var current_stage = 0
var maps = [ 
	"res://Scenes/Maps/Map0.tscn",
	"res://Scenes/Maps/Map1.tscn"
]

func _ready():
	set_player_to_start_location()

func set_player_to_start_location():
	$PlayerController/MoveController/PlayerBody.position = $Terrain/StartLocation.position

func end_scene_if_possible():
	if $Terrain.are_all_light_on():
		$CanvasLayer/ChangeSceneRect.fade_to_scene(current_stage + 1)

func death_is_now():
	$CanvasLayer/ChangeSceneRect.fade_to_scene(69)
	current_stage -= 1

func destroy_current_map():
	get_node("Terrain").connect("tree_exited", self, "load_next_map")
	get_node("Terrain").queue_free()

func load_next_map():
	add_child(load(maps[current_stage + 1]).instance())
	self.set_player_to_start_location()
	current_stage =+ 1
