extends Node2D

@onready var path = $TrainSpritePath
@onready var pathFollow = $TrainSpritePath/PathFollow2D
@onready var train_sprite = $TrainSpritePath/PathFollow2D/SmallTrain
var timer: Timer
@export var secondsUntilEnd = 0
@onready var origin_label = $Origin
@onready var destination_label = $Destination
@onready var stops_on_the_way = $StopsOnTheWay
var first_time = true
var traverseTime = 0 # Time it takes to traverse the path
var pathLength = 0 # Length of the path

func setup(_timer: Timer):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():	
	train_sprite.play("default")
	pathLength = path.get_curve().get_baked_length()
	print("pathLength: " + str(pathLength))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pathFollow.progress += (pathLength / traverseTime) * delta
	pass

func get_time(time_left):
	if first_time:
		traverseTime = time_left
		first_time = false
func setup_destinations(map):
	origin_label.text = map[0].name
	destination_label.text = map[map.size() - 1].name
	var amount_to_move = calculate_lerp(get_distance(), map.size() - 1)
	var starting_position = origin_label.global_position
	for i in range(1, map.size() -1):
		starting_position.x += amount_to_move
		var new_label = origin_label.duplicate()
		stops_on_the_way.add_child(new_label)
		new_label.global_position = starting_position
		new_label.text = map[i].name
	

func get_distance():
	return destination_label.global_position.x - origin_label.global_position.x

func calculate_lerp(distance, map_size):
	return distance / map_size
