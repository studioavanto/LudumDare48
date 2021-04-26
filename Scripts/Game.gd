extends Node2D

var current_stage = 0
export var test = false

var maps = [ 
	"res://Scenes/Maps/Map0.tscn",
	"res://Scenes/Maps/Map1.tscn",
	"res://Scenes/Maps/Map2.tscn",
	"res://Scenes/Maps/Map3.tscn",
	"res://Scenes/Maps/Map4.tscn"
]

var test_map = "res://Scenes/Maps/IlmoTestMap.tscn"

func _ready():
	if test:
		add_child(load(test_map).instance())
	else:
		add_child(load(maps[current_stage]).instance())
	set_player_to_start_location()

func set_player_to_start_location():
	$PlayerController/MoveController/PlayerBody.position = $Terrain/StartLocation.position
	$PlayerController/MoveController/PlayerBody/Inventory_node.reset_inventory()
	$PlayerController/MoveController/PlayerBody/Sprite/LightSource.turn_on_light()
	$PlayerController.alive = true

func end_scene_if_possible():
	if $Terrain.are_all_light_on():
		$CanvasLayer/ChangeSceneRect.fade_to_scene(current_stage + 1)

func death_is_now():
	current_stage -= 1
	$CanvasLayer/ChangeSceneRect.fade_to_scene(69)

func destroy_current_map():
	get_node("Terrain").connect("tree_exited", self, "load_next_map")
	get_node("Terrain").queue_free()

func load_next_map():
	current_stage += 1
	add_child(load(maps[current_stage]).instance())
	set_player_to_start_location()
