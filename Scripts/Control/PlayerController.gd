extends Node

enum GameState { CONTROL_PLAYER, CONTROL_PAUSE, CONTROL_CUTSCENE, CONTROL_NULL }

var current_gamestate = GameState.CONTROL_PLAYER
var next_gamestate = GameState.CONTROL_NULL
var alive = true

func die():
	if(alive):
		alive = false
		get_parent().death_is_now()

func set_fuel_ui():
	get_parent().get_node("UIContainer/Fuel").set_texture($MoveController/PlayerBody/Inventory_node.lamp_oil+0.08)

func get_pause_state():
	return current_gamestate != GameState.CONTROL_PLAYER

func change_game_state(new_state : int):
	if new_state > GameState.CONTROL_NULL or new_state < 0:
		print("New state not possible! ({0})".format(new_state))
		return

	next_gamestate = new_state
	
	if next_gamestate == GameState.CONTROL_PLAYER:
		get_parent().get_node("UIContainer/PauseInfo").fade_out()
	else:
		get_parent().get_node("UIContainer/PauseInfo").fade_in()
	
	if (next_gamestate == GameState.CONTROL_PAUSE):
		get_parent().get_node("UIContainer/PauseScreen").fade_in()
		get_parent().get_node("Terrain").toggle_pause(true)
	if (current_gamestate == GameState.CONTROL_PAUSE):
		get_parent().get_node("UIContainer/PauseScreen").fade_out()
		get_parent().get_node("Terrain").toggle_pause(false)
		
	if (next_gamestate == GameState.CONTROL_CUTSCENE):
		get_parent().get_node("Terrain").toggle_pause(true)
	if (current_gamestate == GameState.CONTROL_CUTSCENE and next_gamestate == GameState.CONTROL_PLAYER):
		get_parent().get_node("Terrain").toggle_pause(false)

func get_gamestate():
	return current_gamestate

func _process(_delta):
	if current_gamestate == GameState.CONTROL_PLAYER:
		set_fuel_ui()
	if next_gamestate != GameState.CONTROL_NULL:
		current_gamestate = next_gamestate
		next_gamestate = GameState.CONTROL_NULL
	
