extends Node2D

@onready var ui = $PlayerCamera/CanvasLayer/TicketCheckingPLaceholder
var passengers : Array[Node]
# Called when the node enters the scene tree for the first time.
func _ready():
	passengers = get_tree().get_nodes_in_group("passenger")
	for passenger in passengers:
		passenger.checking_ticket.connect(ui.make_visible)
		passenger.walked_away.connect(ui.make_invisible)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
