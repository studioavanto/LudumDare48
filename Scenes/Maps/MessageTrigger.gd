extends Area2D

func _on_MessageTrigger_area_entered(area):
	if area.collision_mask == 17:
		$Message.fade_to_view()
