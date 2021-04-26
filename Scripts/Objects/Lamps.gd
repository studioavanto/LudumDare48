extends Node2D

var all_lamps_are_lit = false
var lamps_lit = 0

func lit_lamp():
	lamps_lit += 1
	if lamps_lit == get_child_count():
		all_lamps_are_lit = true
		for lamp in get_children():
			lamp.permanent_light()
		get_parent().get_node("Monsters").destroy_all_monsters()

func close_lamp():
	lamps_lit -= 1
