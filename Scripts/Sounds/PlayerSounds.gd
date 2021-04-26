extends AudioStreamPlayer


var steps = [
	preload("res://Resources/Sounds/FX kansio/askeleet/Askel 1.wav"),
	preload("res://Resources/Sounds/FX kansio/askeleet/Askel 2.wav"),
	preload("res://Resources/Sounds/FX kansio/askeleet/Askel 3.wav"),
	preload("res://Resources/Sounds/FX kansio/askeleet/Askel 4.wav"),
	preload("res://Resources/Sounds/FX kansio/askeleet/Askel 5.wav"),
	preload("res://Resources/Sounds/FX kansio/askeleet/Askel 6.wav")
]

var walk_cycle = 0

func _ready():
	pass # Replace with function body.

func play_step():
	stream = steps[walk_cycle]
	play()
	walk_cycle = (walk_cycle + 1) % 6
