extends Node2D

var light_on = true
var intense_light = false
var end_tween_cycle = false
onready var noise = OpenSimplexNoise.new()
var value = 0.0
const MAX_VALUE = 100000000
onready var default_position = position

func turn_on_light():
	if(!light_on):
		toggle_light()

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
		$Tween.interpolate_property($Light2D,"texture_scale",4.0, 6.0, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
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
		$Tween.interpolate_property($Light2D,"texture_scale",6.0, 4.0, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.interpolate_property($Light2D,"energy",2.0, 1.0, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		end_tween_cycle = true

func _ready():
	$Tween.connect("tween_all_completed", self, "intense_burn_animation")
	randomize()
	value = randi()%MAX_VALUE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value += 0.5
	if(value > MAX_VALUE):
		value = 0.0
	var alpha = ((noise.get_noise_1d(value) +1) /4.0) + 0.5
	$Light2D.color = Color($Light2D.color.r, $Light2D.color.g, $Light2D.color.b, alpha)
	position = default_position + Vector2(cos(OS.get_ticks_msec()/1000.0),alpha)*sin(OS.get_ticks_msec()/200.0)

pass
