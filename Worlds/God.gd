extends Node

@export var map_size = 7
@export var percent_incorrect = 0.5

var place_range_builder: Globals.PlaceRangeBuilder
var incorrect_ticket_builder: Globals.IncorrectTicketBuilder
var correct_detail_holder: Globals.CorrectDetails
var passengers

# Called when the node enters the scene tree for the first time.
func _ready():
	var date_builder = Globals.DateBuilder.new()
	var correct_date = date_builder.GenerateDate()
	var possible_places = Globals.make_possible_places()
	var map_builder = Globals.MapBuilder.new(possible_places)
	var map = map_builder.build_map(7)
	var current_stop = Globals.make_current_stop(map)
	place_range_builder = Globals.PlaceRangeBuilder.new(map, current_stop, possible_places)
	incorrect_ticket_builder = Globals.IncorrectTicketBuilder.new(correct_date, place_range_builder)
	correct_detail_holder = Globals.CorrectDetails.new(correct_date, map, current_stop, place_range_builder)
	
	passengers = get_tree().get_nodes_in_group("passenger")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func give_tickets_to_passengers():
	for passenger in passengers:
		var dice_roll = randf()
		if dice_roll >= percent_incorrect:
			passenger.give_ticket(incorrect_ticket_builder.generate_incorrect_ticket())
		else:
			passenger.give_ticket(correct_detail_holder.GenerateCorrectTicket())
