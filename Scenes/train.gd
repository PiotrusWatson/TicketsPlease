extends StaticBody2D


@onready var spawner = $RandomSpawner
# Called when the node enters the scene tree for the first time.
func _ready():
	spawner.spawn_all()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
