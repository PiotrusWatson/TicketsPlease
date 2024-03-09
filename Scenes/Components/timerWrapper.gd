extends Node2D

@onready var timer = $TimerTime
@export var timerCountdownMinutes = 0
@export var timerCountdownSeconds = 0
@export var timerStatus = 1
# Timer Statuses
# 0 = Paused
# 1 = Active
# 2 = Reset, go to Paused


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timerCountdownMinutes = timerCountdownMinutes
	timer.timerCountdownSeconds = timerCountdownSeconds
	timer.timerStatus = timer.timerStatus


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
