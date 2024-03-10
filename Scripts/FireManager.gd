extends Node2D

@export var fireScene: PackedScene
@onready var carriage = $"../Image"
@export var minFires = 3
var randomFires = 5
@export var maxFires = 40

var carriageWidth = 300
var carriageHeight = 20
var fireLocations: Array[Vector2]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func FirePlacer():
	carriageWidth = int(carriage.show_size().x)
	randomFires = randi() % maxFires
	print("I will make [" + str(randomFires + 1) + "] fires...maybe :)")
	while fireLocations.size() <= minFires -1 || fireLocations.size() <= randomFires:
		fireLocations.append(Vector2(randi() % carriageWidth, carriageHeight))
		
	for i in range(fireLocations.size()):
		var fireToSpawn = fireScene.instantiate()
		add_child(fireToSpawn)
		fireToSpawn.position = fireLocations[i]
	pass
