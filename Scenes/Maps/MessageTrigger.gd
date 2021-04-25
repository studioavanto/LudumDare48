extends Area2D

export var message = ""

func _on_MessageTrigger_area_entered(area):
	if area.collision_mask == 17:
		$Message.fade_to_view()

func _on_MessageTrigger_area_exited(area):
	if area.collision_mask == 17:
		$Message.fade_out_of_view()
