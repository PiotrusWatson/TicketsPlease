extends Node2D

@onready var placer = $Rail/ThingPlacer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_train_placed_carriages(y_pos):
	placer.starting_location.y = y_pos
	pass # Replace with function body.
