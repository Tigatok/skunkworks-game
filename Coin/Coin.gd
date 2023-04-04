extends Sprite2D

@export var value = 5

func _on_area_2d_body_entered(body):
	var name = body.name
	if (name != 'Player'):
		return
	body.collectCoin()
	queue_free()
