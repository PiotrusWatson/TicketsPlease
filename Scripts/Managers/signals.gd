extends Node2D

@onready var ui = $PlayerCamera/CanvasLayer/Interface
@onready var god = $God
@onready var clock = $Clock
@onready var background = $ParallaxBackground
var passengers : Array[Node]
# Called when the node enters the scene tree for the first time.
func _ready():
	passengers = get_tree().get_nodes_in_group("passenger")
	for passenger in passengers:
		passenger.checking_ticket.connect(ui.show_ticket)
		passenger.walked_away.connect(ui.hide_ticket)
	
	god.map_built.connect(ui.take_map)
	god.todays_date.connect(ui.take_date)
	god.last_stop_chosen.connect(ui.take_last_stop)
	god.correct_details_created.connect(ui.store_correct_details)
	god.amount_checked.connect(ui.check)
	god.it_begins.connect(background.show_gojira)
	god.number_to_check_generated.connect(ui.update_max_tickets)
	ui.guess.connect(god.correct_check)
	ui.inspecting_passenger.connect(god.set_current_passenger)
	
	clock.tick.connect(ui.show_time)
	clock.timeout.connect(ui.times_up)
	clock.timeout.connect(god.handle_timeout)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
