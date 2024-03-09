extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var picked_animation = sprite_frames.animations.pick_random()
	play(picked_animation.name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
