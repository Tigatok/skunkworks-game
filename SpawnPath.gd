extends Path2D
@onready var player = $".."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x = player.position.x - 956
	position.y = player.position.y - 560
