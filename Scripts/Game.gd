extends Node2D

var game_stage = "INTRO"
var current_stage = 0
var scene_transition = false
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
		$UIContainer/ChangeSceneRect.modulate = Color(1.0, 1.0, 1.0, 0.0)
	else:
		add_child(load(maps[current_stage]).instance())
		$PlayerController.change_game_state(2)
		move_to_next_stage()
	
	set_player_to_start_location()

func set_player_to_start_location():
	$PlayerController/MoveController/PlayerBody.position = $Terrain/StartLocation.position
	$PlayerController/MoveController/PlayerBody/Inventory_node.reset_inventory()
	$PlayerController/MoveController/PlayerBody/Sprite/LightSource.turn_on_light()
	$PlayerController.alive = true

func end_scene_if_possible():
	if $Terrain.are_all_light_on():
		move_to_next_stage()

func death_is_now():
	current_stage -= 1
	$PlayerController.change_game_state(2)
	$UIContainer/ChangeSceneRect.fade_in_background()
	$UIContainer/ChangeSceneRect.transition_to_stage("DEATH")

func destroy_current_map():
	if game_stage == "GAME":
		get_node("Terrain").connect("tree_exited", self, "load_next_map")
		get_node("Terrain").queue_free()

func load_next_map():
	print("new map has been loaded")
	add_child(load(maps[(1+current_stage) / 2]).instance())
	set_player_to_start_location()

func start_next_map():
	$PlayerController.change_game_state(0)

func move_to_next_stage():
	current_stage += 1
	if current_stage == 5 and game_stage == "INTRO":
		current_stage = 1
		game_stage = "GAME"
	elif current_stage == 10 and game_stage == "GAME":
		current_stage = 1
		game_stage = "OUTRO"
	elif current_stage == 3 and game_stage == "OUTRO":
		get_tree().quit()
	
	match game_stage:
		"INTRO":
			$UIContainer/ChangeSceneRect.transition_to_stage("INTRO", current_stage)
		"GAME":
			if (current_stage % 2 == 0):
				$PlayerController.change_game_state(2)
				$UIContainer/ChangeSceneRect.fade_in_background()
				$UIContainer/ChangeSceneRect.transition_to_stage("GAME", current_stage)
			else:
				$UIContainer/ChangeSceneRect.fade_out_background()
				start_next_map()
		"OUTRO":
			if current_stage == 1:
				$PlayerController.change_game_state(2)
				$UIContainer/ChangeSceneRect.fade_in_background()
			$UIContainer/ChangeSceneRect.transition_to_stage("OUTRO", current_stage)
		
