extends Node

func destroy_all_monsters():
	for monster in get_children():
		monster.destroy_monster()
