extends ColorRect

var item:Item : set = set_item, get = get_item
func set_item(value: Item = null) -> void:
	item = value
	$TextureRect.texture = value.icon if value else null
	
func get_item() -> Item:
	return item

func _on_update_active_slot(slot):
	if (slot != self):
		color = Color.hex(0xffffff00)
	else:
		color = Color.hex(0xffffff55)
