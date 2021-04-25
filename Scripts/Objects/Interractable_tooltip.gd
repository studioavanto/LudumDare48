extends Area2D

	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for area in $Area2D.get_overlapping_areas():
		if(area.collision_mask == 1):
			pass

#	pass
