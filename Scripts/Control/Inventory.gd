extends Node

# Declare member variables here. Examples:
var lamp_oil = 1.0
export var lamp_oil_consume_rate = 0.01 #100 seconds
var lamp_is_on = true
export var fill_amount = 0.25

func fill_lamp():
	lamp_oil += fill_amount
	if(lamp_oil>1.0):
		lamp_oil = 1.0

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(lamp_oil)
	if(lamp_is_on):
		lamp_oil -= lamp_oil_consume_rate*delta
