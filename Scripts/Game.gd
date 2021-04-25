extends Node2D

func _ready():
	change_state(0)
	set_player_to_start_location()

func change_state(current_state):
	$MusicManager.change_song(current_state)

func set_player_to_start_location():
	$PlayerController/MoveController/PlayerBody.position = $Terrain/StartLocation.position
