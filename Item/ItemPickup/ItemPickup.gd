extends Area2D

@onready var item: Item
@onready var sprite = $ItemIcon
@export var texture:Texture

func _ready():
	item = get_parent()
	if(texture):
		sprite.texture = texture

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Players"):
		body.pick_up_item(item)
		queue_free()
