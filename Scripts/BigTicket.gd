extends Node2D

@onready var path = $"../.."
@onready var pathFollow = $".."

var showTicket = false

var traverseTime = 5 # Time it takes to traverse the path
var t = 0 # Active time along the path
var pathLength = 0 # Length of the path

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pathLength = path.get_curve().get_baked_length()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if showTicket:
		if (t > traverseTime):
			t = 0
		t += delta
		pathFollow.progress += t
	pass

func ShowTicket(): 
	visible = true
	
func HideTicket(): 
	visible = false
