extends Node2D

var light_on = true
var intense_light = false

func toggle_light():
	light_on = !light_on
	$Light2D.enabled = light_on
	if light_on:
		$LightHitBox.collision_mask = 1
	else:
		$LightHitBox.collision_mask = 8

func toggle_intense_light():
	if(!intense_light and light_on):
		$LightHitBox.collision_mask = 32
		intense_light = true
	else:
		intense_light = false
		if(light_on):
			$LightHitBox.collision_mask = 1
		else:
			$LightHitBox.collision_mask = 8
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
