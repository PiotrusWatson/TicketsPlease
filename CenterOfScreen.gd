extends Node2D

@onready var windowSize = DisplayServer.window_get_size()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func WindowSizeChanges():
	position.x = windowSize.x / 2
	position.y = windowSize.y / 2
