extends Path2D

@export var originPosition: Vector2
@export var destinationPosition: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	originPosition = $"../Origin".position
	destinationPosition = $"../Destination".position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
