extends Label

@export var timerStatus = 1
# Timer Statuses
# 0 = Paused
# 1 = Active
# 2 = Reset, go to Paused
@export var frameRate = 0.0
@export var timerCountdownMinutes = 0
@export var timerCountdownSeconds = 0
@export var timerCountdownFrames = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	frameRate = Performance.get_monitor(Performance.TIME_FPS)
	print(frameRate)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timerStatus == 1:
		timerCountdownFrames -= 1
		if timerCountdownFrames <= 0:
			timerCountdownFrames = frameRate
			timerCountdownSeconds -= 1
		if timerCountdownSeconds <= 0:
			timerCountdownSeconds = 59
			timerCountdownMinutes -= 1
		text = str(timerCountdownMinutes) + ":" + str(timerCountdownSeconds)
	pass
