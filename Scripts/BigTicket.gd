extends Path2D


@onready var pathFollow = $BigTicketPathFollow
@onready var origin = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureOrigin
@onready var destination = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureDestination2
@onready var ticket_feature_date = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureDate
@onready var origin_confirmaton = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureOrigin/ButtonDisplayer
@onready var destination_confirmation = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureDestination2/ButtonDisplayer
@onready var date_confirmation = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureDate/ButtonDisplayer
@onready var correct_confirmation = $Correct/ButtonDisplayer

var showTicket = false

var traverseTime = 5 # Time it takes to traverse the path
var t = 0 # Active time along the path
var pathLength = 0 # Length of the path

var current_ticket: Globals.Ticket
signal guess(content)

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pathLength = get_curve().get_baked_length()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if showTicket:
		if (t > traverseTime):
			t = 0
		t += delta
		pathFollow.progress += t + 15
	pass

func ShowTicket(ticket: Globals.Ticket): 
	ticket_feature_date.text = "Date of Travel:\n" + ticket.date._to_string()
	var place_range = ticket.from_and_to
	origin.text = "from " + place_range.from._to_string()
	destination.text = "to " + place_range.to._to_string()
	showTicket = true
	visible = true
	current_ticket = ticket
	
func HideTicket(): 
	showTicket = false
	pathFollow.progress = 0
	visible = false


func _on_ticket_feature_origin_pressed():
	origin_confirmaton.show_buttons()


func _on_ticket_feature_destination_2_pressed():
	destination_confirmation.show_buttons()


func _on_ticket_feature_date_pressed():
	date_confirmation.show_buttons()


func _on_correct_pressed():
	correct_confirmation.show_buttons()


func _on_origin_guess():
	guess.emit(Globals.Guess.BAD_ORIGIN)

func _on_destination_guess():
	guess.emit(Globals.Guess.BAD_DESTINATION)

func _on_date_guess():
	guess.emit(Globals.Guess.BAD_DATE)

func _on_correct_guess():
	guess.emit(Globals.Guess.ALL_CORRECT)
