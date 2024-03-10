class_name Place

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
