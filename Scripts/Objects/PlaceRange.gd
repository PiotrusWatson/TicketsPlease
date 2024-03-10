class_name PlaceRange

var from: Place 
var to: Place
	
func _init(_from, _to):
	from = _from
	to = _to
	
func is_station_before_from(place: Place):
	if from.get_position()== -1:
		return false
	return from.equals(place) >= 0
	
func is_station_after_to(place: Place):
	if to.get_position() == -1:
		return false
	return to.equals(place) < 0
func is_in_range(place : Place):
	return is_station_before_from(place) and is_station_after_to(place)
