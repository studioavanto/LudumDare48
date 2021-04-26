extends AnimatedSprite

var has_played = false

func _ready():
	pass # Replace with function body.

func _process(_delta):
	if (frame == 2 or frame == 6) and !has_played:
		get_parent().get_parent().get_parent().get_node("PlayerSounds").play_step()
		has_played = true
	
	if (frame == 3 or frame == 7) and has_played:
		has_played = false
