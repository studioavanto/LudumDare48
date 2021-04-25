extends Node

# Declare member variables here. Examples:
var lamp_oil = 1.0
export var lamp_oil_consume_rate = 0.02 #100 seconds
var lamp_is_on = true
export var intense_burn_cost = 0.50
export var fill_amount = 0.25
var alive = true

func fill_lamp():
	lamp_oil += fill_amount
	if(lamp_oil>1.0):
		lamp_oil = 1.0

func intense_burn():
	if(lamp_oil > intense_burn_cost):
		lamp_oil -= intense_burn_cost
	else:
		lamp_oil = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
	alive = true
	lamp_oil = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(lamp_is_on and lamp_oil > 0.0):
		lamp_oil -= lamp_oil_consume_rate*delta
	if(lamp_is_on and lamp_oil <= 0.0):
		lamp_oil = 0.0
		turn_lamp_off()
		get_parent().get_node("Sprite/LightSource").toggle_light()
	if(lamp_oil<=0.0 and alive):
		alive = false
		get_parent().get_parent().get_parent().get_parent().death_is_now()
