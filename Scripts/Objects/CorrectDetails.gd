class_name CorrectDetails

var date: Date
var current_stop: Place

func _init(_date: Date, _current_stop: Place):
	date = _date
	current_stop = _current_stop
	
func is_date_correct(other_ticket: Ticket):
	return other_ticket.date.equals(date)

func is_from_correct(other_ticket: Ticket):
	return other_ticket.from_and_to.is_station_before_from(current_stop)

func is_to_correct(other_ticket: Ticket):
	return other_ticket.from_and_to.is_station_after_to(current_stop)

func is_ticket_correct(other_ticket: Ticket):
	return is_date_correct(other_ticket) and is_from_correct(other_ticket) and is_to_correct(other_ticket)
