extends Node2D

@export var scaleUpperThreshold = Vector2(1.05,1.05)
@export var scaleLowerThreshold = Vector2(0.95,0.95)
@export var scaleRate = 0.001

var expandTextX = true
var contractTextX = false
var expandTextY = true
var contractTextY = false

@export var rotationLeftThresholdDeg = -5
@export var rotationRightThresholdDeg = 5
var rotationLeftThresholdRad = deg_to_rad(rotationLeftThresholdDeg)
var rotationRightThresholdRad = deg_to_rad(rotationRightThresholdDeg)
@export var rotationRate = 0.001
var rotateLeft = true
var rotateRight = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
# Manage rotation
	if rotateLeft:
		rotation += randf() * rotationRate
	if rotateRight:
		rotation -= randf() * rotationRate
	if rotation <= rotationLeftThresholdRad:
		rotateLeft = true
		rotateRight = false
	if rotation >= rotationRightThresholdRad:
		rotateLeft = false
		rotateRight = true

# Manage on X axis
	if expandTextX:
		scale.x += randf() * scaleRate
	if contractTextX:
		scale.x -= randf() * scaleRate
	if scale.x >= scaleUpperThreshold.x:
		contractTextX = true
		expandTextX = false
	if scale.x <= scaleLowerThreshold.x:
		contractTextX = false
		expandTextX = true

#Manage on Y axis
	if expandTextY:
		scale.y += randf() * scaleRate
	if contractTextY:
		scale.y -= randf() * scaleRate

	if scale.y >= scaleUpperThreshold.y:
		contractTextY = true
		expandTextY = false

	if scale.y <= scaleLowerThreshold.y:
		contractTextY = false
		expandTextY = true

	pass
