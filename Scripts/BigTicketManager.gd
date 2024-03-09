extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func TicketWrong():
	print("bad ticket")
	
func TicketCorrect():
	print("good ticket")
	
func makeVisible():
	visible = true
	
func makeInvisible():
	visible = false
