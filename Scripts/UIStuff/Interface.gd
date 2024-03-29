extends Node2D

@onready var windowSize = DisplayServer.window_get_size()
@onready var big_ticket = $BigTicket
@onready var small_train = $TrainTravel
@onready var timer = $Timer
@onready var date_display = $DateDisplay
@onready var last_stop_display = $PlaceholderLastStop
@onready var ticket_checker = $TicketCheck
signal inspecting_passenger(passenger: Passenger)
signal guess(content, is_correct)
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
func show_ticket(ticket: Ticket, passenger: Passenger):
	big_ticket.ShowTicket(ticket, passenger)

func hide_ticket():
	big_ticket.HideTicket()

func take_map(map):
	small_train.setup_destinations(map)
	
func take_date(date):
	date_display.change_date(date)
	
func take_last_stop(last_stop):
	last_stop_display.text = "Previous Stop: " + last_stop.name

func store_correct_details(details):
	big_ticket.store_correct_details(details)
	
func check(amount):
	$TicketCheck.ScoreUpdate()


func _on_big_ticket_inspecting_passenger(passenger):
	inspecting_passenger.emit(passenger)


func _on_big_ticket_guess(content, is_correct):
	guess.emit(content, is_correct)
	hide_ticket()

func show_time(time_left):
	timer.show_time(time_left)
	small_train.get_time(time_left)
	
func times_up():
	timer.times_up()

func update_max_tickets(number_to_check):
	ticket_checker.update_max_tickets(number_to_check)
