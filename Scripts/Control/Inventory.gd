extends Node

# Declare member variables here. Examples:
var lamp_oil = 1.0
export var lamp_oil_consume_rate = 0.02
var lamp_is_on = true
export var intense_burn_cost = 0.20
export var fill_amount = 0.50

func fill_lamp():
	lamp_oil += fill_amount
	if(lamp_oil>1.0):
		lamp_oil = 1.0

func intense_burn():
	if(lamp_oil > intense_burn_cost and lamp_is_on):
		lamp_oil -= intense_burn_cost
	elif(lamp_is_on):
		lamp_oil = 0.0
	
	get_tree().root.get_node("Game/GeneralSoundEffectsSC").play_sound("intense_burn", 3.0)
	
func toggle_lamp():
	if(lamp_is_on):
		turn_lamp_off()
	else:
		turn_lamp_on()

func turn_lamp_on():
	lamp_is_on = true
func turn_lamp_off():
	lamp_is_on = false

func reset_inventory():
	lamp_oil = 1.0
	lamp_is_on = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().get_parent().get_parent().get_pause_state():
		return

	if(lamp_is_on and lamp_oil > 0.0):
		lamp_oil -= lamp_oil_consume_rate*delta
	if(lamp_is_on and lamp_oil <= 0.0):
		lamp_oil = 0.0
		turn_lamp_off()
		get_parent().get_node("Sprite/LightSource").toggle_light()
	if(lamp_oil<=0.0):
		get_parent().get_parent().get_parent().die()
