class_name Ticket

var from_and_to: PlaceRange
var date: Date
	
func _init(_date, _place_range):
	date = _date
	from_and_to = _place_range
	
func is_correct(todays_date, next_destination):
	return todays_date.equals(date) and from_and_to.is_in_range(next_destination)
