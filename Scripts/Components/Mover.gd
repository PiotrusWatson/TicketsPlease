extends Node2D

class_name Mover

@onready var speed = 300
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var body : CharacterBody2D
func setup(body2D: CharacterBody2D):
	body = body2D
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func apply_gravity(delta):
	if not body.is_on_floor():
		body.velocity.y += gravity * delta
	
func move(direction):
	if direction:
		body.velocity.x = direction * speed
	else:
		body.velocity.x = move_toward(body.velocity.x, 0, speed)
		
func move_simulated(direction, delta):
	apply_gravity(delta)
	move(direction)
	body.move_and_slide()
	

