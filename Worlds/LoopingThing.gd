extends Node2D

@onready var thing_placer = $ThingPlacer
@export var amount_to_place = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(amount_to_place):
		thing_placer.place_thing_next_to()

func setup_thing_placer(y_pos):
	thing_placer.starting_location = Vector2(0, y_pos)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
