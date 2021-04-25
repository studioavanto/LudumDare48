extends TextureRect

var wait_time = 2.0
var fade_timing = 1.0
var cur_stage = 0

var death_scene = preload("res://Resources/Images/test.png")
var switch_scene = [
	null,
	preload("res://Resources/Images/test.png")
]

func _ready():
	$Tween.connect("tween_all_completed", self, "next_stage")
	$Timer.connect("timeout", self, "next_stage")
	$Timer.wait_time = wait_time

func next_stage():
	if cur_stage == 0:
		$Timer.start()
		get_parent().get_parent().destroy_current_map()
		cur_stage += 1
	elif cur_stage == 1:
		fade_out_scene()
		cur_stage += 1
	else:
		cur_stage = 0

func fade_to_scene(next_scene):
	if next_scene == 69:
		texture = death_scene
	else:
		texture = switch_scene[next_scene]

	$Tween.interpolate_property(
		self,
		"modulate",
		Color(1.0, 1.0, 1.0, 0.0),
		Color(1.0, 1.0, 1.0, 1.0),
		fade_timing,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	if next_scene == 69:
		pass
		
	$Tween.start()
	
func fade_out_scene():
	$Tween.interpolate_property(
		self,
		"modulate",
		Color(1.0, 1.0, 1.0, 1.0),
		Color(1.0, 1.0, 1.0, 0.0),
		fade_timing,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
		
	$Tween.start()