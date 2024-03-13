extends Node2D

@onready var ticketCounter = $TicketCounter

var ticketsChecked = 0
var ticketsToCheck = 5
var passengers : Array[Node]

# Called when the node enters the scene tree for the first time.
func update_max_tickets(tickets_to_check):
	ticketsToCheck = tickets_to_check

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func ScoreUpdate():
	ticketsChecked += 1
	ticketCounter.text = str(ticketsChecked) + "/" + str(ticketsToCheck)
