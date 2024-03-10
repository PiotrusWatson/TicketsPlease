extends Node2D

@onready var incorrect = $Incorrect
@onready var cancel = $Cancel
signal guess
# Called when the node enters the scene tree for the first time.
func _ready():
	_on_cancel_pressed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hide_buttons():
	incorrect.visible = false
	incorrect.disabled = true
	cancel.visible = false
	cancel.disabled = true
	
func show_buttons():
	incorrect.visible = true
	incorrect.disabled = false
	cancel.visible = true
	cancel.disabled = false

func _on_cancel_pressed():
	hide_buttons()


func _on_incorrect_pressed():
	hide_buttons()
	guess.emit()
