extends AnimatedSprite2D

@onready var path = $"../.."
@onready var pathFollow = $".."
@onready var timer = $"../../../../../Interface/Timer/Timer"
@export var secondsUntilEnd = 0

var traverseTime = 5 # Time it takes to traverse the path - Link to timer
var t = 0 # Active time along the path
var pathLength = 0 # Length of the path

# Called when the node enters the scene tree for the first time.
func _ready():	
	play("default")
	pathLength = path.get_curve().get_baked_length()
	
	traverseTime = GetTime()
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
