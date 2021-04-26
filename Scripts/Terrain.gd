extends Node2D

var everything_paused = false

func are_all_light_on():
	var lamps_lit = 0
	for lamp in $Lamps.get_children():
		if lamp.lamp_on:
			lamps_lit += 1

	return lamps_lit == $Lamps.get_child_count()

func toggle_pause(val):
	$Monsters.pause_monsters(val)
		
	everything_paused = val
