class_name Ticket

var from_and_to: PlaceRange
var date: Date
	
func _init(_date, _place_range):
	date = _date
	from_and_to = _place_range
	
func is_correct(todays_date, next_destination):
	return todays_date.equals(date) and from_and_to.is_in_range(next_destination)

static func generate_correct_ticket(correct_date: Date, place_range_builder: PlaceRangeBuilder):
	var place_range = place_range_builder.generate_correct_range()
	return Ticket.new(correct_date, place_range)
	
static func generate_bad_ticket_bad_date(correct_date: Date, place_range_builder: PlaceRangeBuilder):
	return Ticket.new(Date.generate_bad_date(correct_date), place_range_builder.generate_correct_range())

static func generate_bad_ticket_bad_range(correct_date: Date, place_range_builder: PlaceRangeBuilder):
	return Ticket.new(correct_date, place_range_builder.generate_bad_range())

static func generate_bad_ticket(correct_date: Date, place_range_builder: PlaceRangeBuilder):
	var is_bad_range = randi_range(0, 1)
	if is_bad_range:
		return generate_bad_ticket_bad_range(correct_date, place_range_builder)
	else:
		return generate_bad_ticket_bad_date(correct_date, place_range_builder)

