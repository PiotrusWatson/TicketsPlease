extends ParallaxBackground

@onready var back = $Back
@onready var mid = $Mid
@onready var fore = $Fore
@onready var rail = $Rail
@onready var railChild = $Rail/Rail
@onready var gojira = $TheParallaxBoy

var railZoop = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if railZoop:
		railChild.position.y += 5

	if railChild.position.y >= 2000:
		rail.visible = false
		railZoop = false
	pass


func show_gojira():
	gojira.visible = true
	Halt()
	
func Halt():
	back.amount_to_move = 0
	mid.amount_to_move = 0
	fore.amount_to_move = 0
	rail.amount_to_move = 0
	rail.visible = false
