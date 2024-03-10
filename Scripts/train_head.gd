extends CharacterBody2D

@onready var animatedSprite : AnimatedSprite2D = $Image

#Explosions
@onready var explosion1 : Node2D = $Explosion
@onready var explosion2 : Node2D = $Explosion2
@onready var explosion3 : Node2D = $Explosion3
func ready():
	animatedSprite.play("default")

func HeAppears():
	explosion1.visible = true
	explosion2.visible = true
	explosion3.visible = true
	
	explosion1.play("default")
	explosion2.play("default")
	explosion3.play("default")
