extends Path2D


@onready var pathFollow = $BigTicketPathFollow
@onready var origin = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureOrigin
@onready var destination = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureDestination2
@onready var ticket_feature_date = $BigTicketPathFollow/BigTicket/BigTicketImage/TicketFeatureDate
var showTicket = false

var traverseTime = 5 # Time it takes to traverse the path
var t = 0 # Active time along the path
var pathLength = 0 # Length of the path

var current_ticket: Globals.Ticket
var origin_sus = false
var destination_sus = false
var date_sus = false
var ticket_correct = false

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


func _on_ticket_feature_origin_toggled(toggled_on):
	origin_sus = toggled_on

func _on_ticket_feature_destination_2_toggled(toggled_on):
	destination_sus = toggled_on

func _on_ticket_feature_date_toggled(toggled_on):
	date_sus = toggled_on
	

