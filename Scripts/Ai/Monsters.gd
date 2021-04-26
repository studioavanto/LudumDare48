extends Node

func destroy_all_monsters():
	for monster in get_children():
		monster.destroy_monster()

func pause_monsters(val):
	for monster in get_children():
		monster.pause_monster(val)

