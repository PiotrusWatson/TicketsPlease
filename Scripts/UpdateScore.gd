extends Label

@onready var ticketCounter = $TicketCounter

@export var ticketsChecked = 0
@export var ticketsToCheck = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func ScoreUpdate():
	ticketsChecked += 1
	ticketCounter.text = str(ticketsChecked) + "/" + str(ticketsToCheck)
