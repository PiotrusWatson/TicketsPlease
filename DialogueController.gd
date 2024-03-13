extends Node

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
func _ready():
	from_dialogues = [accuse_from_dialogue, correct_eviction_dialogue, wrong_from_dialogue]
	to_dialogues = [accuse_to_dialogue, correct_eviction_dialogue, wrong_to_dialogue]
	date_dialogues = [accuse_date_dialogue, correct_eviction_dialogue, wrong_date_dialogue]
	all_good_dialogues = [all_good_dialogue, right_all_good_dialogue, wrong_all_good_dialogue]

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
