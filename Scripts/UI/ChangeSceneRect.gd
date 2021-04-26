extends TextureRect

export var INTRO_TEXT_1 = "INTRO TEXT 1"
export var INTRO_TEXT_2 = "INTRO TEXT 2"

export var GAME_TEXT_1 = "GAME TEXT 1"
export var GAME_TEXT_2 = "GAME TEXT 2"
export var GAME_TEXT_3 = "GAME TEXT 3"
export var GAME_TEXT_4 = "GAME TEXT 4"

export var OUTRO_TEXT_1 = "OUTRO TEXT 1"

export var DEATH_TEXT = "DEATH TEXT"

var fade_timing = 0.2
var cur_state = 0

var current_active = "None"

var intro_scene = preload("res://Grafiikka/UI/titlescreen.png")
var wakeup_scene = preload("res://Grafiikka/UI/game_over.png")
var scene_background = preload("res://Grafiikka/UI/darkness_bg/tumma_tausta.jpeg")
var end_screen = preload("res://Grafiikka/UI/Credits.png")

func _ready():
	$FadeOutTween.connect("tween_all_completed", self, "fade_out_completed")
	$FadeInTween.connect("tween_all_completed", self, "fade_in_completed")

func fade_out_completed():
	get_parent().get_parent().move_to_next_stage()

func fade_in_completed():
	get_parent().get_parent().destroy_current_map()

func transition_to_stage(game_stage, stage_id = -1):
	match game_stage:
		"INTRO":
			match stage_id:
				1:
					fade_in_image("intro")
				2:
					fade_in_text(INTRO_TEXT_1)
				3:
					fade_in_image("wakeup")
					get_parent().get_parent().get_node("GeneralSoundEffects").play_sound("gasp")
				4:
					fade_in_text(INTRO_TEXT_2)
		"GAME":
			match stage_id:
				2:
					fade_in_text(GAME_TEXT_1)
				4:
					fade_in_text(GAME_TEXT_2)
				6:
					fade_in_text(GAME_TEXT_3)
				8:
					fade_in_text(GAME_TEXT_4)
		"OUTRO":
			match stage_id:
				1:
					fade_in_text(OUTRO_TEXT_1)
				2:
					fade_in_image("end_screen")
		"DEATH":
			fade_in_text(DEATH_TEXT)

func fade_in_text(text):
	current_active = "text"
	$SceneText.text = text
	
	$FadeInTween.interpolate_property(
		$SceneText,
		"modulate",
		Color(1.0, 1.0, 1.0, 0.0),
		Color(1.0, 1.0, 1.0, 1.0),
		fade_timing,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	
	$FadeInTween.start()
	
func fade_in_image(state):
	current_active = "image"
	
	if state == "intro":
		$ScreenTexture.texture = intro_scene
	elif state == "wakeup":
		$ScreenTexture.texture = wakeup_scene
	elif state == "end_screen":
		$ScreenTexture.texture = end_screen
		
	$FadeInTween.interpolate_property(
		$ScreenTexture,
		"modulate",
		Color(1.0, 1.0, 1.0, 0.0),
		Color(1.0, 1.0, 1.0, 1.0),
		fade_timing,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	
	$FadeInTween.start()

func fade_out_active():
	if current_active == "text":
		$FadeOutTween.interpolate_property(
			$SceneText,
			"modulate",
			Color(1.0, 1.0, 1.0, 1.0),
			Color(1.0, 1.0, 1.0, 0.0),
			fade_timing,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN
		)
		$FadeOutTween.start()
	elif current_active == "image":
		$FadeOutTween.interpolate_property(
			$ScreenTexture,
			"modulate",
			Color(1.0, 1.0, 1.0, 1.0),
			Color(1.0, 1.0, 1.0, 0.0),
			fade_timing,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN
		)
		$FadeOutTween.start()

func fade_in_background():
	$BackgroundTween.interpolate_property(
		self,
		"modulate",
		Color(1.0, 1.0, 1.0, 0.0),
		Color(1.0, 1.0, 1.0, 1.0),
		fade_timing,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	
	$BackgroundTween.start()
	
func fade_out_background():
	$BackgroundTween.interpolate_property(
		self,
		"modulate",
		Color(1.0, 1.0, 1.0, 1.0),
		Color(1.0, 1.0, 1.0, 0.0),
		fade_timing,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	
	$BackgroundTween.start()
	
