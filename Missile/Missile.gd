extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y -= 64
	var velocity = Vector2(0,-400)
	linear_velocity = velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= 4



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

# Given the player's position, spawn a missile.
# The missile will always go in the direction, at a constant speed.
