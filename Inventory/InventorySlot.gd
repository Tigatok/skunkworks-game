extends TextureRect

var item:Item : set = set_item, get = get_item

func set_item(value: Item = null) -> void:
	item = value
	texture = value.icon if value else null

func get_item() -> Item:
	return item
