extends CharacterBody2D

@onready var animatedSprite : AnimatedSprite2D = $Image

#Explosions
@onready var explosion1 : AnimatedSprite2D = $Explosion
@onready var explosion2 : AnimatedSprite2D = $Explosion2
@onready var explosion3 : AnimatedSprite2D = $Explosion3
func ready():
	animatedSprite.play("default")

func HeAppears():
	explosion1.visible = true
	explosion2.visible = true
	explosion3.visible = true
	
	explosion1.play("default")
	explosion2.play("default")
	explosion3.play("default")
