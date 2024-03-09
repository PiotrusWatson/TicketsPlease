extends Node

enum PossibleBadPositions{BAD_FROM, BAD_TO, BAD_BOTH}


class Date:
	var day : int
	var month : int
	
	func _init(_day, _month):
		day = _day
		month = _month
	func make_month(month_number):
		var months = ["JAN", "FEB", "MAR", 
		"APR", "MAY", "JUN", "JUL", "AUG",
		"SEP", "OCT", "NOV", "DEC"]
		return months[month_number - 1]
	func equals(otherDate: Date):
		return otherDate.day == day and otherDate.month == month
	func _to_string():
		return str(day) + "-" + make_month(month) + "-24" 


var Names = ["Bimbleby", "Shepherds Crease", "Sprunton", 
"Kabmeelington", 
	"Thankful and be Rested",  "Bromp", 
	"Fruntlidge Wells",
	"Wimble", "Crundridge", "Frollop", "Tentleworth", 
	"Crim", 
	"Sporch",
"Longtaint",
"Supplepool",
"Bingsearch",
"Boofapint",
"Kickmascrote", 
"Smelch",
"Bastardshire",
"Stankleg",
"Ballerdunk",
"Bert",
"Loch Thador",
"Stiffer's Hollow",
"Chortle",
"Swimpool",
"Southnorth",
"West Southnorth"]

func make_current_stop(map: Array[Place]):
	return map[randi() % (map.size() - 1)]
func make_possible_places():
	var possible_places : Array[Place]
	for name in Names:
		possible_places.append(Place.new(name, -1))
	return possible_places
	
class MapBuilder:
	var possible_places: Array[Place]

	func _init(_possible_places: Array[Place]):
		possible_places = _possible_places
	
	func build_map(number_of_stops: int):
		var counter = 0
		var map : Array[Place]
		while counter < number_of_stops:
			var selected_index = randi() % possible_places.size()
			if possible_places[selected_index].position == -1:
				possible_places[selected_index].position = counter
				counter += 1
			map.append(possible_places[selected_index])
		return map
	
	
				
class IncorrectTicketBuilder:
	var current_date : Date
	var place_range_builder: PlaceRangeBuilder
	var date_builder: DateBuilder
	func _init(_current_date: Date, _place_range_builder: PlaceRangeBuilder):
		current_date = _current_date
		place_range_builder = _place_range_builder
		date_builder = DateBuilder.new()
	
	func generate_incorrect_ticket():
		var bad_place = randi_range(0, 2)
		if bad_place == 0:
			var date = current_date
			while date.equals(current_date):
				date = date_builder.GenerateDate()
			return Ticket.new(date, place_range_builder.generate_correct_range())
		else:
			return Ticket.new(current_date, place_range_builder.generate_bad_range())
class Place:
	var name: String
	var position: int
	
	func _init(_name, _position):
		name = _name
		position = _position
	
	func equals(otherPlace: Place):
		return otherPlace.position - position
		
	func _to_string():
		return name
	func get_position():
		return position

class PlaceRange:
	var from: Place 
	var to: Place
	
	func _init(_from, _to):
		from = _from
		to = _to
	
	func is_in_range(place : Place):
		if from.position == -1 or to.position == -1:
			return false
		var ahead_of_from = from.equals(place) >= 0
		var before_to = to.equals(place) <= 0
		return ahead_of_from and before_to
		
class Ticket:
	var from_and_to: PlaceRange
	var date: Date
	
	func _init(_date, _place_range):
		date = _date
		from_and_to = _place_range
	
	func is_correct(todays_date, next_destination):
		return todays_date.equals(date) and from_and_to.is_in_range(next_destination)

class CorrectDetails:
	var date: Date
	var map: Array[Place]
	var current_stop: Place
	var place_range_builder: PlaceRangeBuilder
	
	func _init(_date: Date, _map: Array[Place], _current_stop, _place_range_builder):
		date = _date
		map = _map
		current_stop = _current_stop
		place_range_builder = _place_range_builder
	
	
			
	func GenerateCorrectTicket():
		var place_range = place_range_builder.generate_correct_range()
		return Ticket.new(date, place_range)
		
		
class DateBuilder:
	func GenerateDate():
		var dayCalc = (randi() % 29) + 1
		var monthCalc = (randi() % 11) + 1
		return Date.new(dayCalc, monthCalc)
	

class PlaceRangeBuilder:
	var map: Array[Place]
	var current_stop: Place
	var all_stops: Array[Place]
	
	func _init(_map: Array[Place], _current_stop: Place, _all_stops: Array[Place]):
		map = _map
		current_stop = _current_stop
		all_stops = _all_stops
	func pick_stop_before_current():
		if current_stop.position == 0:
			return current_stop
		else:
			return map[randi() % (current_stop.position + 1)]
			
	func pick_stop_after_current():
		return map[current_stop.position + randi() % (map.size() - current_stop.position)]

	func generate_correct_range():
		var good_range = PlaceRange.new(current_stop, current_stop)
		while good_range.from == good_range.to:
			good_range = PlaceRange.new(pick_stop_before_current(), pick_stop_after_current())
		return good_range
	func find_bad_stop():
		var current_position = 0
		var bad_stop = null
		while current_position != -1:
			bad_stop = all_stops[randi() % all_stops.size()]
			current_position = bad_stop.position
		return bad_stop
	
	func generate_bad_range():
		var bad_choice = int(PossibleBadPositions.keys()[randi() % PossibleBadPositions.size()])
		var bad_range = PlaceRange.new(current_stop, current_stop)
		while bad_range.from == bad_range.to:
			if bad_choice == PossibleBadPositions.BAD_FROM:
				bad_range = PlaceRange.new(find_bad_stop(), pick_stop_after_current())
			elif bad_choice == PossibleBadPositions.BAD_TO:
				bad_range = PlaceRange.new(pick_stop_before_current(), find_bad_stop())
			else:
				bad_range = PlaceRange.new(find_bad_stop(), find_bad_stop())
		return bad_range
