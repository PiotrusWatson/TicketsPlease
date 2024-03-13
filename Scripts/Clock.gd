extends Timer
class_name Clock

signal tick(timeleft)

@onready var ticker = $Tick
func _on_tick_timeout():
	tick.emit(time_left)


func _on_timeout():
	ticker.stop()
	ticker.autostart = false
	
func start_clock():
	ticker.start()
	start()
