extends Node

onready var songs = [
	preload("res://Resources/Sounds/Music/OST_in.ogg"),
	preload("res://Resources/Sounds/Music/OST_0.ogg"),
	preload("res://Resources/Sounds/Music/OST_1.ogg"),
	preload("res://Resources/Sounds/Music/OST_2.ogg"),
	preload("res://Resources/Sounds/Music/OST_3.ogg"),
	preload("res://Resources/Sounds/Music/OST_4.ogg"),
	preload("res://Resources/Sounds/Music/OST_out.ogg")
]

var active_song = -1
var next_song = -1
var active_channel = 1

var wait_to_next = false

var bpm: int = 80
var bar = 1

func _ready():
	$Song1.volume_db = 0.0
	$Song2.volume_db = -80.0
	$Metronome.connect("timeout", self, "one_bar")
	$EndMusic.connect("timeout", self, "fade_out_active")
	$Timer.connect("timeout", self, "start_song")
	$Timer.start(0.2)
	$Song1.stream = songs[0]

func start_song():
	$Song1.play()
	$Metronome.start(4 * 4 * 60.0 / bpm)
	
func change_song(new_song):
	if new_song == active_song:
		return
	next_song = new_song
	start_transition_next_song()

func start_transition_next_song():
	if active_channel == 1:
		$Song2.set_stream(songs[next_song])
	else:
		$Song1.set_stream(songs[next_song])
	
	if ($Metronome.time_left < $Song1.fade_timing):
		wait_to_next = true
		$EndMusic.start($Metronome.wait_time + $Metronome.time_left -  $Song1.fade_timing)
	else:
		$EndMusic.start($Metronome.time_left - $Song1.fade_timing)

func one_bar():
	if next_song == -1:
		return
	elif wait_to_next:
		wait_to_next = false
	else:
		change_music()

func change_music():
	print("change_music")
	if active_channel == 1:
		$Song2.volume_db = 0.0
		$Song2.play()
		active_channel = 2
	else:
		$Song1.volume_db = 0.0
		$Song1.play()
		active_channel = 1
	active_song = next_song
	next_song = -1

func fade_out_active():
	if active_channel == 2:
		$Song2.fade_out()
	else:
		$Song1.fade_out()
