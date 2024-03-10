class_name PlaceRangeBuilder

enum PossibleBadPositions{BAD_FROM, BAD_TO, BAD_BOTH}

var map: Array[Place]
	#point we just left :)
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
	return map[current_stop.position + 1 + randi() % (map.size() - (current_stop.position + 1))]

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
