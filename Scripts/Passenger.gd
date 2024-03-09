extends StaticBody2D

signal checking_ticket(ticket)
signal walked_away
var ticket: Globals.Ticket
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func give_ticket(_ticket: Globals.Ticket):
	ticket = _ticket
	
func _on_detect_object_body_entered(body):
	if body.has_method("interact"):
		checking_ticket.emit(ticket)



func _on_detect_object_body_exited(body):
	if body.has_method("interact"):
		walked_away.emit()
