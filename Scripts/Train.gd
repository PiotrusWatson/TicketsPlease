extends Node2D

@export var carriage_prefab: PackedScene
@export var carriage_number = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	place_carriages()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func place_carriages():
	var carriage_position = global_position
	for i in range(carriage_number):
		var carriage = carriage_prefab.instantiate()
		add_child(carriage)
		carriage.global_position = carriage_position
		carriage_position.x += carriage.show_size().x
		if carriage.has_method("setup"):
			carriage.setup()
