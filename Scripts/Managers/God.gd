#be not afraid 👁
extends Node

@export var map_size = 7
@export var percent_incorrect = 0.5

var accuse_from_dialogue = preload("res://Dialogue/accuse_from.dialogue")
var accuse_to_dialogue = preload("res://Dialogue/accuse_to.dialogue")
var accuse_date_dialogue = preload("res://Dialogue/accuse_date.dialogue")
var wrong_from_dialogue = preload("res://Dialogue/wrong_from.dialogue")
var wrong_to_dialogue = preload("res://Dialogue/wrong_to.dialogue")
var wrong_date_dialogue = preload("res://Dialogue/wrong_date.dialogue")
var all_good_dialogue = preload("res://Dialogue/all_good.dialogue")
var right_all_good_dialogue = preload("res://Dialogue/right_all_good.dialogue")
var wrong_all_good_dialogue = preload("res://Dialogue/wrong_all_good.dialogue")
var correct_eviction_dialogue = preload("res://Dialogue/right_date.dialogue")

var from_dialogues
var to_dialogues
var date_dialogues
var all_good_dialogues

signal amount_checked(checked)
var max_to_check: int
var checked = 0
var chaosElements = []
var current_passenger: Passenger
@onready var theBoy = $"../ParallaxBackground/TheParallaxBoy"
@onready var train = $"../Train"
@onready var background = $"../ParallaxBackground"

var place_range_builder: PlaceRangeBuilder
var correct_detail_holder: CorrectDetails
var passengers
var map
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
	
	from_dialogues = [accuse_from_dialogue, correct_eviction_dialogue, wrong_from_dialogue]
	to_dialogues = [accuse_to_dialogue, correct_eviction_dialogue, wrong_to_dialogue]
	date_dialogues = [accuse_date_dialogue, correct_eviction_dialogue, wrong_date_dialogue]
	all_good_dialogues = [all_good_dialogue, right_all_good_dialogue, wrong_all_good_dialogue]

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

func TheBoyAppears():
	background.Halt()
	theBoy.visible = true
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/oh_shit_its_godzilla.dialogue"))
	for i in range(train.carriages.size()):
		train.carriages[i].ShowHand()
		train.carriages[i].ShowFire()
	pass


func _on_timer_times_up():
	TheBoyAppears()
	pass # Replace with function body.


func play_dialogues_depending_on_correctness(dialogues, is_correct):
	DialogueManager.show_dialogue_balloon(dialogues[0])
	await DialogueManager.dialogue_ended
	if is_correct:
		DialogueManager.show_dialogue_balloon(dialogues[1])
	else:
		DialogueManager.show_dialogue_balloon(dialogues[2])

func play_guess_dialogue(guess_type: Globals.Guess, is_correct):
	if guess_type == Globals.Guess.BAD_ORIGIN:
		play_dialogues_depending_on_correctness(from_dialogues, is_correct)
	elif guess_type == Globals.Guess.BAD_DESTINATION:
		play_dialogues_depending_on_correctness(to_dialogues, is_correct)
	elif guess_type == Globals.Guess.BAD_DATE:
		play_dialogues_depending_on_correctness(date_dialogues, is_correct)
	else:
		play_dialogues_depending_on_correctness(all_good_dialogues, is_correct)
func correct_check(guess_type: Globals.Guess, is_correct):
	play_guess_dialogue(guess_type, is_correct)
	current_passenger.handle_guess(guess_type, is_correct)
	if is_correct:
		checked += 1
		amount_checked.emit(checked)
	if checked >= max_to_check:
		get_tree().change_scene_to_file("res://Worlds/win.tscn")
		
func set_current_passenger(passenger: Passenger):
	current_passenger = passenger
