extends Node2D

@onready var ui = $PlayerCamera/CanvasLayer/Interface
@onready var god = $God
var passengers : Array[Node]
# Called when the node enters the scene tree for the first time.
func _ready():
	passengers = get_tree().get_nodes_in_group("passenger")
	for passenger in passengers:
		passenger.checking_ticket.connect(ui.show_ticket)
		passenger.walked_away.connect(ui.hide_ticket)
	god.map_built.connect(ui.take_map)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
