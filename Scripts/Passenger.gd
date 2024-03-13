extends StaticBody2D
class_name Passenger

signal checking_ticket(ticket, passenger)
signal walked_away
var ticket_checked = false
var ticket: Ticket
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func give_ticket(_ticket: Ticket):
	ticket = _ticket

func _on_detect_object_body_entered(body):
	if body.has_method("interact") and !ticket_checked:
		checking_ticket.emit(ticket, self)
		DialogueManager.show_dialogue_balloon(load("res://Dialogue/tickets_please.dialogue"), "", [{"time": Globals.time_to_read}])


func handle_guess(type_of_guess: Globals.Guess, is_correct):
	ticket_checked = true
	if type_of_guess != Globals.Guess.ALL_CORRECT:
		evict()

func evict():
	print("whee")
func _on_detect_object_body_exited(body):
	if body.has_method("interact") and !ticket_checked:
		walked_away.emit()
