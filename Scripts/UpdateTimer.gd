extends Node2D

var stopped = false
@export var timerCountdownMinutes = 0
@export var timerCountdownSeconds = 0
@onready var timer_label = $TimerTime
@onready var timer = $Timer
signal TimesUp

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if stopped:
		return
	var seconds = int(timer.time_left) % 60
	var minutes = int(timer.time_left) / 60
	if seconds < 10:
		timer_label.text = str(minutes) + ":0" + str(seconds)
	else:
		timer_label.text = str(minutes) + ":" + str(seconds)

func _on_timer_timeout():
	timer_label.text = "Time's up!"
	stopped = true
