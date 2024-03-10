extends Node2D

@onready var windowSize = DisplayServer.window_get_size()
@onready var big_ticket = $BigTicketPath
@onready var small_train = $TrainTravel
@onready var timer = $Timer/Timer
@onready var date_display = $DateDisplay
# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = windowSize.x / 2
	position.y = windowSize.y / 2
	small_train.setup(timer)
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

func take_map(map):
	small_train.setup_destinations(map)
	
func take_date(date):
	date_display.change_date(date)
