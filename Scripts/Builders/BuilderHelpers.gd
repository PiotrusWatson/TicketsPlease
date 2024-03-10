class_name BuilderHelpers

static func make_current_stop(map: Array[Place]):
	return map[randi() % (map.size() - 1)]
	
static func make_possible_places(names):
	var possible_places : Array[Place]
	for name in names:
		possible_places.append(Place.new(name, -1))
	return possible_places
	
static func build_map(possible_places: Array[Place], number_of_stops: int):
	var counter = 0
	var map : Array[Place]
	while counter < number_of_stops:
		var selected_index = randi() % possible_places.size()
		if possible_places[selected_index].position == -1:
			possible_places[selected_index].position = counter
			counter += 1
			map.append(possible_places[selected_index])
	return map
	


