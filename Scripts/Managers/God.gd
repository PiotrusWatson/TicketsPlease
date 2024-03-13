#be not afraid 👁
extends Node

@export var map_size = 7
@export var percent_incorrect = 0.

signal amount_checked(checked)
var max_to_check: int
var checked = 0
var chaosElements = []
var current_passenger: Passenger
var gojira_has_appeared = false
@onready var train = $"../Train"
@onready var dialogue_controller = $DialogueController

var place_range_builder: PlaceRangeBuilder
var correct_detail_holder: CorrectDetails
var passengers
var map
signal it_begins
signal map_built(map)
signal todays_date(date)
signal last_stop_chosen(stop)
signal correct_details_created(details)

# Called when the node enters the scene tree for the first time.
func _ready():
	var correct_date = Date.generate_date()
	var possible_places = BuilderHelpers.make_possible_places(Globals.names)
	map = BuilderHelpers.build_map(possible_places, 7)
	var current_stop = BuilderHelpers.make_current_stop(map)
	place_range_builder = PlaceRangeBuilder.new(map, current_stop, possible_places)
	correct_detail_holder = CorrectDetails.new(correct_date, current_stop)
	get_tree().create_timer(1).timeout.connect(tell_us_were_finished)
	passengers = get_tree().get_nodes_in_group("passenger")
	max_to_check = passengers.size() / 2
	give_tickets_to_passengers()
	
	
func tell_us_were_finished():
	map_built.emit(map)
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
			passenger.give_ticket(Ticket.generate_bad_ticket(correct_detail_holder.date, place_range_builder))
		else:
			passenger.give_ticket(Ticket.generate_correct_ticket(correct_detail_holder.date, place_range_builder))

func handle_timeout():
	if !gojira_has_appeared:
		the_boy_appears()
	else:
		pass
func the_boy_appears():
	it_begins.emit()
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/oh_shit_its_godzilla.dialogue"))
	for i in range(train.carriages.size()):
		train.carriages[i].ShowHand()
		train.carriages[i].ShowFire()

func correct_check(guess_type: Globals.Guess, is_correct):
	dialogue_controller.play_guess_dialogue(guess_type, is_correct)
	current_passenger.handle_guess(guess_type, is_correct)
	if is_correct:
		checked += 1
		amount_checked.emit(checked)
	if checked >= max_to_check:
		get_tree().change_scene_to_file("res://Worlds/win.tscn")
		
func set_current_passenger(passenger: Passenger):
	current_passenger = passenger
