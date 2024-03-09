extends StaticBody2D

@onready var image = $Image
@onready var spawner = $RandomSpawner
# Called when the node enters the scene tree for the first time.

func setup():
	spawner.spawn_all()
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func show_size():
	return image.calculate_size()
