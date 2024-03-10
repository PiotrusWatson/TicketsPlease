extends Path2D


@onready var pathFollow = $BigTicketPathFollow
@onready var origin = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureOrigin
@onready var destination = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureDestination2
@onready var ticket_feature_date = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureDate
@onready var origin_confirmaton = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureOrigin/Origin
@onready var destination_confirmation = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureDestination2/Destination
@onready var date_confirmation = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureDate/Date
@onready var correct_confirmation = $BigTicketPathFollow/BigTicket/BigTicketImage/Correct/Correct

var correct_details: Globals.CorrectDetails
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
	origin_confirmaton.hide_buttons()
	destination_confirmation.hide_buttons()
	date_confirmation.hide_buttons()
	correct_confirmation.hide_buttons()


func _on_ticket_feature_origin_pressed():
	origin_confirmaton.show_buttons()


func _on_ticket_feature_destination_2_pressed():
	destination_confirmation.show_buttons()


func _on_ticket_feature_date_pressed():
	date_confirmation.show_buttons()


func _on_correct_pressed():
	correct_confirmation.show_buttons()

func store_correct_details(details):
	correct_details = details

func _on_origin_guess():
	var correct_guess = !correct_details.is_from_correct(current_ticket)
func _on_destination_guess():
	var correct_guess = !correct_details.is_to_correct(current_ticket)

func _on_date_guess():
	var correct_guess = !correct_details.is_date_correct(current_ticket)

func _on_correct_guess():
	var correct_guess = correct_details.is_ticket_correct(current_ticket)
