extends Node

@export var thing_to_spawn: PackedScene
@export var container_of_spawns: Node
@export var max_to_spawn = 5
var spawn_points: Array[Node2D]
var has_spawned_at_points: Array[bool]

# Called when the node enters the scene tree for the first time.
func _ready():
	for spawn in container_of_spawns.get_children():
		spawn_points.append(spawn)
		has_spawned_at_points.append(false)
	if max_to_spawn > spawn_points.size():
		max_to_spawn = spawn_points.size()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func spawn_at_point(index):
	var spawned_thing = thing_to_spawn.instantiate()
	add_child(spawned_thing)
	spawned_thing.global_position = spawn_points[index].global_position
	has_spawned_at_points[index] = true
	return spawned_thing
	
func spawn_at_random_point():
	var picked_index = randi() % spawn_points.size()
	if has_spawned_at_points[picked_index]:
		return false
	spawn_at_point(picked_index)
	return true

func spawn_all():
	var spawn_count = 0
	print(spawn_points[0].global_position)
	while spawn_count < max_to_spawn:
		if spawn_at_random_point():
			spawn_count += 1
