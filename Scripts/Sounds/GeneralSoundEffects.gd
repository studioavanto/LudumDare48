extends AudioStreamPlayer

var sound_effects = {
	"door_open": preload("res://Resources/Sounds/FX kansio/OVIAUKI.wav"),
	"door_close": preload("res://Resources/Sounds/FX kansio/OVIKIINNI.wav"),
	"lamp_on": preload("res://Resources/Sounds/FX kansio/LAMPPUKLIK päälle.wav"),
	"lamp_oil": preload("res://Resources/Sounds/FX kansio/LAMPPUÖLJY KLUKKLUK.wav")
}

func play_sound(sound_id):
	stop()
	stream = sound_effects[sound_id]
	play()
