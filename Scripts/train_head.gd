extends CharacterBody2D

@onready var animatedSprite : AnimatedSprite2D = $Image
func ready():
	animatedSprite.play("default")
