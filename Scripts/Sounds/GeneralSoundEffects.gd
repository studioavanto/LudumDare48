extends AudioStreamPlayer

var sound_effects = {
	"door_open": preload("res://Resources/Sounds/FX kansio/OVIAUKI.wav"),
	"door_close": preload("res://Resources/Sounds/FX kansio/OVIKIINNI.wav"),
	"change_map": preload("res://Resources/Sounds/FX kansio/kentan_vaihto_impact.wav"),
	"gasp": preload("res://Resources/Sounds/FX kansio/gasp1.wav"),
	"death_sound": preload("res://Resources/Sounds/FX kansio/dark_souls_bossi_kuoli_aani.wav")
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_sound(sound_id):
	stream = sound_effects[sound_id]
	play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
