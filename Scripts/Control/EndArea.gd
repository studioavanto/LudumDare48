extends Sprite

func interact_object():
	get_parent().get_parent().end_scene_if_possible()
