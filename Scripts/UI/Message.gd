extends TextureRect
export var fade_timing = 2.0

func fade_to_view():
	$Tween.interpolate_property(
		self,
		"modulate",
		Color(1.0, 1.0, 1.0, 0.0),
		Color(1.0, 1.0, 1.0, 1.0),
		fade_timing,
		Tween.TRANS_LINEAR,
		Tween.TRANS_LINEAR
	)
	$Tween.start()
