extends Camera2D

@export var thing_to_follow: PhysicsBody2D
@export var camera_speed = 0.4
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x = lerp(global_position.x, thing_to_follow.global_position.x, camera_speed)
