extends Node

enum GameState { CONTROL_PLAYER, CONTROL_PAUSE, CONTROL_NULL }

var current_gamestate = GameState.CONTROL_PLAYER
var next_gamestate = GameState.CONTROL_NULL
var alive = true

func die():
	if(alive):
		alive = false
		get_parent().death_is_now()

func change_game_state(new_state : int):
	print("New state %s" % new_state)
	if new_state > GameState.CONTROL_NULL or new_state < 0:
		print("New state not possible! ({0})".format(new_state))
		return

	next_gamestate = new_state

func get_gamestate():
	return current_gamestate

func _process(_delta):
	if next_gamestate != GameState.CONTROL_NULL:
		current_gamestate = next_gamestate
		next_gamestate = GameState.CONTROL_NULL
