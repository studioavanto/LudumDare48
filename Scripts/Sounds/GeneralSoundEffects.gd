extends AudioStreamPlayer

var sound_effects = {
	"door_open": preload("res://Resources/Sounds/FX kansio/OVIAUKI.wav"),
	"door_close": preload("res://Resources/Sounds/FX kansio/OVIKIINNI.wav"),
	"lamp_on": preload("res://Resources/Sounds/FX kansio/LAMPPUKLIK päälle.wav"),
	"lamp_oil": preload("res://Resources/Sounds/FX kansio/LAMPPUÖLJY KLUKKLUK.wav"),
	"gasp": preload("res://Resources/Sounds/FX kansio/heratys_gasp.wav")
}

func play_sound(sound_id, vol = 0.0):
	stop()
	stream = sound_effects[sound_id]
	play()
