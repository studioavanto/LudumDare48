extends Area2D

func _on_Lampoilbody_body_entered(body):
	if(body.name == "PlayerBody"):
		get_tree().root.get_node("Game/GeneralSoundEffects").play_sound("lamp_oil")
		queue_free()
		body.ask_fill_lamp()
