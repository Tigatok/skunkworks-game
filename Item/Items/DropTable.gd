class_name DropTable extends Resource

@export var drop_data = {}

func add_item(monster_id:String, item: ItemData, drop_rate: float) -> void:
	drop_data[monster_id] = {'item': item, 'drop_rate': drop_rate}

func get_drop() -> Array:
	var dropped_items = []
	for item_id in drop_data:
		if randf() <= drop_data[item_id]:
			dropped_items.append(item_id)
	return dropped_items
