extends ParallaxBackground

@export var amount_to_move = 100
@onready var camera = $".."
var startingPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	startingPosition = transform
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset.x -= amount_to_move * delta
