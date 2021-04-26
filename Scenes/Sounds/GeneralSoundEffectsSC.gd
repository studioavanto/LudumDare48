extends AudioStreamPlayer

var sound_effects = {
	"change_map": preload("res://Resources/Sounds/FX kansio/kentan_vaihto_impact.wav"),
	"death_sound": preload("res://Resources/Sounds/FX kansio/dark_souls_bossi_kuoli_aani.wav"),
	"intense_burn": preload("res://Resources/Sounds/FX kansio/lyhty_intensifies.wav")
}

func play_sound(sound_id, vol = 0.0):
	stop()
	stream = sound_effects[sound_id]
	volume_db = vol
	play()
