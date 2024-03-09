extends StaticBody2D

signal checking_ticket
signal walked_away
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_detect_object_body_entered(body):
	if body.has_method("interact"):
		checking_ticket.emit()



func _on_detect_object_body_exited(body):
	if body.has_method("interact"):
		walked_away.emit()
