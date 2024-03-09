extends Node

@export var thing_to_place : PackedScene
@export var starting_location: Vector2
var thing_position = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	thing_position = starting_location

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func place_thing_next_to():
	var thing = thing_to_place.instantiate()
	add_child(thing)
	thing.global_position = thing_position
	thing_position.x += thing.show_size().x
	return thing
