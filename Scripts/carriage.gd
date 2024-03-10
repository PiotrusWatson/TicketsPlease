extends CharacterBody2D

@onready var image = $Image
@onready var spawner = $RandomSpawner
@onready var connector = $Connector
@onready var left_wall = $LeftBuffer
@onready var fireManager = $FireManager
# Called when the node enters the scene tree for the first time.

func setup():
	spawner.spawn_all()
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func show_size():
	return image.calculate_size()
	
func lift_carriage():
	pass

func embiggen():
	pass

func MakeFire():
	fireManager.FirePlacer()

