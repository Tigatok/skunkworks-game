extends Area2D

@onready var item: Item
@onready var sprite = $ItemIcon

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Players"):
		body.pick_up_item(item)
		queue_free()
