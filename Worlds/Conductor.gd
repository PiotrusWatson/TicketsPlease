extends CharacterBody2D


@onready var mover = $Mover
@onready var animated_sprite = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	mover.setup(self)

func _physics_process(delta):
	var direction = Input.get_axis("Left", "Right")
	
	set_sprite_direction(direction)
	if direction:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	mover.move_simulated(direction, delta)
	
func set_sprite_direction(direction):
	if direction < 0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false


