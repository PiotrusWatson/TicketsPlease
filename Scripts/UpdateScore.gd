extends Label

@export var Score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func ScoreUpdate():
	Score =+ 1
	text = str(Score)
