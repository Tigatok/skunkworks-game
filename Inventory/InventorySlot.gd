extends ColorRect

var item:Item : set = set_item, get = get_item

func set_item(value: Item = null) -> void:
	item = value
	$TextureRect.texture = value.icon if value else null
	size.x = 64
	size.y = 64
	position = $TextureRect.position

func get_item() -> Item:
	return item
