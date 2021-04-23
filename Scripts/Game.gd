extends Node2D

func _ready():
	change_state(0)

func change_state(current_state):
	$MusicManager.change_song(current_state)
