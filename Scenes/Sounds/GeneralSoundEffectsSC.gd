extends AudioStreamPlayer

var sound_effects = {
	"change_map": preload("res://Resources/Sounds/FX kansio/kentan_vaihto_impact.wav"),
	"death_sound": preload("res://Resources/Sounds/FX kansio/dark_souls_bossi_kuoli_aani.wav")
}

func play_sound(sound_id):
	stop()
	stream = sound_effects[sound_id]
	play()
