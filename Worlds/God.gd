#be not afraid 👁
extends Node

@export var map_size = 7
@export var percent_incorrect = 0.5

var chaosElements = []
@onready var theBoy = $"../ParallaxBackground/TheParallaxBoy"
@onready var train = $"../Train"
@onready var background = $"../ParallaxBackground"

var place_range_builder: Globals.PlaceRangeBuilder
var incorrect_ticket_builder: Globals.IncorrectTicketBuilder
var correct_detail_holder: Globals.CorrectDetails
var passengers
signal map_built(map)
signal todays_date(date)
signal last_stop_chosen(stop)
signal correct_details_created(details)

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
	get_tree().create_timer(1).timeout.connect(tell_us_were_finished)
	passengers = get_tree().get_nodes_in_group("passenger")
	give_tickets_to_passengers()

func tell_us_were_finished():
	map_built.emit(correct_detail_holder.map)
	todays_date.emit(correct_detail_holder.date)
	last_stop_chosen.emit(correct_detail_holder.current_stop)
	correct_details_created.emit(correct_detail_holder)
	
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

func TheBoyAppears():
	background.Halt()
	theBoy.visible = true
	for i in range(train.carriages.size()):
		train.carriages[i].ShowHand()
		train.carriages[i].ShowFire()
	pass


func _on_timer_times_up():
	TheBoyAppears()
	pass # Replace with function body.
