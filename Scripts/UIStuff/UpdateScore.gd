extends Node2D

@onready var ticketCounter = $TicketCounter
@onready var ui = $PlayerCamera/CanvasLayer/Interface

@export var ticketsChecked = 0
@export var ticketsToCheck = 5
var passengers : Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	passengers = get_tree().get_nodes_in_group("passenger")
	ticketCounter.text = str(0) + "/" + str(passengers.size() / 2)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func ScoreUpdate():
	ticketsChecked += 1
	ticketCounter.text = str(ticketsChecked) + "/" + str(ticketsToCheck)
