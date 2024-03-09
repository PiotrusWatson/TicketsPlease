extends Node2D

@onready var ticketCounter = $TicketCounter
@onready var ui = $PlayerCamera/CanvasLayer/Interface

@export var ticketsChecked = 0
@export var ticketsToCheck = 5
var passengers : Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready():
	passengers = get_tree().get_nodes_in_group("passenger")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func ScoreUpdate():
	ticketsChecked += 1
	ticketCounter.text = str(ticketsChecked) + "/" + str(ticketsToCheck)
	if ticketsChecked >= (passengers.size() * 0.75):
		# do the win thing
		pass
