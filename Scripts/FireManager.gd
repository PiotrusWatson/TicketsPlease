extends Node2D

@export var fireScene: PackedScene
@onready var carriage = $"../Image"
@export var minFires = 3
var randomFires = 5
@export var maxFires = 8

var carriageWidth = 300
var fireLocations = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func FirePlacer():
	carriageWidth = int(carriage.show_size().x)
	randomFires = randi() % maxFires
	print("I will make [" + str(randomFires + 1) + "] fires :)")
	while fireLocations.size() <= minFires || fireLocations.size() <= randomFires:
		fireLocations.append(randi() % carriageWidth)
		print(fireLocations)
	pass
