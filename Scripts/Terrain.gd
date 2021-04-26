extends Node2D

var everything_paused = false

func are_all_light_on():
	var lamps_lit = 0
	for lamp in $Lamps.get_children():
		if lamp.lamp_on:
			lamps_lit += 1

	return lamps_lit == $Lamps.get_child_count()

func toggle_pause():
	if everything_paused:
		print("Unpaused!")
	else:
		print("Paused")
		
	everything_paused = !everything_paused
