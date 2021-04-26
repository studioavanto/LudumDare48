extends Control

export var fade_timing = 0.5

func fade_in():
	$Tween.interpolate_property(
		$TextureRect2,
		"modulate",
		Color(1.0, 1.0, 1.0, 0.0),
		Color(1.0, 1.0, 1.0, 1.0),
		fade_timing,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)

	$Tween.interpolate_property(
		$TextureRect,
		"modulate",
		Color(1.0, 1.0, 1.0, 0.0),
		Color(1.0, 1.0, 1.0, 1.0),
		fade_timing,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	
	$Tween.start()
	
func fade_out():
	$Tween.interpolate_property(
		$TextureRect2,
		"modulate",
		Color(1.0, 1.0, 1.0, 1.0),
		Color(1.0, 1.0, 1.0, 0.0),
		fade_timing,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	$Tween.interpolate_property(
		$TextureRect,
		"modulate",
		Color(1.0, 1.0, 1.0, 1.0),
		Color(1.0, 1.0, 1.0, 0.0),
		fade_timing,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	
	$Tween.start()
	
