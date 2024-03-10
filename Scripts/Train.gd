extends Node2D

@onready var thing_placer = $Carriages
@export var carriage_number = 10
signal placed_carriages(y_pos)
var last_carriage = null
var carriages: Array[PhysicsBody2D]

# Called when the node enters the scene tree for the first time.
func _ready():
	place_carriages()
	carriages[0].embiggen()
	for i in range(carriage_number - 1):
		carriages[i].MakeFire()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func place_carriages():
	var carriage_position = global_position
	for i in range(carriage_number):
		var carriage = thing_placer.place_thing_next_to()
		if carriage.has_method("setup"):
			carriage.setup()
		carriages.append(carriage)
	placed_carriages.emit(carriages[0].show_size().y / 2)
