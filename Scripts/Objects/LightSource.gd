extends Node2D

var light_on = true
var intense_light = false
var end_tween_cycle = false

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
		end_tween_cycle = false
		$Tween.interpolate_property($Light2D,"energy",1.0, 2.0, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
	else:
		intense_light = false
		if(light_on):
			$LightHitBox.collision_mask = 1
		else:
			$LightHitBox.collision_mask = 8

func intense_burn_animation():
	if(!end_tween_cycle):
		$Tween.interpolate_property($Light2D,"energy",2.0, 1.0, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		end_tween_cycle = true

func _ready():
	$Tween.connect("tween_all_completed", self, "intense_burn_animation")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
