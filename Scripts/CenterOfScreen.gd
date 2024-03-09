extends Node2D

@onready var windowSize = DisplayServer.window_get_size()
@onready var big_ticket = $BigTicketPath
# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = windowSize.x / 2
	position.y = windowSize.y / 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func WindowSizeChanges():
	position.x = windowSize.x / 2
	position.y = windowSize.y / 2
func show_ticket(ticket: Globals.Ticket):
	big_ticket.ShowTicket(ticket)

func hide_ticket():
	big_ticket.HideTicket()
