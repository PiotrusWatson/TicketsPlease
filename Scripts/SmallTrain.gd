extends Node2D

@onready var path = $TrainSpritePath
@onready var pathFollow = $TrainSpritePath/PathFollow2D
@onready var train_sprite = $TrainSpritePath/PathFollow2D/SmallTrain
var timer: Timer
@export var secondsUntilEnd = 0
@onready var origin_label = $Origin
@onready var destination_label = $Destination

var traverseTime = 5 # Time it takes to traverse the path - Link to timer
var t = 0 # Active time along the path
var pathLength = 0 # Length of the path

func setup(_timer: Timer):
	timer = _timer
	traverseTime = GetTime()
# Called when the node enters the scene tree for the first time.
func _ready():	
	train_sprite.play("default")
	pathLength = path.get_curve().get_baked_length()
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (t > traverseTime):
		t = 0
	t += delta
	pathFollow.progress += t
	pass

func GetTime():
	secondsUntilEnd = timer.time_left
	return secondsUntilEnd
