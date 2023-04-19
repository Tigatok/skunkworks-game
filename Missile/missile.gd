extends Area2D
@export var speed = 400
var damage

func _ready():
	set_as_top_level(true)

func _physics_process(delta):
	position.y -= delta * speed

# Missile has entered a body
func _on_body_entered(body):
	if not body.name == 'Monster':
		return
	body.takeDamage(self)
	queue_free()
