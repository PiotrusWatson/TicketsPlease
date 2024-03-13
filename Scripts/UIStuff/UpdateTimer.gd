extends Node2D

@onready var timer_label = $TimerTime
signal TimesUp

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func show_time(time_left):
	var seconds = int(time_left) % 60
	var minutes = int(time_left) / 60
	
	if seconds < 10:
		timer_label.text = str(minutes) + ":0" + str(seconds)
	else:
		timer_label.text = str(minutes) + ":" + str(seconds)

func times_up():
	timer_label.text = "Time's up!"

